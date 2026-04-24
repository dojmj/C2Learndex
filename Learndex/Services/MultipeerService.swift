//
//  MultipeerService.swift
//  Learndex
//
//  Created by 조민지 on 4/22/26.
//

import MultipeerConnectivity
import Observation
import SwiftData

@Observable
class MultipeerService: NSObject {
    private let serviceType = "learndex-share"
    private var myPeerID: MCPeerID
    private let serviceAdvertiser: MCNearbyServiceAdvertiser
    private let serviceBrowser: MCNearbyServiceBrowser
    private let session: MCSession
    
    var connectedPeers: [MCPeerID] = []
    var availablePeers: [MCPeerID] = [] // 🚩 주변에 탐지된 사람 리스트
    var modelContext: ModelContext?

    init(nickname: String) {
        let peer = MCPeerID(displayName: nickname)
        self.myPeerID = peer
        self.session = MCSession(peer: peer, securityIdentity: nil, encryptionPreference: .required)
        self.serviceAdvertiser = MCNearbyServiceAdvertiser(peer: peer, discoveryInfo: nil, serviceType: "learndex")
        self.serviceBrowser = MCNearbyServiceBrowser(peer: peer, serviceType: "learndex")
        
        super.init()
        
        self.session.delegate = self
        self.serviceAdvertiser.delegate = self
        self.serviceBrowser.delegate = self
    }

    // 🚩 중복되었던 start를 하나로 합침
    func start() {
        availablePeers.removeAll()
        serviceAdvertiser.startAdvertisingPeer()
        serviceBrowser.startBrowsingForPeers()
    }

    func stop() {
        serviceAdvertiser.stopAdvertisingPeer()
        serviceBrowser.stopBrowsingForPeers()
        session.disconnect()
    }

    // 🚩 에어드랍처럼 클릭했을 때 실행할 초대 함수
    func browserInvite(_ peerID: MCPeerID) {
        serviceBrowser.invitePeer(peerID, to: self.session, withContext: nil, timeout: 10)
    }

    func sendMyNickname() {
        guard !session.connectedPeers.isEmpty else { return }
        if let data = myPeerID.displayName.data(using: .utf8) {
            try? session.send(data, toPeers: session.connectedPeers, with: .reliable)
        }
    }
}

// MARK: - Delegate 구현
extension MultipeerService: MCSessionDelegate, MCNearbyServiceAdvertiserDelegate, MCNearbyServiceBrowserDelegate {
    
    // 1. 브라우저: 사람을 찾았을 때 (에어드랍 리스트 업데이트)
    func browser(_ browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String : String]?) {
        DispatchQueue.main.async {
            // 이미 리스트에 있거나 나 자신이면 무시
            if !self.availablePeers.contains(peerID) {
                self.availablePeers.append(peerID)
            }
        }
    }

    // 2. 브라우저: 사람이 사라졌을 때
    func browser(_ browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
        DispatchQueue.main.async {
            self.availablePeers.removeAll(where: { $0 == peerID })
        }
    }

    // 3. 세션: 데이터 받았을 때
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        if let receivedNickname = String(data: data, encoding: .utf8) {
            DispatchQueue.main.async {
                self.unlockLearner(nickname: receivedNickname)
            }
        }
    }

    private func unlockLearner(nickname: String) {
        let fetchDescriptor = FetchDescriptor<Learner>(
            predicate: #Predicate { $0.nickname == nickname }
        )
        if let learner = try? modelContext?.fetch(fetchDescriptor).first {
            learner.isUnlocked = true
            try? modelContext?.save()
            print("🎉 \(nickname) 해제 완료!")
        }
    }

    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        if state == .connected {
                DispatchQueue.main.sync {
                    let peerName = peerID.displayName
                    
                    // 1. 전체 러너 중 닉네임이 일치하는 사람 찾기
                    let fetchDescriptor = FetchDescriptor<Learner>(
                        predicate: #Predicate { $0.nickname == peerName }
                    )
                    
                    if let targetLearner = try? modelContext?.fetch(fetchDescriptor).first {
                        targetLearner.isUnlocked = true
                        print("\(peerName)님의 카드 잠금 해제 완료!")
                        
                        HapticManager.instance.notification(type: .success)
                    }
                }
            }
        }

    // 필수 메서드들
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {}
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {}
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {}
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        invitationHandler(true, self.session) // 초대받으면 자동 수락
    }
}
