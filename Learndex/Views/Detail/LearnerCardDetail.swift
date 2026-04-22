//
//  LearnerCardDetail.swift
//  Learndex
//
//  Created by 조민지 on 4/21/26.
//

import SwiftUI
import SwiftData


struct LearnerCardDetail: View {
    let targetID: UUID
    @State private var scrollID: UUID?
    @Query(sort: \Learner.nickname) private var learners: [Learner]
    @Binding var selectedSession: SessionType
    @Environment(\.dismiss) private var dismiss
    
    //세션 필터링
    var filteredLearners: [Learner] {
        learners.filter { learner in
            selectedSession == .all ? true : learner.session == selectedSession
        }
    }
    
    var currentLearner: Learner? {
            learners.first { $0.id == targetID }
        }
    
    var body: some View {
        ZStack {
            if let learner = currentLearner {
                VStack(alignment: .center){
                    HStack(spacing: 0) {
                        Image("\(learner.imageName)")
                            .resizable()
                            .frame(width: 180, height: 180)
                        
                        VStack {
                            Text("\(learner.nickname)")
                                .font(.largeTitle)
                                .lineLimit(1)
                                .bold(true)
                                .minimumScaleFactor(0.5)
                            Text("\(learner.name)")
                                .font(.title)
                        }
                        .padding(10)
                        .padding(.horizontal)
                    }
                    
                    if learner.isUnlocked {
                        Text("\(learner.intro)")
                            .font(.body)
                            .multilineTextAlignment(.center)
                        
                        Text("\(learner.introDetail)")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 13)
                            .padding(.bottom, 15)
                        
                        HStack{
                            ForEach(learner.strengths ?? [], id: \.self) { skill in
                                Text(skill)
                                    .font(.body)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 5)
                                    .background(Color.blue.opacity(0.1))
                                    .clipShape(Capsule())
                                    .multilineTextAlignment(.center)
                            }
                        }
                        
                        HStack{
                            ForEach(learner.interests ?? [], id: \.self) { skill in
                                Text(skill)
                                    .font(.body)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 5)
                                    .foregroundStyle(Color.white)
                                    .background(Color.black.opacity(0.8))
                                    .clipShape(Capsule())
                                    .multilineTextAlignment(.center)
                            }
                        }
                        
                    } /*else {*/
//                            Image(systemName: "lock.fill")
//                                .resizable()
//                                .frame(width: 30, height: 40)
//                                .padding(30)
//                            Text("\(learner.nickname)을(를) 만나 잠금을 풀어보세요!")
//                                .font(.title3)
//                                .padding()
//                        }
                    
                    
                }
                .frame(width: 335, height: 520)
                .background(Color(.gray.opacity(0.3)))
                .cornerRadius(30)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(
                            LinearGradient(colors: [.white, .gray], startPoint: .topLeading, endPoint: .bottomTrailing),
                            lineWidth: 10
                        )
                )
                .overlay(alignment: .topTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.largeTitle)
                            .foregroundStyle(.white.opacity(0.5))
                            .padding(25)
                    }
                }
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 10)
                .id(learner.id)
                
            }
        }
        
        
    }
    
}

#Preview {
    // 1. 임시 메모리 저장소 설정
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Learner.self, configurations: config)
    
    // 2. 프리뷰에서 보여줄 가짜 데이터 생성
    let previewLearner = Learner(
        nickname: "Ahae",
        name: "조민지",
        session: .morning,
        imageName: "character1",
        introDetail: "Cloud, Computer Vision, VisionOS 등 다양한 기술 분야에 깊은 관심을 가지고 있습니다.",
        isUnlocked: true,
        strengths: ["웹", "스토리텔링", "컴퓨터공학", "SQL"],
        interests: ["Swift", "Python", "ML", "Vision"]
    )
    
    // 3. 🌟 중요: 데이터를 컨테이너에 미리 넣어줍니다.
    container.mainContext.insert(previewLearner)
    
    return NavigationStack {
        LearnerCardDetail(
            targetID: previewLearner.id, // 생성한 데이터의 ID를 넘겨줍니다.
            selectedSession: .constant(.all)
        )
    }
    .modelContainer(container)
}

