////
////  CardBackView.swift
////  Learndex
////
////  Created by 조민지 on 4/22/26.
////
//
//import SwiftUI
//import SwiftData
//
//struct CardBackView: View {
//    @Bindable var learner: Learner
//    
//    @State private var memoText: String = ""
//    
//    var body: some View {
//        ZStack {
//                VStack(alignment: .center){
//                    HStack(spacing: 0) {
//                        Image("\(learner.imageName)")
//                            .resizable()
//                            .frame(width: 180, height: 180)
//                        
//                        VStack {
//                            Text("\(learner.nickname)")
//                                .font(.largeTitle)
//                                .lineLimit(1)
//                                .bold(true)
//                                .minimumScaleFactor(0.5)
//                            Text("\(learner.name)")
//                                .font(.title)
//                        }
//                        .padding(10)
//                        .padding(.horizontal)
//                    }
//                    
//                }
//                .frame(width: 335, height: 520)
//                .background(Color(.gray.opacity(0.3)))
//                .cornerRadius(30)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 30)
//                        .stroke(
//                            LinearGradient(colors: [.white, .gray], startPoint: .topLeading, endPoint: .bottomTrailing),
//                            lineWidth: 10
//                        )
//                )
//                .overlay(alignment: .topTrailing) {
//                    Button {
//                        dismiss()
//                    } label: {
//                        Image(systemName: "xmark")
//                            .font(.largeTitle)
//                            .foregroundStyle(.white.opacity(0.5))
//                            .padding(25)
//                    }
//                }
//                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 10)
//                .id(learner.id)
//            
//        }
//    }
//}
//
//
//#Preview {
//    CardBackView()
//}
