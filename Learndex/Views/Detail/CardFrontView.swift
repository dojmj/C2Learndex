//
//  CardFrontView.swift
//  Learndex
//
//  Created by 조민지 on 4/22/26.
//

import SwiftUI
import SwiftData

struct CardFrontView: View {
    //    let targetID: UUID
    //    @State private var scrollID: UUID?
    //    @Query(sort: \Learner.nickname) private var learners: [Learner]
    //    @Binding var selectedSession: SessionType
    var learner: Learner
    @Environment(\.dismiss) private var dismiss
    
    //세션 필터링
    //    var filteredLearners: [Learner] {
    //        learners.filter { learner in
    //            selectedSession == .all ? true : learner.session == selectedSession
    //        }
    //    }
    //
    //    var currentLearner: Learner? {
    //            learners.first { $0.id == targetID }
    //        }
    
    var body: some View {
        ZStack {
            //            if let learner = currentLearner {
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
                    
                }
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
            
            //            }
        }
        
        
    }
}


#Preview {
    // 1. 컨테이너 설정
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Learner.self, configurations: config)
    
    // 2. 가짜 데이터 생성
    let mockLearner = Learner(
        nickname: "Myong",
        name: "김현서",
        session: .morning,
        imageName: "character2",
        intro: "다양한 분야를 찍먹해본 묭입니다.",
        introDetail: "디자인과 기획을 거쳐 현재는 컴퓨터공학도로서 개발 역량을 다지고 있습니다.",
        strengths: ["프론트엔드", "모바일", "UI/UX 디자인"],
        interests: ["Swift", "VisionOS", "바이브코딩"]
    )
    
    // 3. 추가 값 설정
    mockLearner.isUnlocked = true
    
    // 🚩 핵심: 'return'을 붙여서 이 View를 보여달라고 확실히 말해줍니다!
    return CardFrontView(learner: mockLearner)
        .modelContainer(container)
        .preferredColorScheme(.dark)
}
