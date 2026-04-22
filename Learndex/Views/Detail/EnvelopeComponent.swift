//
//  EnvelopeComponent.swift
//  Learndex
//
//  Created by 조민지 on 4/21/26.
//

import SwiftUI
import SwiftData

struct EnvelopeComponent: View {
    @Query(sort: \Learner.nickname) private var learners: [Learner]
    @Binding var selectedLearner: Learner?
    @Binding var selectedSession: SessionType
    @Bindable var learner: Learner
    
    @State private var scissorOffset: CGFloat = 0 //가위 위치
    @State private var lastOffset: CGFloat = 0 //멈춘 지점 기억
    @State private var isCutCompleted: Bool = false  // 자르기 완료 여부
    @Binding var isTorn: Bool //다 찢어졌는지 부모에게 알림
    
    
    
    let trackWidth: CGFloat = 355 //잘라야할 총 길이
    
    var body: some View {
        ZStack {
            if learner.isOpened {
//                LearnerCardDetail(targetID: learner.id, selectedSession: $selectedSession)
                LearnerCardView(learner: learner)

            } else {
                if let learner = selectedLearner {
//                    LearnerCardDetail(targetID: learner.id, selectedSession: $selectedSession)
                    LearnerCardView(learner: learner)
                        .opacity(isCutCompleted ? 1.0 : 0.0)
                        .offset(y: isCutCompleted ? 0 : 250)
//                        .scaleEffect(isCutCompleted ? 1.0 : 0.7)
                        .animation(
                            .spring(response: 1.3, dampingFraction: 0.6)
                            .delay(0.2),
                            value: isCutCompleted
                        )
                }
                
                ZStack {
                    //봉투
                    VStack(spacing: -6) {
                        Image("top_m")
                            .offset(y: isCutCompleted ? -1000 : 0)
                            .opacity(isCutCompleted ? 0.2 : 1.0)
                            .animation(.easeInOut, value: isCutCompleted)
                        
                        Image("bottom_m")
                            .offset(y: isCutCompleted ? 1000 : 0)
                            .animation(.spring(response: 5), value: isCutCompleted)
                            .ignoresSafeArea(edges: .bottom)
                    }
                    
                    
                    ZStack(alignment: .leading) {
                        
                        Line() //절취선
                            .stroke(style: StrokeStyle(lineWidth: 3, dash: [7]))
                            .foregroundColor(.gray)
                            .frame(width: trackWidth, height: 2)
                            .opacity(isCutCompleted ? 0 : 1.0)
                            .animation(.linear(duration: 0.2), value: isCutCompleted) //봉투 움직일때 즉시 없어지도록
                        
                        Line() //잘린 자리(실선)
                            .stroke(lineWidth: 8)
                            .foregroundStyle(.black)
                            .frame(width: scissorOffset, height: 2)
                            .opacity(isCutCompleted ? 0 : 1.0)
                        
                        Image(systemName: "scissors")
                            .font(.system(size: 25))
                            .foregroundStyle(.gray)
                            .offset(x: scissorOffset - 11)
                            .opacity(isCutCompleted ? 0 : 1.0)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        let newTranslation = lastOffset + value.translation.width //마지막 위치 + 이동거리
                                        if newTranslation > scissorOffset && newTranslation <= trackWidth {
                                            scissorOffset = newTranslation
                                        }
                                    }
                                    .onEnded({ value in
                                        lastOffset = scissorOffset
                                        
                                        if scissorOffset > trackWidth * 0.9 {
                                            withAnimation(.spring(response: 0.6, dampingFraction: 0.7)) {
                                                scissorOffset = trackWidth
                                                isCutCompleted = true
                                                isTorn = true
                                            }
                                            
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                                    learner.isOpened = true

                                            }
                                        }
                                    })
                                
                            )
                    }
                    .offset(y: -225)
                }
                .offset(y: 200)
                
            }
        }
        .ignoresSafeArea(edges: .all)
//            .navigationBarBackButtonHidden(isCutCompleted ? false : true)
            .navigationBarBackButtonHidden(true)
            
        }
    }
    


struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.width, y: rect.midY))
        return path
    }
}

#Preview {
    // 1. 프리뷰 전용 컨테이너 설정 (메모리에서만 동작)
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Learner.self, configurations: config)

    // 2. 프리뷰용 가짜 데이터 생성
    let previewLearner = Learner(
        nickname: "Ahae",
        name: "조민지",
        session: .morning,
        imageName: "character1",
        introDetail: "Cloud, Computer Vision 등 기술 분야에 관심이 많습니다.",
        strengths: ["웹", "스토리텔링", "SQL"],
        interests: ["Swift", "Python", "Vision"]
    )
    
    // 중요: context에 넣어줘야 @Bindable 등이 정상 작동합니다.
    container.mainContext.insert(previewLearner)

    return NavigationStack {
        EnvelopeComponent(
            selectedLearner: .constant(previewLearner),
            selectedSession: .constant(.all),
            learner: previewLearner,
            isTorn: .constant(false)
        )
    }
    .modelContainer(container)
}
