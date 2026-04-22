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
            // 상단 타이틀 및 상태
            HStack {
                Image(systemName: "antenna.radiowaves.left.and.right")
                    .foregroundStyle(.indigo)
                    .symbolEffect(.variableColor.iterative, isActive: service.availablePeers.isEmpty)
                
                Text(service.availablePeers.isEmpty ? "Searching for Learners..." : "Nearby Learners")
                    .font(.system(.subheadline, design: .rounded))
                    .bold()
                    .foregroundStyle(.secondary)
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
                            .frame(width: 10, height: 10)
                    }
                    .onAppear {
                        withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: false)) {
                            isAnimating = true
                        }
                    }
                    Spacer()
                }
                .frame(height: 80)
            } else {
                // 🚩 에어드랍 스타일 가로 스크롤 리스트
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
                                }
                            }
                            .transition(.scale.combined(with: .opacity))
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 10)
                }
            }
        }
        .padding(.vertical)
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(Color(.systemGray6).opacity(0.5))
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
        )
        .padding(.horizontal)
    }
}

#Preview("NearbyPeersView - 상태별 확인") {
    // 🚩 @Bindable을 위해 상태를 가질 수 있는 임시 뷰를 정의합니다.
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
