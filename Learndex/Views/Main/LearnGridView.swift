//
//  LearnGridView.swift
//  Learndex
//
//  Created by 조민지 on 4/21/26.
//

import SwiftUI
import SwiftData

struct LearnerGridView: View {
    @Query(sort: \Learner.nickname) private var learners: [Learner]
    @Binding var selectedSession: SessionType
    
    
    //alert
    @State private var showAlert = false
    @State private var selectedLearner: Learner?
    @State private var navigateToDetail = false
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(learners.filter { selectedSession == .all ? true : $0.session == selectedSession }) { learner in
                        
                        VStack {
                            if learner.isUnlocked {
                                NavigationLink(destination: EnvelopeComponent(selectedLearner: .constant(learner),
                                                                              selectedSession: $selectedSession,
                                                                              learner: learner,
                                                                              isTorn: .constant(learner.isOpened) // 초기 상태 전달
                                                                             )) {
                                    Image("\(learner.imageName)")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 100, height: 100)
                                        .shadow(radius: 3)
                                }
                            } else {
                                Image(systemName: "questionmark.app.fill")
                                    .font(.system(size: 100))
                                    .foregroundColor(.gray.opacity(0.5))
                                    .frame(width: 100, height: 100)
                                    .onTapGesture {
                                        learner.isUnlocked.toggle()
                                        selectedLearner = learner
                                        showAlert = true
                                        
                                        //햅틱
                                        let generator = UIImpactFeedbackGenerator(style: .heavy)
                                        generator.impactOccurred()
                                    }
                            }
                            
                            Text(learner.nickname)
                                .font(.body)
                                .bold()
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
            }
            .alert("잠금 해제 성공!",isPresented: $showAlert) {
                Button("나중에", role: .cancel) {
                    print("나중에 보기 클릭")
                }
                Button("확인하러 가기") {
                    navigateToDetail = true
                }
                
            } message: {
                Text("\(selectedLearner?.nickname ?? "러너")님의 프로필이 열렸습니다🥳\n어떤 분인지 확인해보시겠어요? ")
            }
            .navigationDestination(isPresented: $navigateToDetail) {
                if let learner = selectedLearner {
                    EnvelopeComponent(
                        selectedLearner: $selectedLearner,
                        selectedSession: $selectedSession,
                        learner: learner,
                        isTorn: .init(get: { learner.isOpened }, set: { learner.isOpened = $0 })
                    )
                }
            }
        }
    }
}



//#Preview {
//    LearnerGridView(selectedSession: .constant(.all))
//}
