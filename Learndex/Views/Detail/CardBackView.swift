//
//  CardBackView.swift
//  Learndex
//
//  Created by 조민지 on 4/22/26.
//

import SwiftUI
import SwiftData

struct CardBackView: View {
    @Bindable var learner: Learner
    @Environment(\.dismiss) private var dismiss
    
    @State private var memoText: String = ""
    
    var body: some View {
        ZStack {
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
                .padding(.top, 40)
                
                //메모장 영역
                VStack(alignment: .leading, spacing: 8) {
                    Label("Memo", systemImage: "pencil.and.outline")
                        .font(.body)
                        .bold()
                        .foregroundStyle(.indigo)
                    
                    TextEditor(text: $learner.memo)
                        .scrollContentBackground(.hidden) // 배경색 커스텀을 위해 숨김
                        .background(Color.white.opacity(0.05))
                        .cornerRadius(12)
                        .frame(maxHeight: .infinity) // 남은 공간 다 쓰기
                        .submitLabel(.done) //엔터키를 '완료' 또는 '체크' 느낌
                        .onChange(of: learner.memo) { oldValue, newValue in
                            // 마지막 글자가 엔터(\n)라면?
                            if newValue.last == "\n" {
                                learner.memo.removeLast() //엔터값은 삭제
                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                            }
                        }
                }
                .padding(.horizontal, 25)
                .padding(.bottom, 25)
                
                
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
            //            .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
            .id(learner.id)
            
        }
    }
}
    
    
    #Preview {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for: Learner.self, configurations: config)
        let mock = Learner(
            nickname: "Pony", name: "최연우", session: .morning,
            imageName: "character2",
            intro: "말의 해에 태어난 포니입니다🎶 ",
            introDetail: "디자인과 브랜딩에 열정이 있으며, 인스타그램을 통해 작업물을 공유하는 것을 좋아합니다.",
            strengths: ["디자인", "브랜딩", "모션그래픽"],
            interests: ["Figma", "SNS 브랜딩"]
        )
        
        
        CardBackView(learner: mock)
            .modelContainer(container)
            .preferredColorScheme(.dark)
    }
