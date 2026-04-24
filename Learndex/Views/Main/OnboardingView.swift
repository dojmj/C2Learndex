//
//  OnboardingView.swift
//  Learndex
//
//  Created by 조민지 on 4/22/26.
//

import SwiftUI
import SwiftData

struct OnboardingView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var nickname: String = ""
    @State private var isError: Bool = false
    
    var body: some View {
        VStack {
            
            Text("Learndex")
                .font(.largeTitle.bold())
                
            Spacer()
            
            Text("닉네임을 영어로 입력해주세요.")
                .font(.title2)
                .padding(.horizontal, 20)
                .frame(maxWidth: .infinity, alignment: .leading)
                
            
            VStack(alignment: .leading) {
                TextField("영어 닉네임 입력", text: $nickname)
                    .textFieldStyle(.plain)
                    .font(.body)
                    .autocorrectionDisabled()
                    .keyboardType(.asciiCapable)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                //영문만 허용
                    .onChange(of: nickname) { _, newValue in
                        let filteredValue = newValue.filter { char in
                            char.isASCII && char.isLetter
                        }
                        
                    }
                
                
                if isError {
                    Text("닉네임을 찾을 수 없습니다. 다시 확인해주세요.")
                        .font(.caption)
                        .foregroundStyle(.red)
                        .padding(.leading, 5)
                        .transition(.opacity)
                }
            }
            .padding(.horizontal, 20)
            
            
            
            Button {
                saveAndStart()
            } label: {
                Text("Start Adventure")
                    .font(.title3)
                    .frame(maxWidth: .infinity)
                    .padding()
//                    .background(nickname.isEmpty ? .gray.opacity(0.6) : .blue)
                    .foregroundStyle(.white)
                    .cornerRadius(15)
            }
            .disabled(nickname.isEmpty)
            .buttonStyle(.glassProminent)
            .padding(.horizontal, 20)
            .padding(.vertical, 30)
            
            Spacer()
            
        }
        .animation(.default, value: isError)
    }
    
    func saveAndStart() {

        let fetchDescriptor = FetchDescriptor<Learner>(
            predicate: #Predicate{ $0.nickname == nickname }
        )
        
        do{
            let existingLearners = try modelContext.fetch(fetchDescriptor)
            
            if let targetLearner = existingLearners.first {
                targetLearner.isMe = true
                targetLearner.isUnlocked = true
                targetLearner.isOpened = true
                try? modelContext.save()
            } else {
                isError = true
            }
        } catch {
            print("Fetch error: \(error)")
        }
    }
}
    
    #Preview {
        OnboardingView()
    }
