//
//  LearnerCardView.swift
//  Learndex
//
//  Created by 조민지 on 4/22/26.
//

import SwiftUI
import SwiftData

struct LearnerCardView: View {
    @Bindable var learner: Learner
    @State private var isFlipped = false
    
    var body: some View {
        ZStack {
            CardFrontView(learner: learner)
                .opacity(isFlipped ? 0.0 : 1.0)
            CardBackView(learner: learner)
                .opacity(isFlipped ? 1.0 : 0.0)
                .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
        }
        .rotation3DEffect(.degrees(isFlipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
        .onTapGesture {
            withAnimation {
                isFlipped.toggle()
            }
        }
    }
}

#Preview {
    // 1. SwiftData 임시 저장소 설정
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Learner.self, configurations: config)
    
    // 2. 프리뷰에서 보여줄 가짜 러너 데이터 생성
    let mockLearner = Learner(
        nickname: "Myong",
        name: "김현서",
        session: .morning,
        imageName: "character2"
    )
    
    // 데이터 초기값 설정
    mockLearner.isUnlocked = true
    mockLearner.intro = "반갑습니다!"
    mockLearner.memo = "여기에 메모를 입력해보세요."
    mockLearner.strengths = ["SwiftUI", "Design"]
    mockLearner.interests = ["Music", "Coffee"]
    
    // 3. 실제 뷰 반환 (return 명시)
    return LearnerCardView(learner: mockLearner)
        .modelContainer(container)
        .preferredColorScheme(.dark)
}
