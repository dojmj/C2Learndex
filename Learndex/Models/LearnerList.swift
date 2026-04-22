//
//  LearnerList.swift
//  Learndex
//
//  Created by 조민지 on 4/21/26.
//

import Foundation
import SwiftData

@Model
class Learner {
    var id : UUID
    var nickname: String
    var name: String
    var session: SessionType // 아래 만든 Enum 사용
    var imageName: String     // 사진 파일 이름
    var intro: String         // 한 줄 소개
    var introDetail: String   // 상세 자기소개
    var isUnlocked: Bool //잠금 해제 됐는지
    var isOpened: Bool //봉투 뜯었는지
    var strengths: [String]?    //도메인
    var interests: [String]?  //관심분야

    
    init(id: UUID = UUID(),
         nickname: String,
         name: String,
         session: SessionType,
         imageName: String = "character1",
         intro: String = "Hi, I'm a learner!",
         introDetail: String = "I'm a learner. I love to learn new things!",
         isUnlocked: Bool = false,
         isOpened: Bool = false,
         strengths: [String]? = nil,
         interests: [String]? = nil)
    {
        
        self.id = id
        self.nickname = nickname
        self.name = name
        self.session = session
        self.imageName = imageName
        self.intro = intro
        self.introDetail = introDetail
        self.isUnlocked = isUnlocked
        self.isOpened = isOpened
        self.strengths = strengths
        self.interests = interests
    }
}

enum SessionType: String, CaseIterable, Codable, Identifiable {
    case morning = "오전"
    case afternoon = "오후"
    case mentor = "멘토"
    case all = "전체"
    
    var id: Self { self }
}
