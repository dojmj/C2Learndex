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
    @Query(sort: \Learner.name) var learners: [Learner] //영구 저장된 도감 불러오기
    
    var unlockedCount: Int {
        learners.filter{ $0.isUnlocked }.count
    }
    
    var body: some View {
        VStack {
            Text("Learndex")
                .font(.largeTitle)
                .bold()
            
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
        .onAppear{
            checkAndInsertData()
        }
        .ignoresSafeArea(edges: .bottom)
    }
    
    private func checkAndInsertData() {
        if learners.isEmpty {
            print("데이터 생성 중...")
            
            let initialLearners = SampleData.shared.getInitialLearners()
            
            for learner in initialLearners {
                modelContext.insert(learner)
            }
            
            try? modelContext.save()
        }
    }
}

#Preview {
    // 1. 메모리용 컨테이너 생성
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Learner.self, configurations: config)
    
    // 2. 프리뷰에서 '잠금 해제'된 모습을 테스트하고 싶다면 데이터를 직접 넣어줍니다.
    let sample = Learner(nickname: "Ahae", name: "조민지", session: .morning,
                         imageName: "character1", introDetail: "...",
                         strengths: [], interests: [])
    sample.isUnlocked = true // 프리뷰에서 진행도가 올라간 걸 확인하기 위해!
    
    container.mainContext.insert(sample)
    
    return ContentView()
        .modelContainer(container)
}
