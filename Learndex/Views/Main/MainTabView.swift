//
//  MainTabView.swift
//  Learndex
//
//  Created by 조민지 on 4/22/26.
//

import SwiftUI
import SwiftData

struct MainTabView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var selectedFilter: SessionType = .morning
    
    //data
    @Query(sort: \Learner.name) var learners: [Learner] //영구 저장된 도감 불러오기
    @Query(filter: #Predicate<Learner> { $0.isMe == true }) private var myProfile: [Learner]
    
    //multipeer
    @State private var multipeerService: MultipeerService?
    @State private var showExchange = false
    
    //검색
    @State private var searchText = ""
    @State private var isSearchFieldPresented = false
    
    var unlockedCount: Int {
        learners.filter{ $0.isUnlocked }.count
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Learndex")
                        .font(.largeTitle)
                        .bold()
                    
                    Spacer() // 글자를 왼쪽으로, 아이콘을 오른쪽으로 밉니다.
                    
                    Button {
                        showExchange = true
                    } label: {
                        Image(systemName: "antenna.radiowaves.left.and.right")
                            .font(.title2)
                            .foregroundStyle(.indigo)
                    }
                }
                .padding(.top, 10)
                
                SessionPickerView(selectedFilter: $selectedFilter)
                
                
                HStack {
                    ProgressView(value: Double(unlockedCount), total: Double(learners.count))
                        .progressViewStyle(.linear)
                        .padding(5)
                        .scaleEffect(x: 1, y: 2, anchor: .center)
                        .tint(.indigo)
                    Text("\(unlockedCount) / \(learners.count)")
                        .font(.body)
                        .bold(true)
                }
                
                LearnerGridView(selectedSession: $selectedFilter)
                
                
            }
            .padding()
            .ignoresSafeArea(edges: .bottom)
            
            .onDisappear {
                multipeerService?.stop()
            }
            
            .sheet(isPresented: $showExchange) {
                if let service = multipeerService {
                    NearbyPeersView(service: service)
                        .presentationDetents([.medium])
                }
            }
            
            .onAppear {
                // '나'의 닉네임을 가져와서 서비스를 시작
                if let me = myProfile.first, multipeerService == nil {
                    let service = MultipeerService(nickname: me.nickname)
                    service.modelContext = modelContext // DB 연동
                    service.start()
                    multipeerService = service
                }
            }
        }
    }
}



#Preview {
    // 1. 메모리용 컨테이너 생성
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Learner.self, configurations: config)
    
    // 2. '나'에 해당하는 샘플 데이터 생성
    let me = Learner(
        nickname: "Ahae",
        name: "조민지",
        isMe: true,
        session: .morning,
        imageName: "character1",
        introDetail: "반가워요!",
        strengths: ["Swift"],
        interests: ["SwiftUI"]
    )
    me.isUnlocked = true
    
    // 3. 비교를 위한 다른 러너 데이터도 하나 넣어볼까요?
    let other = Learner(
        nickname: "Myong",
        name: "김묭",
        isMe: false,
        session: .afternoon,
        imageName: "character2",
        introDetail: "안녕!",
        strengths: [], interests: []
    )
    
    // 컨테이너에 데이터 삽입
    container.mainContext.insert(me)
    container.mainContext.insert(other)
    
    return MainTabView()
        .modelContainer(container)
}

