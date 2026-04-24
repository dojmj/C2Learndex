//
//  NeerbyPeersView.swift
//  Learndex
//
//  Created by 조민지 on 4/22/26.
//

import SwiftUI
import MultipeerConnectivity

struct NearbyPeersView: View {
    @Bindable var service: MultipeerService
    @State private var isAnimating = false // 파동 애니메이션용
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack {
                Image(systemName: "antenna.radiowaves.left.and.right")
                    .foregroundStyle(.indigo)
                    .symbolEffect(.variableColor.iterative, isActive: service.availablePeers.isEmpty)
                
                Text(service.availablePeers.isEmpty ? "Searching for Learners..." : "Nearby Learners")
                    .font(.system(.headline, design: .rounded))
                    .bold()
                    .foregroundStyle(.secondary)
                    .padding(.vertical, 10)
            }
            .padding(.horizontal)

            if service.availablePeers.isEmpty {
                // 아무도 없을 때 보여줄 검색 중 화면
                HStack {
                    Spacer()
                    ZStack {
                        Circle()
                            .stroke(.indigo.opacity(0.3))
                            .frame(width: 40, height: 40)
                            .scaleEffect(isAnimating ? 2.5 : 1)
                            .opacity(isAnimating ? 0 : 1)
                        
                        Circle()
                            .fill(.indigo)
                            .frame(width: 15, height: 15)
                    }
                    .onAppear {
                        withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: false)) {
                            isAnimating = true
                        }
                    }
                    Spacer()
                }
                .frame(height: 330)
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 25) {
                        ForEach(service.availablePeers, id: \.self) { peer in
                            Button {
                                // 탭하면 연결 요청!
                                service.browserInvite(peer)
                            } label: {
                                VStack(spacing: 8) {
                                    ZStack {
                                        Circle()
                                            .fill(LinearGradient(colors: [.indigo, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
                                            .frame(width: 60, height: 60)
                                        
                                        Text(String(peer.displayName.prefix(1)).uppercased())
                                            .font(.title2.bold())
                                            .foregroundStyle(.white)
                                        
                                        // 연결된 상태라면 체크표시
                                        if service.connectedPeers.contains(peer) {
                                            Image(systemName: "checkmark.circle.fill")
                                                .foregroundStyle(.green)
                                                .background(Circle().fill(.white))
                                                .offset(x: 22, y: 22)
                                        }
                                    }
                                    
                                    Text(peer.displayName)
                                        .font(.caption)
                                        .fontWeight(.medium)
                                        .foregroundStyle(.primary)
                                    
                                    Spacer()
                                }
                            }
                            .transition(.scale.combined(with: .opacity))
                        }
                    }
                    .frame(height: 330)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 10)
                }
            }
        }
        .padding(.vertical)
        .padding(.horizontal)
    }
}

#Preview("NearbyPeersView - 상태별 확인") {
    struct PreviewWrapper: View {
        @State var emptyService = MultipeerService(nickname: "Ahae")
        @State var mockService: MultipeerService = {
            let service = MultipeerService(nickname: "Ahae")
            service.availablePeers = [
                MCPeerID(displayName: "Myong"),
                MCPeerID(displayName: "Zeze"),
                MCPeerID(displayName: "Dora")
            ]
            service.connectedPeers = [service.availablePeers[0]]
            return service
        }()
        
        var body: some View {
            VStack(spacing: 30) {
                // 1. 검색 중인 상태
                NearbyPeersView(service: emptyService)
                
                // 2. 주변에 사람이 발견된 상태
                NearbyPeersView(service: mockService)
            }
        }
    }
    
    return PreviewWrapper()
        .preferredColorScheme(.dark)
}
