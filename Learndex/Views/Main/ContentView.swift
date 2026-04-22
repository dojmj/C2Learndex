//
//  ContentView.swift
//  Learndex
//
//  Created by 조민지 on 4/21/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var selectedFilter: SessionType = .morning
    @Query(filter: #Predicate<Learner> { $0.isMe == true }) private var myProfile: [Learner]
    @Query var allLearners: [Learner]
    
    var body: some View {
        Group {
            if myProfile.isEmpty {
                OnboardingView()
            } else {
                MainTabView()
            }
        }
        
        .onAppear{
            checkAndInsertData()
        }
    }
    
    private func checkAndInsertData() {
        // 모든 러너 데이터가 비어있을 때만 실행
        if allLearners.isEmpty {
            print("데이터 생성 중...")
            let initialLearners = SampleData.shared.getInitialLearners()
            for learner in initialLearners {
                modelContext.insert(learner)
            }
            try? modelContext.save()
            print("✅ 데이터 주입 완료!")
        }
    }
}

#Preview {
    // 1. 프리뷰용 임시 데이터베이스 생성
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Learner.self, configurations: config)
    
    // 2. (선택사항) 만약 '이미 로그인된 상태'를 보고 싶다면 여기서 '나'를 추가하면 됩니다.
    // let me = Learner(nickname: "Minji", isMe: true ...)
    // container.mainContext.insert(me)
    
    return ContentView()
        .modelContainer(container)
}
