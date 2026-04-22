//
//  SampleData.swift
//  Learndex
//
//  Created by 조민지 on 4/21/26.
//

import Foundation
import SwiftData

@MainActor
class SampleData {
    static let shared = SampleData()
    let modelContainer: ModelContainer
    
    var context : ModelContext {
        modelContainer.mainContext
    }
    
    private init() {
        let schema = Schema([Learner.self]) // Learner 모델 등록
        let config = ModelConfiguration(isStoredInMemoryOnly: false)
        
        do {
            modelContainer = try ModelContainer(for: schema, configurations: [config])
            getInitialLearners()
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    
    func getInitialLearners() -> [Learner] {
        return [
            Learner(
                nickname: "Miro", name: "고기범", session: .morning,
                imageName: "character6",
                intro: "배움을 좋아하고 싶은 Miro 입니다!",
                introDetail: "전자전기공학 전공자로, 기술이 사람에게 닿는 지점인 디자인과 UX에 관심이 많습니다.",
                strengths: ["프론트엔드", "UI/UX 디자인"],
                interests: ["Swift", "iOS", "JavaScript"]
            ),
            Learner(
                nickname: "Steve", name: "권오상", session: .morning,
                imageName: "character7",
                intro: "안녕하세요! 스티브입니다.",
                introDetail: "정보보안 회사에서 사업 기획 및 해외 사업 개발 업무를 수행한 경험이 있습니다.",
                strengths: ["기획", "전략", "사업개발", "비즈니스"],
                interests: ["Swift", "iOS", "Python", "Statistics"]
            ),
            Learner(
                nickname: "Jay", name: "이은제", session: .morning,
                imageName: "character5",
                intro: "디자인을 사랑하는 남자 Jay 입니다 😎",
                introDetail: "논리적으로 문제를 풀어내 결과물을 만드는 과정을 즐기는 디자이너입니다.",
                strengths: ["모바일", "UI/UX 디자인", "HCI"],
                interests: ["Swift", "iOS", "Figma", "Sketch"]
            ),
            Learner(
                nickname: "Kaya", name: "서혜린", session: .morning,
                imageName: "character2",
                intro: "새로운 언어 배우기를 즐기는 Kaya입니다!",
                introDetail: "미래모빌리티 전공자로, 소통을 좋아하며 올해는 디자인 역량도 쌓고 싶습니다.",
                strengths: ["python", "전자회로", "mobility engineering"],
                interests: ["Python", "C++", "java", "백엔드"]
            ),
            Learner(
                nickname: "Grace", name: "김하은", session: .afternoon,
                imageName: "character3",
                intro: "안녕하세요 Grace(그레이스)입니다!🙋🏻‍♀️🇨🇦",
                introDetail: "캐나다에서 심리학과 비즈니스를 전공했으며, 사람에 대한 통찰을 디자인에 녹여냅니다.",
                strengths: ["기획", "Research", "심리학", "UX/UI Design"],
                interests: ["Figma", "Marketing", "English"]
            ),
            Learner(
                nickname: "Rin", name: "김서연", session: .morning,
                imageName: "character1",
                intro: "귀여운 것을 좋아하는 '린'입니다!",
                introDetail: "동물과 새로운 사람과의 대화를 좋아하며, 디자인과 프로토타이핑에 관심이 많습니다.",
                strengths: ["UI/UX 디자인", "디자인"],
                interests: ["Swift", "Figma", "Sketch", "Prototyping"]
            ),
            Learner(
                nickname: "Ssu", name: "Ssu", session: .morning,
                imageName: "character2",
                intro: "사람들의 마음을 비추는 UX 디자이너 쓔입니다!",
                introDetail: "디자인과 기획을 통해 세상에 밝은 영향력을 전하고 싶은 디자이너입니다.",
                strengths: ["UI/UX 디자인", "디자인"],
                interests: ["Figma", "바이브코딩", "디자인", "기획", "AI Image"]
            ),
            Learner(
                nickname: "Ahae", name: "조민지", session: .morning,
                imageName: "character1",
                introDetail: "Cloud, Computer Vision, VisionOS 등 다양한 기술 분야에 깊은 관심을 가지고 있습니다.",
                strengths: ["웹", "스토리텔링", "컴퓨터공학", "SQL"],
                interests: ["Swift", "Python", "ML", "Vision"]
            ),
            Learner(
                nickname: "Fura", name: "정재원", session: .morning,
                imageName: "character5",
                intro: "게임과 산업공학을 사랑하는 퓨라입니다!",
                introDetail: "산업 현장의 문제를 개선하는 것을 즐기며 기획, 개발, 디자인을 아우르는 개발자를 꿈꿉니다.",
                strengths: ["산업공학"],
                interests: ["Swift", "iOS", "React", "Python"]
            ),
            Learner(
                nickname: "Woozy", name: "양창우", session: .morning,
                imageName: "character6",
                intro: "Young, Wild & Free",
                introDetail: "정보통신 배경을 가지고 있으며 재밌는 일을 찾아 아카데미에 합류했습니다.",
                strengths: ["문서화", "PM", "정보통신"],
                interests: ["Swift", "iOS", "Python", "Figma"]
            ),
            Learner(
                nickname: "Noheul", name: "노을", session: .morning,
                imageName: "character2",
                intro: "방황과 방랑 사이 노을입니다. 🌅",
                introDetail: "출시 앱 운영 경험이 있는 백엔드 개발자로, 성과가 나올 때까지 몰입하는 열정이 있습니다.",
                strengths: ["백엔드", "cloud"],
                interests: ["Figma", "java", "Spring"]
            ),
            Learner(
                nickname: "Sano", name: "이시온", session: .morning,
                imageName: "character3",
                intro: "무표정이지만 화난 게 아니에요 🌝",
                introDetail: "느리고 비효율적인 것의 가치를 아는 초보 개발자로, 창의적인 실험을 좋아합니다.",
                strengths: ["인도네시아어", "글쓰기", "작곡"],
                interests: ["Swift", "Prototyping", "VisionOS"]
            ),
            Learner(
                nickname: "Gigi", name: "오민지", session: .morning,
                imageName: "character4",
                intro: "민지지 입니다.",
                introDetail: "VisionOS와 인간-AI 협업(HAC) 등 미래 기술 연구에 관심이 많은 러너입니다.",
                strengths: ["Research", "UX/UI"],
                interests: ["VisionOS", "HCI", "Research"]
            ),
            Learner(
                nickname: "Selina", name: "김나현", session: .morning,
                imageName: "character2",
                intro: "코딩을 좋아하기 위해 노력하는 쿼카상 셀리나입니다.",
                introDetail: "웃음이 많은 쿼카를 닮았으며, 백엔드와 파이썬 공부에 집중하고 있습니다.",
                strengths: [""],
                interests: ["Python", "백엔드"]
            ),
            Learner(
                nickname: "Jess", name: "허진옥", session: .morning,
                imageName: "character4",
                intro: "문제들을 발견하고 체계화하는 Detector입니다.",
                introDetail: "뇌과학과 철학 등 다양한 분야를 탐구하며, 아카데미 끝에 명료한 한 줄을 새기고 싶습니다.",
                strengths: ["NeuroScience", "Philosophy", "Movie"],
                interests: ["Python", "English", "softskill", "Create"]
            ),
            Learner(
                nickname: "Mulgae", name: "김성현", session: .morning,
                imageName: "character7",
                intro: "한국인이면 제발 침투부 구독합시다.",
                introDetail: "CS 지식을 바탕으로 iOS 앱 개발과 클로드 코드를 탐구하고 있습니다.",
                strengths: ["모바일", "Computer Science"],
                interests: ["Swift", "iOS", "SwiftUI", "백엔드"]
            ),
            Learner(
                nickname: "Bara", name: "이시원", session: .morning,
                imageName: "character2",
                intro: "안녕하세요 카피바라 bara예요! ",
                introDetail: "순수미술부터 프로덕트 디자인까지, 폭넓은 예술적 스펙트럼을 가진 디자이너입니다.",
                strengths: ["UI/UX 디자인", "순수미술", "Graphics"],
                interests: ["Figma", "SwiftUI", "Adobe", "Blender"]
            ),
            Learner(
                nickname: "John", name: "백지훈", session: .morning,
                imageName: "character5",
                intro: "안녕하세요, 비즈니스 기획자 john입니다.",
                introDetail: "데이터 기반 의사결정과 유저 중심 사고를 가진 기획자이자 개발자 지망생입니다.",
                strengths: ["프론트엔드", "모바일", "UI/UX 디자인"],
                interests: ["Swift", "iOS", "ML", "Node.js", "Figma"]
            ),
            Learner(
                nickname: "Ganni", name: "김가은", session: .morning,
                imageName: "character1",
                intro: "다양한 활동들 같이 해보고 싶은 가니입니다 ~.~",
                introDetail: "컴퓨터 비전과 음성 인식 기술에 관심이 많으며 프로젝트 협업을 즐깁니다.",
                strengths: ["컴퓨터비전", "기획"],
                interests: ["Python", "ML", "기획", "DL"]
            ),
            Learner(
                nickname: "Dana", name: "김수민", session: .morning,
                imageName: "character2",
                intro: "공부 의지가 넘치는 다나입니다!",
                introDetail: "산업 디자인 전공자로 UX/UI를 주력으로 하며, 개발 협업 능력을 키우고 싶습니다.",
                strengths: ["모바일", "UI/UX 디자인", "브랜딩", "Figma"],
                interests: ["Swift", "iOS", "Figma", "디자인"]
            ),
            Learner(
                nickname: "Cindy", name: "이선우", session: .morning,
                imageName: "character3",
                intro: "안녕하세요 사람을 좋아하는 신디 입니다.",
                introDetail: "통계학 전공 후 웹 개발을 배웠으며, 아카데미에서 앱 개발과 디자인에 도전 중입니다.",
                strengths: ["프론트엔드", "백엔드"],
                interests: ["iOS", "React", "Python", "Figma"]
            ),
            Learner(
                nickname: "Mugu", name: "정무구", session: .morning,
                imageName: "character6",
                intro: "무구입니다.",
                introDetail: "재료와 열역학 지식을 바탕으로 Swift와 JavaScript를 새롭게 배우고 있습니다.",
                strengths: ["재료", "열역학"],
                interests: ["Swift", "iOS", "JavaScript", "Node.js"]
            ),
            Learner(
                nickname: "Salud", name: "하경덕", session: .morning,
                imageName: "character7",
                intro: "스포츠를 사랑하는 살룻입니다!",
                introDetail: "기획과 전략 분야의 강점을 활용해 팀에 기여할 부분을 찾는 적극적인 러너입니다.",
                strengths: ["기획", "전략"],
                interests: ["Swift", "iOS", "VibeCoding"]
            ),
            Learner(
                nickname: "Quokka", name: "정승민", session: .morning,
                imageName: "character5",
                intro: "어디서든 밝게 잘 적응하는 Product Builder 쿼카입니다.!!!",
                introDetail: "호주의 쿼카처럼 어떤 환경에서도 빠르게 습득하고 적응하는 능력을 갖췄습니다.",
                strengths: ["모바일", "기획", "아이디어", "조율"],
                interests: ["Swift", "iOS", "SwiftUI", "UIKit"]
            ),
            Learner(
                nickname: "Sido", name: "김시아", session: .morning,
                imageName: "character2",
                intro: "도레미파솔라 시도🎵 TRY!!",
                introDetail: "작곡을 좋아하며 Vision OS와 Live coding 등 창의적인 기술 시도를 즐깁니다.",
                strengths: ["백엔드", "창의력"],
                interests: ["Swift", "iOS", "java", "Vision OS"]
            ),
            Learner(
                nickname: "Mason", name: "이민혁", session: .morning,
                imageName: "character6",
                intro: "Code를 통해 세상을 보려 합니다!",
                introDetail: "미디어 제작 경험을 기반으로 실용적인 서비스를 구현하는 개발자를 지향합니다.",
                strengths: ["웹", "Adobe", "기획"],
                interests: ["Swift", "iOS", "바이브코딩"]
            ),
            Learner(
                nickname: "Myong", name: "김현서", session: .morning,
                imageName: "character2",
                intro: "다양한 분야를 찍먹해본 묭입니다.",
                introDetail: "디자인과 기획을 거쳐 현재는 컴퓨터공학도로서 개발 역량을 다지고 있습니다.",
                strengths: ["프론트엔드", "모바일", "UI/UX 디자인"],
                interests: ["Swift", "VisionOS", "바이브코딩"]
            ),
            Learner(
                nickname: "Lawrence", name: "유성룡", session: .morning,
                imageName: "character6",
                intro: "👋 Hello! 반가워요!",
                introDetail: "산업공학에서 UI 디자인으로 새로운 도전을 시작했으며, 누구보다 열정적으로 참여합니다.",
                strengths: ["브랜딩", "산업공학", "스토리텔링"],
                interests: ["Swift", "Figma", "디자인"]
            ),
            Learner(
                nickname: "Sammy", name: "이다윤", session: .morning,
                imageName: "character4",
                intro: "성장하고 싶은 개발자 Sammy입니다.",
                introDetail: "컴퓨터공학 전공자로 Python과 LLM에 관심이 많으며, 요즘은 IoT를 눈여겨보고 있습니다.",
                strengths: ["백엔드", "python", "LLM", "Web"],
                interests: ["Swift", "iOS", "Python", "ML"]
            ),
            Learner(
                nickname: "Chaem", name: "홍채민", session: .morning,
                imageName: "character3",
                intro: "새로운 도전을 좋아하는 챔입니다!",
                introDetail: "Why not? 다양한 경험과 새로운 도전을 즐기며 AI와 컴퓨터 비전을 공부했습니다.",
                strengths: ["Tech", "AI", "python", "C/C++"],
                interests: ["Swift", "iOS", "VisionOS", "Database"]
            ),
            Learner(
                nickname: "Gina", name: "정지나", session: .morning,
                imageName: "character2",
                intro: "안녕하세요, 지나입니다!",
                introDetail: "사용자 중심 사고를 바탕으로 효율적인 일정 수립과 이슈 관리에 강점이 있는 지나입니다.",
                strengths: ["모바일", "웹", "기획","문서화"],
                interests: ["Swift", "iOS", "Python", "Figma"]
            ),
            Learner(
                nickname: "Elin", name: "김도현", session: .morning,
                imageName: "character1",
                intro: "나만의 길을 찾고 싶은 엘린입니다.",
                introDetail: "사람들의 경험에서 문제를 발견하고 소통을 통해 해결 방향을 고민하는 것을 좋아합니다.",
                strengths: ["아이디어 연결", "소통", "문제 정의"],
                interests: ["Swift", "iOS", "Python", "ML"]
            ),
            Learner(
                nickname: "Erin", name: "김예빈", session: .morning,
                imageName: "character2",
                intro: "디발자, 개자이너를 꿈꾸는 에린입니다!",
                introDetail: "뜨개질부터 일본어까지 관심사가 다양한 프로찍먹러이며, 재밌는 프로젝트를 만들고 싶어 합니다.",
                strengths: ["UI/UX 디자인", "디자인", "3d"],
                interests: ["Swift", "iOS", "React", "Python"]
            ),
            Learner(
                nickname: "Theo", name: "정홍섭", session: .morning,
                imageName: "character5",
                intro: "배우고 도전을 좋아하는 Theo입니다!",
                introDetail: "프론트엔드와 VR/AR 기술을 바탕으로 사용자 경험을 설계하는 것에 관심이 많습니다.",
                strengths: ["프론트엔드", "모바일", "웹", "VR/AR"],
                interests: ["Swift", "iOS", "React", "JavaScript"]
            ),
            Learner(
                nickname: "Owen", name: "조영민", session: .morning,
                imageName: "character6",
                intro: "애플 생태계를 사랑하는 개발자 오웬입니다!",
                introDetail: "iOS 개발 경험이 있으며, 입문하시는 분들께 애플 제품과 개발 지식을 공유하는 것을 좋아합니다.",
                strengths: ["모바일", "Tech", "Swift", "HIG"],
                interests: ["Swift", "iOS", "ML", "Figma"]
            ),
            Learner(
                nickname: "Tobae", name: "박지원", session: .morning,
                imageName: "character3",
                introDetail: "모바일 플랫폼 전공 지식을 바탕으로 Swift와 Kotlin을 탐구하고 있습니다.",
                strengths: ["모바일"],
                interests: ["Swift", "iOS", "Kotlin"]
            ),
            Learner(
                nickname: "Ellie", name: "곽윤정", session: .morning,
                imageName: "character4",
                intro: "소소한 문제들에 관심이 많은 엘리입니다😽",
                introDetail: "AI를 전공 중이지만 기획과 디자인 등 다양한 분야를 얕고 넓게 학습하며 전문성을 키우고 있습니다.",
                strengths: ["프론트엔드", "모바일", "웹", "컴퓨터공학"],
                interests: ["Swift", "React", "Flutter", "Figma"]
            ),
            Learner(
                nickname: "Blair", name: "김보윤", session: .morning,
                imageName: "character2",
                intro: "모든 것을 사랑하는 프로덕트 디자이너입니다.",
                introDetail: "해외에서의 다양한 경험을 바탕으로 사용자 관점에서 데이터를 해석하고 소통합니다.",
                strengths: ["모바일", "UI/UX 디자인", "웹", "UX"],
                interests: ["Swift", "iOS", "Figma", "디자인"]
            ),
            Learner(
                nickname: "Martin", name: "송민영", session: .morning,
                imageName: "character6",
                intro: "PM 마인드를 갖춘 데이터 엔지니어를 꿈꿉니다!",
                introDetail: "앱·웹 개발 경험이 풍부하며, AI 에이전트를 활용한 개발과 스포츠 수다를 좋아합니다.",
                strengths: ["풀스택", "모바일", "웹"],
                interests: ["ML", "Spring", "Aws", "Docker"]
            ),
            Learner(
                nickname: "Mew", name: "함유진", session: .morning,
                imageName: "character1",
                intro: "컴공과 출신의 UI/UX 디자이너 🎨",
                introDetail: "HCI 연구를 통해 사용자 경험의 중요성을 배웠으며, 그래픽 디자인까지 스펙트럼을 넓히고 있습니다.",
                strengths: ["프론트엔드", "데이터 사이언스", "디자인"],
                interests: ["Swift", "iOS", "React", "Python"]
            ),
            Learner(
                nickname: "Dustin", name: "허승준", session: .morning,
                imageName: "character6",
                intro: "📚교육을 전공한 iOS 개발자 허승준입니다.",
                introDetail: "이별 극복 일기장 앱 <ByeBoo>를 출시해 운영 중이며, 교육과 기술의 결합에 관심이 많습니다.",
                strengths: ["Swift", "iOS", "교육공학"],
                interests: ["Combine", "RxSwift", "Clean Architecture"]
            ),
            Learner(
                nickname: "Enzo", name: "양은서", session: .morning,
                imageName: "character7",
                intro: "세상 돌아가는 일에 관심이 많은 엔조입니다.",
                introDetail: "브랜딩과 기획, 프론트엔드 분야를 넘나들며 바이브 코딩의 즐거움을 찾고 있습니다.",
                strengths: ["프론트엔드", "UI/UX 디자인", "브랜딩"],
                interests: ["바이브코딩", "기획"]
            ),
            Learner(
                nickname: "Baekdo", name: "백형철", session: .morning,
                imageName: "character5",
                intro: "흰 백, 길 도, 백도입니다.",
                introDetail: "백절불굴의 정신으로 백엔드와 전자회로를 공부하며 나만의 길을 고민하고 있습니다.",
                strengths: ["백엔드", "전자회로"],
                interests: ["Swift", "iOS", "Figma", "DL"]
            ),
            Learner(
                nickname: "Anna", name: "강태은", session: .morning,
                imageName: "character3",
                introDetail: "HCI와 UX/UI 디자인 지식을 바탕으로 Python을 활용한 기획에 강점이 있습니다.",
                strengths: ["HCI", "기획", "python"],
                interests: ["Swift", "iOS", "Figma", "UI/UX 디자인"]
            ),
            Learner(
                nickname: "Arom", name: "김준범", session: .morning,
                imageName: "character5",
                intro: "답이 없는 질문을 좋아합니다.",
                introDetail: "후각처럼 주관적이고 불투명한 사람의 마음에 관심이 많아 기획과 작문을 즐깁니다.",
                strengths: ["기획", "작문", "아이데이션"],
                interests: ["사람 탐구", "작문"]
            ),
            Learner(
                nickname: "Moo", name: "박지우", session: .afternoon,
                imageName: "character6",
                intro: "큰 산을 소유하는 사주를 가진 무입니다.",
                introDetail: "물리학과 인지과학 배경을 가졌으며, 당도 0% 공차를 즐기는 독특한 취향이 있습니다.",
                strengths: ["모바일", "3d", "물리학", "인지과학"],
                interests: ["iOS", "Unity", "android", "C#"]
            ),
            Learner(
                nickname: "Pony", name: "최연우", session: .morning,
                imageName: "character2",
                intro: "말의 해에 태어난 포니입니다🎶 ",
                introDetail: "디자인과 브랜딩에 열정이 있으며, 인스타그램을 통해 작업물을 공유하는 것을 좋아합니다.",
                strengths: ["디자인", "브랜딩", "모션그래픽"],
                interests: ["Figma", "SNS 브랜딩"]
            ),
            Learner(
                nickname: "Gosan", name: "이치훈", session: .morning,
                imageName: "character7",
                intro: "서로를 잡아주는 따뜻한 고산입니다.",
                introDetail: "모바일 개발자로서 생각을 명확하게 전달하는 기술과 TCA 아키텍처를 공부하고 있습니다.",
                strengths: ["모바일"],
                interests: ["iOS", "TCA", "macOS"]
            ),
            Learner(
                nickname: "Rami", name: "이유빈", session: .morning,
                imageName: "character1",
                intro: "안녕하세요, 디자이너 라미입니다!",
                introDetail: "3D 영상과 AR/VR 등 시각디자인 분야를 두루 경험했으며, 출시 전 과정을 배우고 싶어 합니다.",
                strengths: ["UI/UX 디자인", "3d", "브랜딩", "영상"],
                interests: ["Swift", "iOS", "Figma", "UX"]
            ),
            Learner(
                nickname: "Seoyeong", name: "신서영", session: .morning,
                imageName: "character2",
                intro: "안녕하세요 👋 오전 러너 서영입니다!",
                introDetail: "기획과 전략, 교육 분야의 경험을 바탕으로 새로운 팀원들과 소통하는 것을 기다리고 있습니다.",
                strengths: ["기획", "전략", "교육"],
                interests: ["iOS"]
            ),
            Learner(
                nickname: "Hazi", name: "허지우", session: .morning,
                imageName: "character3",
                intro: "하면 하지! 마인드의 하지입니다 😽",
                introDetail: "통계 데이터를 활용해 사람을 설득하는 마케팅과 브랜딩에 관심이 많은 러너입니다.",
                strengths: ["Statistics", "기획"],
                interests: ["Swift", "Figma", "기획", "마케팅"]
            ),
            Learner(
                nickname: "Max", name: "박신영", session: .morning,
                imageName: "character6",
                intro: "아이디어를 서비스로 만드는 개발자입니다.",
                introDetail: "현재 유학생 대상 서비스를 운영 중이며, 인프라와 백엔드 설계에 강점이 있습니다.",
                strengths: ["백엔드", "모바일", "기획", "인프라"],
                interests: ["Flutter", "VisionOS", "Spring"]
            ),
            Learner(
                nickname: "Darren", name: "오도안", session: .morning,
                imageName: "character7",
                intro: "추진력이 넘치는 대런입니다.",
                introDetail: "야구와 강아지를 사랑하며, 데이터 분석과 부동산 등 경제 이슈에 관심이 많은 열정 러너입니다.",
                strengths: ["데이터 사이언스", "데이터 엔지니어링", "기획"],
                interests: ["Swift", "iOS", "Python", "ML"]
            ),
            Learner(
                nickname: "Hosu", name: "양석호", session: .morning,
                imageName: "character5",
                intro: "후회 없는 하루를 살아가자.",
                introDetail: "프론트엔드와 기획 역량을 바탕으로 매일 성장하며 후회 없는 결과를 만들기 위해 노력합니다.",
                strengths: ["프론트엔드", "웹", "기획"],
                interests: ["Swift", "iOS", "Python", "Figma"]
            ),
            Learner(
                nickname: "Neon", name: "김나연", session: .morning,
                imageName: "character4",
                intro: "구조적인 코드를 고민하는 네온입니다~",
                introDetail: "iOS 아키텍처 설계를 즐기며, 비전OS와 블렌더 등 새로운 도구로 자신을 확장하고 싶어 합니다.",
                strengths: ["풀스택", "프론트엔드", "백엔드"],
                interests: ["Swift", "iOS", "VisionOS", "아키텍처 설계"]
            ),
            Learner(
                nickname: "Katt", name: "이다예", session: .morning,
                imageName: "character3",
                intro: "캇짱💥이라고 불러주세요! 캇입니다.",
                introDetail: "디자인 고교 시절부터 다져온 멀티미디어 역량으로 일본어와 어도비 툴 전반에 능숙합니다.",
                strengths: ["UI/UX 디자인", "디자인", "일본어"],
                interests: ["Python", "디자인", "기획", "Marketing"]
            ),
            Learner(
                nickname: "Simon", name: "이시명", session: .morning,
                imageName: "character6",
                intro: "반갑습니다, Simon입니다!",
                introDetail: "데이터 사이언스 전공자로 Python과 ML을 활용한 데이터 분석 및 바이브 코딩을 즐깁니다.",
                strengths: ["데이터 사이언스"],
                interests: ["Python", "ML", "Statistics", "web"]
            ),
            Learner(
                nickname: "Frank", name: "박동훈", session: .morning,
                imageName: "character7",
                intro: "계속 발전해 나가고 있는 러너 프랭크입니다.",
                introDetail: "B2B 영업 경험이 있으며, AWS 자격증 취득과 백엔드 구현을 통해 기술 스택을 쌓아가고 있습니다.",
                strengths: ["B2B 영업", "백엔드"],
                interests: ["iOS", "Python", "Vision", "Aws"]
            ),
            Learner(
                nickname: "Yetii", name: "조예리", session: .morning,
                imageName: "character1",
                intro: "예띠 아니고 예티~!",
                introDetail: "Figma를 활용한 UI/UX 디자인과 브랜딩, 기획에 강점이 있는 디자이너 겸 기획자입니다.",
                strengths: ["UI/UX 디자인", "HCI", "Figma", "기획"],
                interests: ["Swift", "iOS", "JavaScript", "Figma"]
            ),
            Learner(
                nickname: "Sian", name: "이서연", session: .morning,
                imageName: "character2",
                intro: "어디든 들이받기를 실천하고자 온 샨입니다.",
                introDetail: "HCI 및 HAI 연구를 지망하며, 사용자 중심의 디자인 솔루션을 찾는 활동에 열정적입니다.",
                strengths: ["디자인", "Figma", "UX", "HCI"],
                interests: ["React", "Flutter", "Figma", "VisionOS"]
            ),
            Learner(
                nickname: "Jody", name: "조재윤", session: .morning,
                imageName: "character3",
                intro: "조재윤 디자이너 줄여서 조디입니다~",
                introDetail: "힘든 과정이 자신을 더 단단하게 만든다고 믿으며 꾸준히 성장하고 싶은 디자이너입니다.",
                strengths: ["디자인", "UX", "기획"],
                interests: ["바이브코딩", "3D"]
            ),
            Learner(
                nickname: "Lanakee", name: "박정민", session: .morning,
                imageName: "character4",
                intro: "만들고 싶은 것을 만드는 것을 좋아해요.",
                introDetail: "풀스택 역량을 갖추어 아이디어를 실제 프로덕트로 구현하는 과정을 즐기는 개발자입니다.",
                strengths: ["풀스택", "프론트엔드", "백엔드", "UI/UX 디자인"],
                interests: ["React", "JavaScript", "Node.js"]
            ),
            Learner(
                nickname: "Ddoechii", name: "윤현주", session: .morning,
                imageName: "character1",
                intro: "하고 싶은 게 너무 많은 또치입니다!",
                introDetail: "디지털로 할 수 있는 모든 디자인에 관심이 많으며, 특히 3D 모델링과 VR/AR을 탐구합니다.",
                strengths: ["UI/UX 디자인", "HCI", "VR/AR", "Blender"],
                interests: ["Figma", "바이브코딩", "디자인", "기획"]
            ),
            Learner(
                nickname: "KIWI", name: "정경원", session: .morning,
                imageName: "character2",
                intro: "배우는 것과 경험하는 것을 좋아하는 키위입니다!",
                introDetail: "디자인과 코딩을 함께 전공 중이며, 아카데미에서 성실하고 열정적으로 배우며 성장하고 싶습니다.",
                strengths: ["UI/UX 디자인", "기획", "Adobe", "창의력"],
                interests: ["Swift", "Figma", "Prototyping"]
            ),
            Learner(
                nickname: "Yeon", name: "변승연", session: .morning,
                imageName: "character3",
                intro: "다양한 도전을 즐기는 예술가 연입니다. 👨🏻‍🎨",
                introDetail: "순수미술과 영화 전공자로, 비주얼적 감각을 디자인과 개발 영역까지 확장하고자 합니다.",
                strengths: ["브랜딩", "Adobe", "기획", "Fine Arts"],
                interests: ["디자인", "기획", "Marketing"]
            ),
            Learner(
                nickname: "Won", name: "이원창", session: .morning,
                imageName: "character5",
                intro: "반갑습니다, 원입니다!",
                introDetail: "SwiftUI와 Figma를 활용한 앱 개발에 관심이 많으며 바이브 코딩의 즐거움을 찾아가는 중입니다.",
                strengths: ["iOS 개발"],
                interests: ["Swift", "iOS", "Figma", "SwiftUI"]
            ),
            Learner(
                nickname: "Rossi", name: "이은지", session: .morning,
                imageName: "character4",
                intro: "열정 가득한 도파민 중독자 로시입니다!",
                introDetail: "UIKit 프로젝트 경험이 풍부하며, 졸업 유예 후 SwiftUI와 함께 더 넓은 성장을 꿈꾸고 있습니다.",
                strengths: ["모바일", "iOS"],
                interests: ["Swift", "iOS", "Combine", "WatchOS"]
            ),
            Learner(
                nickname: "Neeko", name: "박정은", session: .morning,
                imageName: "character2",
                intro: "분석적 창의력을 가진 문제 해결사 니코입니다.",
                introDetail: "어려운 일도 성장의 자원으로 삼는 긍정적인 태도로 포항에서의 새로운 추억을 만들고자 합니다.",
                strengths: ["UI/UX 디자인", "서비스 디자인"],
                interests: ["Swift", "iOS", "Figma", "SwiftUI"]
            ),
            Learner(
                nickname: "Kori", name: "박하린", session: .morning,
                imageName: "character1",
                intro: "데이터 드리븐 UX 디자인을 지향하는 코리입니다!",
                introDetail: "객관적인 데이터를 바탕으로 크리에이티브한 디자인 솔루션을 도출하는 과정을 즐깁니다.",
                strengths: ["UI/UX 디자인", "HCI", "UX"],
                interests: ["JavaScript", "Figma"]
            ),
            Learner(
                nickname: "Uky", name: "강연욱", session: .morning,
                imageName: "character7",
                intro: "UX/UI 디자인 고수가 되고 싶은 유키입니다.",
                introDetail: "이제 막 시작하는 생초보이지만, 정진하는 자세로 최고의 사용자 경험을 설계하려 합니다.",
                strengths: ["디자인"],
                interests: ["Swift", "iOS", "Figma", "디자인", "기획"]
            ),
            Learner(
                nickname: "Ichi", name: "오하나", session: .morning,
                imageName: "character1",
                intro: "도전과 탐색을 멈추지 않는 51(이치)입니다👋",
                introDetail: "기계공학 전공자로, 자신만의 강점 영역을 찾기 위해 아카데미에서 다양한 시도를 하고 있습니다.",
                strengths: ["디자인", "브랜딩", "python", "기계공학"],
                interests: ["Swift", "iOS", "Python", "Figma"]
            ),
            Learner(
                nickname: "Vince", name: "안재빈", session: .morning,
                imageName: "character5",
                intro: "로봇 엔지니어를 꿈꾸고 준비하고 있는 빈스입니다!",
                introDetail: "기계공학 기반에 머신러닝과 강화학습 소프트웨어 역량을 더해 로봇 제어 분야를 탐구합니다.",
                strengths: ["브랜딩", "기계공학", "Notion"],
                interests: ["Python", "ML", "C++", "ROS"]
            ),
            Learner(
                nickname: "Andy", name: "안동선", session: .morning,
                imageName: "character6",
                intro: "Connector가 되고 싶은 Explorer, 앤디입니다.",
                introDetail: "컴퓨터공학 전공으로 여행과 사진을 좋아하며, 기술과 사람을 잇는 개발자가 되고 싶습니다.",
                strengths: ["Adobe", "컴퓨터공학", "영상"],
                interests: ["Swift", "iOS", "React", "VisionOS"]
            ),
            Learner(
                nickname: "Scylla", name: "이유림", session: .morning,
                imageName: "character2",
                intro: "깊게 파고드는 프로찍먹러, 실라입니다.",
                introDetail: "데이터 사이언스를 전공 중이며, iOS와 디자인 등 새로운 분야를 깊이 있게 배우고자 합니다.",
                strengths: ["데이터 사이언스", "python"],
                interests: ["Swift", "iOS", "Python", "ML"]
            ),
            Learner(
                nickname: "Arya", name: "정혜림", session: .morning,
                imageName: "character3",
                intro: "새로운 소통과 재미를 찾는 아리아입니다🤍",
                introDetail: "낯선 사람과의 대화를 즐기며, 코딩과 디자인의 경계에서 재미있는 것들을 만들어가고 싶습니다.",
                strengths: ["재미 찾기"],
                interests: ["Agentic Coding", "Vibe Coding"]
            ),
            Learner(
                nickname: "Cue", name: "채유성", session: .morning,
                imageName: "character4",
                intro: "🎬 Ready, Set, Cue! 큐입니다.",
                introDetail: "3년의 웹 프론트엔드 개발 경험을 바탕으로, 이제는 모바일 개발에 정착하려 합니다.",
                strengths: ["프론트엔드", "웹"],
                interests: ["Swift", "iOS", "React", "JavaScript"]
            ),
            Learner(
                nickname: "Paul", name: "류현소", session: .morning,
                imageName: "character5",
                intro: "유저의 관점에서 고민하는 프로덕트 빌더 폴입니다.",
                introDetail: "기획과 개발, 디자인 사이에서 유저가 가장 필요로 하는 경험이 무엇인지 공감하고 고민합니다.",
                strengths: ["모바일", "Figma", "PM/PO"],
                interests: ["Swift", "iOS", "Python", "ML"]
            ),
            Learner(
                nickname: "zeze", name: "정유진", session: .morning,
                imageName: "character3",
                intro: "제품에서 UX로 영역을 넓히는 제제입니다🥸",
                introDetail: "산업디자인 전공자로 3D 모델링에 능숙하며, 아카데미에서 기획과 마케팅을 경험하려 합니다.",
                strengths: ["디자인", "3d", "Figma", "Rhino"],
                interests: ["iOS", "Figma", "바이브코딩", "Marketing"]
            ),
            Learner(
                nickname: "Devin", name: "김성현", session: .morning,
                imageName: "character7",
                intro: "콘텐츠 PD에서 엔지니어로, 데빈입니다!",
                introDetail: "유튜브 제작과 메타버스 기획 경험을 거쳐 현재는 데이터 파이프라인과 시스템 구축에 집중합니다.",
                strengths: ["콘텐츠 기획", "시스템 설계"],
                interests: ["데이터 엔지니어링", "콘텐츠 제작", "자동화"]
            ),
            Learner(
                nickname: "Kou", name: "최윤서", session: .morning,
                imageName: "character2",
                intro: "반갑습니다, Kou입니다!",
                introDetail: "모바일 개발과 Flutter 역량을 바탕으로 Swift를 배우며 기술적 성장을 이루고 싶습니다.",
                strengths: ["모바일", "Fluuter"],
                interests: ["Swift", "iOS", "TensorFlow", "Flutter"]
            ),
            Learner(
                nickname: "Gonzales", name: "김원종", session: .morning,
                imageName: "character6",
                intro: "사람과 이야기를 사랑하는 곤잘레스입니다!",
                introDetail: "스타트업에 관심이 많으며, 고객이 실제로 가치를 느끼고 지불하는 서비스를 만들고자 합니다.",
                strengths: ["기획", "UX", "AI 활용"],
                interests: ["바이브코딩", "기획", "비즈니스"]
            ),
            Learner(
                nickname: "Kamcho", name: "강지수", session: .morning,
                imageName: "character2",
                intro: "반전의 재미를 주는 감초 같은 사람, 캄초입니다.",
                introDetail: "디자이너 출신으로 개발을 더 깊이 알고자 하며, 자신만의 속도로 주변을 돌보며 성장하려 합니다.",
                strengths: ["디자인"],
                interests: ["Swift", "iOS", "Prototyping"]
            ),
            Learner(
                nickname: "Maverick", name: "백인하", session: .morning,
                imageName: "character7",
                intro: "낭만 있게 살고 싶은 매버릭입니다.",
                introDetail: "배우고 끝까지 해내는 힘을 믿으며, 마음이 맞는 사람들과 의미 있는 일을 만들어가고 싶습니다.",
                strengths: ["기획", "스토리텔링", "커뮤니케이션"],
                interests: ["Swift", "기획", "Marketing", "창업"]
            ),
            Learner(
                nickname: "Donut", name: "김예진", session: .morning,
                imageName: "character2",
                intro: "산책을 좋아하는 도넛입니다....😳",
                introDetail: "디자인과 창의력이 강점이며, 친해지면 말이 많아지는 따뜻한 소통을 지향합니다.",
                strengths: ["UI/UX 디자인", "디자인", "Adobe"],
                interests: ["Swift", "Figma", "디자인"]
            ),
            Learner(
                nickname: "Evan", name: "현동준", session: .morning,
                imageName: "character5",
                intro: "제품을 엔지니어링하는 에반입니다.",
                introDetail: "프로토타이핑과 LLM 활용에 관심이 많으며 실질적인 도구를 만드는 데 집중합니다.",
                strengths: ["제품 엔지니어링"],
                interests: ["iOS", "Figma", "LLM", "PM"]
            ),
            Learner(
                nickname: "Sonu", name: "곽선우", session: .morning,
                imageName: "character6",
                intro: "망상을 상상으로, 상상을 현실로 만드는 소누입니다.",
                introDetail: "브랜딩과 기획 역량을 바탕으로 창의적인 아이디어를 구체적인 결과물로 시각화합니다.",
                strengths: ["브랜딩", "기획"],
                interests: ["Swift", "iOS", "Figma", "SwiftUI"]
            ),
            Learner(
                nickname: "Som", name: "윤문정", session: .morning,
                imageName: "character3",
                intro: "다양한 취향을 가진 올라운더 솜입니다!",
                introDetail: "프론트엔드와 기획 경험이 풍부하며, 이제는 백엔드와 마케팅까지 섭렵하고자 합니다.",
                strengths: ["프론트엔드", "UI/UX 디자인", "Figma"],
                interests: ["React", "Python", "JavaScript"]
            ),
            Learner(
                nickname: "Juni", name: "선영주", session: .afternoon,
                imageName: "character4",
                intro: "안녕하시와요, 주니입니다.",
                introDetail: "사용자에게 즐거움을 주는 iOS 개발자가 되기 위해 매일 노력하고 공부합니다.",
                strengths: ["iOS"],
                interests: ["Swift", "iOS", "VisionOS", "UIKit"]
            ),
            Learner(
                nickname: "Elena", name: "이서진", session: .afternoon,
                imageName: "character1",
                intro: "세상 한 번 바꿔보고 싶습니다.",
                introDetail: "웰니스와 뇌과학, 의공학에 관심이 많은 풀스택 러너로 AI 경량화와 기획 역량을 갖추고 있습니다.",
                strengths: ["풀스택", "웹", "Figma", "기획", "AI"],
                interests: ["iOS", "TensorFlow", "바이브코딩", "기획"]
            ),
            Learner(
                nickname: "Gentleman", name: "정도영", session: .afternoon,
                imageName: "character7",
                intro: "2027년 셔플 댄스 서비스 창업 예정입니다.",
                introDetail: "AI 앱 출시 경험이 있는 예비 창업가로, 진짜 노력을 통해 기술적 성장을 이루고자 합니다.",
                strengths: ["branding", "기획", "전략", "Tech"],
                interests: ["Swift", "iOS", "Python", "MongoDB"]
            ),
            Learner(
                nickname: "River", name: "강서현", session: .afternoon,
                imageName: "character1",
                intro: "피그마 원툴에서 깊이 있는 강점을 가진 리버로!",
                introDetail: "UX와 인문예술을 전공하며, 찍먹 습관을 버리고 하나를 깊게 파서 내세울 강점을 만들고 싶어 합니다.",
                strengths: ["Figma", "UX", "사용자 중심 사고"],
                interests: ["Swift", "기획", "HCI", "데이터 분석"]
            ),
            Learner(
                nickname: "Riolu", name: "박호연", session: .morning,
                imageName: "character6",
                intro: "부족한 점이 많지만 같이 성장해요.",
                introDetail: "iOS 개발자로서의 역량을 키우기 위해 모바일 환경과 문제 정의에 집중하고 있습니다.",
                strengths: ["모바일", "문제 정의"],
                interests: ["iOS", "VisionOS", "SwiftUI", "macOS"]
            ),
            Learner(
                nickname: "Soori", name: "신서연", session: .afternoon,
                imageName: "character3",
                intro: "독기를 품고 날아온 수리입니다🐥",
                introDetail: "디자인을 사랑하는 semi디자이너이며, 아카데미를 통해 코딩 가능한 디자이너가 되는 것이 목표입니다.",
                strengths: ["디자인", "Figma", "기획", "프리미어프로"],
                interests: ["Swift", "iOS", "Figma", "VisionOS", "디자인"]
            ),
            Learner(
                nickname: "Qwerty", name: "변여경", session: .afternoon,
                imageName: "character4",
                intro: "디자인과 구현을 함께 하는 사람이 되고 싶어요.",
                introDetail: "디자인 전공생으로 탄탄한 기획과 UI/UX를 목표로 하며, 개발도 함께 배우고자 하는 러너입니다.",
                strengths: ["UI/UX 디자인", "Figma", "어도비"],
                interests: ["Figma", "바이브코딩", "백엔드", "디자인"]
            ),
            Learner(
                nickname: "Roro", name: "김민주", session: .afternoon,
                imageName: "character2",
                intro: "창작하는 즐거움을 잊지 않고 싶은 로로입니다😌",
                introDetail: "순수미술 배경을 가졌으며, 사용자와의 소통을 위해 낯선 분야도 즐겁게 도전하는 마음가짐을 가졌습니다.",
                strengths: ["Adobe", "순수미술", "Fine Arts", "일러스트"],
                interests: ["Swift", "JavaScript", "Figma", "SwiftUI"]
            ),
            Learner(
                nickname: "Anne", name: "조은아", session: .afternoon,
                imageName: "character1",
                intro: "경계를 두지 않고 도전하는 디자인 전공생입니다. 📷",
                introDetail: "UXUI 리서치를 논리적 해결책으로 엮는 과정을 즐기며, HTML과 아두이노 제작 경험도 있습니다.",
                strengths: ["UI/UX 디자인"],
                interests: ["Figma", "디자인", "Photoshop", "Illustrator"]
            ),
            Learner(
                nickname: "Tay", name: "한민주", session: .afternoon,
                imageName: "character7",
                intro: "안녕하세요, 감자를 닮은 테이입니다! 🥔",
                introDetail: "전자공학 전공자로 백엔드와 안드로이드 개발 경험이 있으며, 생각의 폭을 넓히기 위해 참여했습니다.",
                strengths: ["백엔드"],
                interests: ["Figma", "java", "바이브코딩", "백엔드"]
            ),
            Learner(
                nickname: "kyeozo", name: "조원경", session: .afternoon,
                imageName: "character6",
                intro: "사람들의 무의식을 디자인하고 싶은 쿄조입니다.",
                introDetail: "UX/UI와 브랜딩을 공부하며, 미디어아트와 퍼블리싱 경험을 바탕으로 개발을 이해하는 디자이너입니다.",
                strengths: ["UI/UX 디자인", "브랜딩","미디어아트"],
                interests: ["Swift", "iOS", "Python", "JavaScript"]
            ),
            Learner(
                nickname: "Bau", name: "하진엽", session: .afternoon,
                imageName: "character5",
                intro: "반갑습니다, 바우입니다!",
                introDetail: "Figma와 Protopie를 활용한 Product Design 및 Visual Design에 전문성을 가진 러너입니다.",
                strengths: ["Figma", "Product Design", "PM"],
                interests: ["디자인", "기획", "PM"]
            ),
            Learner(
                nickname: "Kongsam", name: "박정희", session: .afternoon,
                imageName: "character2",
                intro: "안녕하세요, 콩삼입니다!",
                introDetail: "데이터 사이언스와 헬스케어 분야의 기획 및 UX 경험을 쌓아나가고 있는 러너입니다.",
                strengths: ["데이터 사이언스", "기획", "UX", "헬스케어"],
                interests: ["데이터 분석", "기획", "iOS"]
            ),
            Learner(
                nickname: "Spero", name: "홍지원", session: .afternoon,
                imageName: "character6",
                intro: "두려움 없는 도전을 즐기는 스페로입니다.",
                introDetail: "마음껏 실패하고 성장하는 것을 목표로 하며, 기획과 소통 역량을 바탕으로 9개월을 채우려 합니다.",
                strengths: ["기획", "소통", "글쓰기"],
                interests: ["Swift", "브랜딩", "UI/UX 디자인", "PM"]
            ),
            Learner(
                nickname: "Linkku", name: "김현일", session: .afternoon,
                imageName: "character7",
                intro: "모자가 본체인 인디 앱/게임 개발자 링쿠입니다.",
                introDetail: "수년간의 인디 앱 및 게임 개발 경험을 바탕으로, 지속 가능한 개발자 생활을 고민하고 있습니다.",
                strengths: ["프론트엔드", "모바일", "iOS", "게임"],
                interests: ["Swift", "iOS", "React", "ML"]
            ),
            Learner(
                nickname: "BIBI", name: "박규비", session: .afternoon,
                imageName: "character3",
                intro: "좋은 자극을 주고받으며 성장하고 싶은 비비입니다!",
                introDetail: "3D 영상 디자이너 경력이 있으며, 깔끔한 UIUX 디자인을 중심으로 기획과 개발을 탐구합니다.",
                strengths: ["디자인", "3d", "Adobe", "미디어아트"],
                interests: ["Swift", "브랜딩", "UI/UX 디자인", "AI"]
            ),
            Learner(
                nickname: "Donny", name: "이돈혁", session: .afternoon,
                imageName: "character6",
                intro: "아이디어를 연결하는 협업가 도니입니다.",
                introDetail: "iOS와 프론트엔드 기술을 활용하며, 우선순위 설정과 심미안을 갖춘 프로덕트 제작에 관심이 많습니다.",
                strengths: ["프론트엔드", "Swift", "iOS", "협업"],
                interests: ["Swift", "SwiftUI", "Kotlin", "Aws"]
            ),
            Learner(
                nickname: "Remi", name: "정필규", session: .afternoon,
                imageName: "character6",
                intro: "어떻게든 되지 않을까요? 낙천적인 레미입니다.",
                introDetail: "데이터 분석 전공자로, 인턴 경험을 통해 느낀 부족함을 채우고 나아갈 방향에 대한 인사이트를 찾습니다.",
                strengths: ["데이터 사이언스"],
                interests: ["VisionOS", "data research", "SQL"]
            ),
            Learner(
                nickname: "Hunchi", name: "김상훈", session: .afternoon,
                imageName: "character5",
                intro: "신기술로 사람을 돕고 싶은 훈치입니다!",
                introDetail: "AI와 VisionOS 등 신기술이 접근성(Accessibility)을 어떻게 개선할지 고민하는 것을 좋아합니다.",
                strengths: ["UI/UX 디자인", "컴퓨터비전", "Figma", "기획"],
                interests: ["VisionOS", "AI", "의공학"]
            ),
            Learner(
                nickname: "Jace", name: "김재원", session: .afternoon,
                imageName: "character7",
                intro: "반갑습니다, 제이스입니다!",
                introDetail: "의료 데이터와 데이터 사이언스에 관심이 많으며, 파이썬과 머신러닝 기술을 탐구하고 있습니다.",
                strengths: ["데이터 사이언스", "의료데이터"],
                interests: ["Swift", "Python", "ML", "Statistics"]
            ),
            Learner(
                nickname: "Sue", name: "허지윤", session: .afternoon,
                imageName: "character3",
                intro: "언제나 가득 찬 맥시멀 라이프, 스우입니다.",
                introDetail: "데스크 리서치와 문서화에 능숙하며, 아이디어를 연결해 알찬 기획을 만드는 것을 즐깁니다.",
                strengths: ["기획", "데스크리서치", "문서화"],
                interests: ["iOS", "Figma", "SwiftUI", "디자인"]
            ),
            Learner(
                nickname: "zuki", name: "김지우", session: .afternoon,
                imageName: "character3",
                intro: "자기 자신에게 솔직해지는 PM, 주키입니다!",
                introDetail: "이해하기 쉬운 기획을 지향하며, 바이브 코딩으로 현실적인 아이디어를 서비스로 옮기고 있습니다.",
                strengths: ["브랜딩", "기획", "전략", "PM/PO"],
                interests: ["Swift", "iOS", "Figma", "Prototyping"]
            ),
            Learner(
                nickname: "Dawn", name: "김유태", session: .afternoon,
                imageName: "character6",
                intro: "폭넓은 시도를 즐기는 개발자 단입니다.",
                introDetail: "AI 영상 자동화와 VisionOS에 관심이 많으며, 다양한 신기술을 야무지게 활용하고자 합니다.",
                strengths: ["VR/AR", "개발"],
                interests: ["Kotlin", "바이브코딩", "LLM", "VisionOS"]
            ),
            Learner(
                nickname: "Niya", name: "고수빈", session: .afternoon,
                imageName: "character1",
                intro: "함께 멀리 가고 싶은 니야입니다 🐈‍⬛",
                introDetail: "기술이 사람에게 주는 경험에 관심이 많으며, 기획과 디자인 등 여러 영역을 열린 마음으로 탐색합니다.",
                strengths: ["프론트엔드", "모바일", "컴퓨터공학"],
                interests: ["Swift", "iOS", "Figma", "VisionOS"]
            ),
            Learner(
                nickname: "Sage", name: "장세림", session: .afternoon,
                imageName: "character2",
                intro: "사람을 위해, 사람과 함께 일하고 싶은 세이지입니다!",
                introDetail: "산업공학을 전공하고 인간공학 및 UIUX 전략 기획을 통해 사용자에게 초록빛 경험을 주려 합니다.",
                strengths: ["HCI", "기획", "산업공학", "UI/UX", "데이터"],
                interests: ["Swift", "Figma", "SwiftUI", "디자인"]
            ),
            Learner(
                nickname: "Gonn", name: "박고운", session: .afternoon,
                imageName: "character5",
                intro: "렛미 인트로듀스 마셆🤫",
                introDetail: "풀스택과 백엔드 기획에 강점이 있으며, 겉은 차가워 보일 수 있으나 사실 낯을 가리는 중인 러너입니다.",
                strengths: ["풀스택", "백엔드", "기획"],
                interests: ["Swift", "iOS", "java", "백엔드"]
            ),
            Learner(
                nickname: "Namkoong", name: "남궁재환", session: .afternoon,
                imageName: "character6",
                intro: "남궁재환입니다.",
                introDetail: "기획과 AI 활용에 강점이 있으며, Swift와 Flutter를 이용한 바이브코딩에 관심이 많습니다.",
                strengths: ["기획", "AI 활용"],
                interests: ["Swift", "Flutter", "바이브코딩"]
            ),
            Learner(
                nickname: "Jude", name: "최우진", session: .afternoon,
                imageName: "character7",
                intro: "안녕하세요. Jude입니다.",
                introDetail: "컴퓨터공학 전공자로 C/C++ 위주의 경험을 가졌으며, 아카데미에서 Swift 공부를 열심히 할 계획입니다.",
                strengths: ["C/C++", "컴퓨터공학"],
                interests: ["LLM", "Swift"]
            ),
            Learner(
                nickname: "Karl", name: "강정한", session: .afternoon,
                imageName: "character6",
                intro: "가치를 파는 1인 개발자를 꿈꾸는 카를입니다.",
                introDetail: "일본 도쿄에서 개발자 경력을 쌓았으며, 경마 배팅 서비스 등 특이한 개발 경험이 있습니다. UX와 기획으로 영역을 넓히고자 합니다.",
                strengths: ["백엔드", "데이터 엔지니어링", "AI 활용"],
                interests: ["iOS", "ML", "디자인", "기획", "LLM"]
            ),
            Learner(
                nickname: "Jacky", name: "송지석", session: .afternoon,
                imageName: "character5",
                intro: "iOS를 더욱 깊게 배우고 싶은 러너입니다!",
                introDetail: "전공자이지만 초심자의 마음으로 배우고 있습니다. 영화, 베이스 기타, 라멘 탐방 등 취미가 다양합니다.",
                strengths: ["Figma", "창의력", "아이디어", "Swift"],
                interests: ["Swift", "SwiftUI", "UIKit"]
            ),
            Learner(
                nickname: "Chloe", name: "김새롬", session: .afternoon,
                imageName: "character3",
                intro: "Apple의 기술로 AI를 더 가깝게!",
                introDetail: "AI 연구(3D Reconstruction)를 주로 해온 전공자로, 기하학적 이론을 실제 개발에 적용해보고 싶어 합니다.",
                strengths: ["3D Vision", "Graphics", "DL"],
                interests: ["Swift", "VisionOS"]
            ),
            Learner(
                nickname: "Hazel", name: "원수빈", session: .afternoon,
                imageName: "character2",
                intro: "교육학과이지만 디자인을 합니다 😁",
                introDetail: "사범대와 디자인 복수전공생으로 교육과 디자인의 연결점을 찾고 있으며, 교직 관련 서비스를 만들고 싶어 합니다.",
                strengths: ["UI/UX 디자인", "디자인", "UX"],
                interests: ["Swift", "디자인", "Marketing", "브랜딩"]
            ),
            Learner(
                nickname: "Asher", name: "오효준", session: .afternoon,
                imageName: "character6",
                intro: "도전적인 개발자 Asher입니다.",
                introDetail: "풀스택 개발부터 데이터 사이언스, 핀테크까지 폭넓은 기술 스택을 보유한 도전적인 러너입니다.",
                strengths: ["풀스택", "백엔드", "PM/PO", "AI"],
                interests: ["Swift", "iOS", "디자인", "기획"]
            ),
            Learner(
                nickname: "Rudy", name: "이승준", session: .afternoon,
                imageName: "character3",
                intro: "서비스를 직접 만들고 배포하는 것에 관심이 많습니다.",
                introDetail: "Swift와 UIKit, Combine에 능숙하며 최신 Swift Concurrency와 AI 코딩 툴에 관심이 많습니다.",
                strengths: ["모바일", "Swift", "UIKit", "Combine"],
                interests: ["Swift", "iOS", "VisionOS", "Claude Code"]
            ),
            Learner(
                nickname: "Jardín", name: "최정원", session: .afternoon,
                imageName: "character5",
                intro: "도전하고 싶어하는 하르딘입니다!",
                introDetail: "전공자이지만 개발에 다시 도전하는 마음으로 왔습니다. 서비스 기획, UX/UI, 디지털 아트 등 다방면을 찍먹해본 경험이 있습니다.",
                strengths: ["프론트엔드", "UI/UX 디자인", "Figma", "기획"],
                interests: ["Swift", "Figma", "바이브코딩", "HCI"]
            ),
            Learner(
                nickname: "Hamo", name: "김서영", session: .afternoon,
                imageName: "character1",
                intro: "탁구를 사랑하는 비전공자 하모입니다!",
                introDetail: "진주의 마스코트 '하모'에서 이름을 따왔으며, 긍정적인 마음가짐으로 문서화와 일정 관리에 강점을 보입니다.",
                strengths: ["모바일", "일정 수립 및 관리", "문서화"],
                interests: ["Swift", "Flutter", "백엔드", "English"]
            ),
            Learner(
                nickname: "Luke", name: "태원진", session: .afternoon,
                imageName: "character5",
                intro: "반도체 공정부터 퀀트까지, 루크입니다🧪",
                introDetail: "화학공학 전공자로 데이터 분석을 통해 산업 문제를 해결하는 데 관심이 많습니다. 퀀트 투자 등 데이터 활용 분야를 탐구합니다.",
                strengths: ["화학공학", "수학", "과학", "실험"],
                interests: ["Python", "ML", "VisionOS", "데이터 분석"]
            ),
            Learner(
                nickname: "Mokryun", name: "안동현", session: .afternoon,
                imageName: "character6",
                intro: "사진작가이자 인터뷰어이자 iOS 개발자입니다.",
                introDetail: "11년 경력의 사진작가로 활동하며 브랜드 협업 경험이 풍부합니다. 현재는 iOS 개발자로 덕업일치를 이루고 있습니다.",
                strengths: ["Swift", "iOS", "UIKit", "SwiftUI"],
                interests: ["VisionOS", "기획", "UI/UX 디자인"]
            ),
            Learner(
                nickname: "Maple", name: "최서진", session: .afternoon,
                imageName: "character3",
                intro: "안녕하세요! 메이플입니다🍁",
                introDetail: "기계공학 전공이며 프론트엔드와 iOS 개발에 관심이 많은 열정적인 러너입니다.",
                strengths: ["프론트엔드", "iOS", "기계공학과"],
                interests: ["Swift", "iOS", "Figma", "English"]
            ),
            Learner(
                nickname: "Aman", name: "송재현", session: .afternoon,
                imageName: "character7",
                intro: "일단은 열심히!",
                introDetail: "아직 구체적인 강점은 없지만, 무엇이든 일단 부딪혀보며 배우려는 자세를 가진 러너입니다.",
                strengths: ["기획", "AI 활용"],
                interests: ["바이브코딩", "개발", "기획"]
            ),
            Learner(
                nickname: "Nana", name: "김나영", session: .afternoon,
                imageName: "character1",
                intro: "육각형 풀스택 개발자를 꿈꾸는 나나입니다 🏄‍♂️",
                introDetail: "도전하는 것을 좋아하며 웹과 모바일을 아우르는 풀스택 역량을 키우고자 합니다.",
                strengths: ["프론트엔드", "웹", "iOS"],
                interests: ["iOS", "React", "Django", "Spring"]
            ),
            Learner(
                nickname: "Siu", name: "임가은", session: .afternoon,
                imageName: "character2",
                intro: "필요한 순간 도움을 주는 시우(時雨)입니다.",
                introDetail: "웹 개발 경험을 기반으로 플랫폼의 경계를 넘나들며, 특히 기술과 예술이 결합된 미디어아트에 관심이 많습니다.",
                strengths: ["Figma", "frontend", "Web"],
                interests: ["Swift", "iOS", "React", "Python"]
            ),
            Learner(
                nickname: "Kevin", name: "양동선", session: .afternoon,
                imageName: "character6",
                intro: "해답을 찾으러 온 케빈입니다!",
                introDetail: "산업공학 배경의 백엔드 개발 경험이 있으며, ADA 챌린지를 통해 무엇을 개발하고 싶은지 찾고 있습니다.",
                strengths: ["백엔드", "산업공학", "소통", "바이브 코딩"],
                interests: ["Swift", "iOS", "SwiftUI", "소프트스킬"]
            ),
            Learner(
                nickname: "Hansel", name: "김한슬", session: .afternoon,
                imageName: "character3",
                intro: "디자인과 소프트웨어를 넘나드는 헨젤입니다.",
                introDetail: "인터랙티브 미디어 아트를 좋아하며, 디자인과 개발 사이의 물성을 이용한 상호작용에 관심이 많습니다.",
                strengths: ["디자인", "편집디자인", "웹디자인", "웹개발"],
                interests: ["Swift", "React", "Python", "JavaScript"]
            ),
            Learner(
                nickname: "Kaelyn", name: "신예은", session: .afternoon,
                imageName: "character2",
                intro: "흥 많고 말도 많은 케일린입니다🪽",
                introDetail: "의료 분야에 실질적인 도움이 되는 서비스를 기획하고 싶어 하는 소통 중심의 기획자입니다.",
                strengths: ["기획"],
                interests: ["Python", "Figma", "바이브코딩", "기획"]
            ),
            Learner(
                nickname: "Frisson", name: "평화", session: .afternoon,
                imageName: "character4",
                intro: "게임 개발이 하고 싶은 예비 교사입니다!",
                introDetail: "전기전자공학과 교육학을 전공했으나 개발이라는 꿈을 위해 왔습니다. 게임처럼 매력적인 앱을 만들고 싶어 합니다.",
                strengths: ["기획", "커뮤니케이션", "옵시디언", "교육학"],
                interests: ["Swift", "Figma", "VisionOS", "Unity"]
            ),
            Learner(
                nickname: "Victoria", name: "손민재", session: .afternoon,
                imageName: "character4",
                intro: "안녕하세요 빅토리아입니다!",
                introDetail: "오랜 해외 생활로 한국어가 조금 어색할 수 있지만, 9개월 동안 열심히 배우겠다는 열정을 가진 비전공자 러너입니다.",
                strengths: ["Fine Arts"],
                interests: ["Swift", "디자인", "예술"]
            ),
            Learner(
                nickname: "Heather", name: "김민서", session: .afternoon,
                imageName: "character2",
                intro: "영화와 음악을 사랑하는 헤더입니다!",
                introDetail: "아이디어를 시각적으로 구현하는 데 관심이 많으며, 사용자의 경험을 고려한 서비스를 만들고자 노력합니다.",
                strengths: ["UI/UX 디자인", "창의력"],
                interests: ["iOS", "Figma", "Prototype", "SwiftUI"]
            ),
            Learner(
                nickname: "Hida", name: "이다희", session: .afternoon,
                imageName: "character3",
                intro: "어려운 분야를 쉽게 만드는 디자이너 히다입니다☺️",
                introDetail: "영상 전공에서 UI/UX를 거쳐 개발까지 꿈꾸고 있습니다. 특히 금융 분야의 접근성을 높이는 프로덕트 디자인에 관심이 있습니다.",
                strengths: ["UI/UX 디자인", "기획", "영상"],
                interests: ["Figma", "SwiftUI", "디자인", "영상편집"]
            ),
            Learner(
                nickname: "Craig", name: "김정훈", session: .afternoon,
                imageName: "character6",
                intro: "일단 부딪히고 열심히 해보는 사람!",
                introDetail: "소프트웨어 전공자로 디자인과 개발 모두에 관심이 많습니다. 낯을 가리지만 대화하는 것을 정말 좋아하는 강아지 같은 러너입니다.",
                strengths: ["UI/UX 디자인", "Figma","C/C++"],
                interests: ["Swift", "iOS", "SwiftUI", "UIKit"]
            ),
            Learner(
                nickname: "Jerry", name: "백현진", session: .afternoon,
                imageName: "character7",
                intro: "안녕하세요 iOS 개발자 제리입니다 👨🏿‍💻",
                introDetail: "모바일 개발과 iOS 환경에 집중하고 있으며, Clean Architecture와 SwiftUI를 탐구합니다.",
                strengths: ["모바일", "iOS"],
                interests: ["Figma", "VisionOS", "SwiftUI", "UIKit"]
            ),
            Learner(
                nickname: "Heen", name: "전지원", session: .afternoon,
                imageName: "character3",
                intro: "가능성을 확장해나가는 흰입니다:)",
                introDetail: "서양화와 시각디자인을 전공했으며 브랜딩과 기획에도 관심이 많습니다. 미디어아트와 3D 모델링 등 다양한 시도를 즐깁니다.",
                strengths: ["UI/UX 디자인", "디자인", "Fine Arts"],
                interests: ["Swift", "iOS", "Figma", "VisionOS"]
            ),
            Learner(
                nickname: "Neptune", name: "이은지", session: .afternoon,
                imageName: "character2",
                intro: "머나먼 꿈을 오랫동안 따라가고 싶은 넵튠입니다💫",
                introDetail: "6년의 바리스타 경력을 가졌으며, 흩어진 점들을 모아 개발이라는 선을 그려 나가는 중입니다.",
                strengths: ["프론트엔드", "웹", "C/C++", "컴퓨터공학"],
                interests: ["iOS", "Figma", "바이브코딩", "기획"]
            ),
            Learner(
                nickname: "Esther", name: "정에스더", session: .afternoon,
                imageName: "character3",
                intro: "개발을 짝사랑 중인 러너 에스더입니다. 🌟",
                introDetail: "개발과의 짝사랑을 쌍방으로 만들기 위해 노력 중이며, 독서와 운동을 즐기는 열정적인 러너입니다.",
                strengths: ["풀스택", "웹"],
                interests: ["java", "Kotlin", "Vue.js", "AI"]
            ),
            Learner(
                nickname: "Bin", name: "이정빈", session: .afternoon,
                imageName: "character7",
                intro: "포항살이 22년차 빈입니다.",
                introDetail: "컴퓨터공학 전공자이지만 앱 개발 경험은 부족하여, 이번 기회를 통해 많은 실전 경험을 쌓고 싶어 합니다.",
                strengths: ["기획", "전략", "Cryptography", "건강과체력"],
                interests: ["Swift", "iOS", "Python", "Django"]
            ),
            Learner(
                nickname: "Nooy", name: "정윤서", session: .afternoon,
                imageName: "character1",
                intro: "불확실성 속 가능성을 믿는 노이입니다!!!",
                introDetail: "인공지능과 법학을 전공했으며 영상 미디어에 관심이 많습니다. 다양한 분야를 융합시키는 시도를 기대하고 있습니다.",
                strengths: ["AI", "LLM", "ML", "PremierePro"],
                interests: ["Swift", "JavaScript", "Figma", "Unity"]
            ),
            Learner(
                nickname: "Jigu", name: "박시은", session: .afternoon,
                imageName: "character2",
                intro: "야망 있는 개발자 (진), 지구입니다🌐",
                introDetail: "데이터와 핀테크에 강점이 있으며, 조용해 보이지만 하고 싶은 게 아주 많은 러너입니다.",
                strengths: ["데이터", "핀테크"],
                interests: ["Swift", "Python", "Figma", "바이브코딩"]
            ),
            Learner(
                nickname: "euno", name: "정은호", session: .afternoon,
                imageName: "character4",
                intro: "취미 부자 개발자 으노입니다!",
                introDetail: "인문학에서 컴공으로 전과한 전공자로, 다양한 취미를 공유하며 프로젝트에 참여하고 싶어 합니다.",
                strengths: ["프론트엔드", "협업", "컴퓨터공학전공"],
                interests: ["Swift", "iOS", "Flutter", "백엔드"]
            ),
            Learner(
                nickname: "Sirius", name: "김태은", session: .afternoon,
                imageName: "character7",
                intro: "기술 창업을 꿈꾸는 공대생 기획자입니다!",
                introDetail: "앱 서비스 창업을 목표로 하며 운동, 낚시, 독서 등 다양한 소통을 즐기는 기획 중심 러너입니다.",
                strengths: ["Figma", "UX", "기획", "MSE"],
                interests: ["Swift", "pigma", "수학", "창업"]
            ),
            Learner(
                nickname: "Claire", name: "김경민", session: .afternoon,
                imageName: "character3",
                intro: "다재다능한 융합형 인재 클레어입니다!✨",
                introDetail: "서양화 전공이자 광고 아트 프랍 제작, 뮤지컬 총 연출 등 예술계의 폭넓은 경험을 IT와 융합시키고자 합니다.",
                strengths: ["기획", "창의력", "Fine Arts", "소통"],
                interests: ["Swift", "iOS", "Figma", "디자인"]
            ),
            Learner(
                nickname: "Ian", name: "김지원", session: .afternoon,
                imageName: "character6",
                intro: "앱 출시 경험이 있는 iOS 개발자 이안입니다!",
                introDetail: "SwiftUI와 UIKit에 능숙하며 야구와 축구를 사랑합니다. 창업과 PM 분야에도 관심이 많습니다.",
                strengths: ["프론트엔드", "웹", "VR/AR"],
                interests: ["Figma", "VisionOS", "백엔드", "창업"]
            ),
            Learner(
                nickname: "Han", name: "김하은", session: .afternoon,
                imageName: "character4",
                intro: "서비스 기획의 매력에 빠진 한입니다~",
                introDetail: "뉴미디어콘텐츠 전공자로, 실제 서비스를 출시하고 시장 반응을 보며 발전시키는 경험을 갈망하고 있습니다.",
                strengths: ["기획"],
                interests: ["Figma", "SwiftUI", "바이브코딩", "디자인"]
            ),
            Learner(
                nickname: "Zen", name: "김유진", session: .afternoon,
                imageName: "character2",
                intro: "열려있는 사람, 젠입니다. 🧚‍♀️",
                introDetail: "기획 역량을 끝까지 완성하는 것이 목표이며, 디자인과 개발에서도 평균 이상의 역량을 갖추고자 노력합니다.",
                strengths: ["기획", "소통", "커뮤니케이션"],
                interests: ["기획", "Marketing", "브랜딩", "디자인"]
            ),
            Learner(
                nickname: "Purple", name: "권민재", session: .afternoon,
                imageName: "character7",
                intro: "최적화와 자동화에 빠진 퍼플입니다. 🟪",
                introDetail: "바이브 코딩과 자동화 시스템 구축을 즐기며, AI와 클래식한 손코딩이 공존하는 방법을 찾고 싶어 합니다.",
                strengths: ["Prototyping", "AI 활용", "창의력"],
                interests: ["Swift", "Python", "TensorFlow", "java"]
            ),
            Learner(
                nickname: "EV", name: "김은빈", session: .afternoon,
                imageName: "character2",
                intro: "마음 가는 모든 것을 실행하고픈 이브입니다🌟",
                introDetail: "비전공자로서 개발 가능한 디자이너가 되기 위해 노력 중이며 밴드 음악과 여행을 좋아합니다.",
                strengths: ["Figma", "AI", "UI/UX", "website"],
                interests: ["Swift", "iOS", "Flutter", "SwiftUI", ]
            ),
            Learner(
                nickname: "Noah", name: "이주희", session: .afternoon,
                imageName: "character1",
                intro: "가늘고 길게 살아남는 디자이너 이주희입니다.",
                introDetail: "브랜딩과 그래픽 디자인에 강점이 있으며 친해지면 아주 재미있는 성격의 소유자입니다.",
                strengths: ["branding", "Graphic Design"],
                interests: ["Swift", "UI/UX 디자인", "코딩"]
            ),
            Learner(
                nickname: "Ray", name: "김이주", session: .afternoon,
                imageName: "character4",
                intro: "헤맨 만큼 내 땅! 레이입니다.",
                introDetail: "여러 분야의 호기심을 기반으로 사용자 중심의 서비스를 기둥 세우듯 만들어가고 싶어 하는 기획자입니다.",
                strengths: ["기획", "PM/PO", "마케팅"],
                interests: ["SwiftUI", "UX", "BX", "커피"]
            ),
            Learner(
                nickname: "Bongani", name: "이창현", session: .afternoon,
                imageName: "character6",
                intro: "얕고 넓은 경험을 깊게, 혹은 더 넓게!",
                introDetail: "프로스포츠 산업에 관심이 많으며 다양한 기술과 아이디어를 연결하는 데 즐거움을 느낍니다.",
                strengths: ["Tech", "아이디어 연결", "체력"],
                interests: ["iOS", "바이브코딩", "기획", "창업"]
            ),
            Learner(
                nickname: "Joy", name: "정희수", session: .afternoon,
                imageName: "character2",
                intro: "돈 걱정 없이 창작하고 싶은 조이입니다.",
                introDetail: "풍부한 웹 개발 경력을 보유하고 있으며, 짧고 재밌는 서비스를 함께 만들 동료를 찾고 있습니다.",
                strengths: ["프론트엔드", "UI/UX 디자인", "웹"],
                interests: ["iOS", "ML", "Prototyping", "데이터 분석"]
            ),
            Learner(
                nickname: "Kei", name: "남기하", session: .afternoon,
                imageName: "character6",
                intro: "재미있게 살고 싶은 K 입니다.",
                introDetail: "영업과 소통이 슈퍼파워이며, 생소한 개발과 디자인 영역을 소통으로 풀어내고자 합니다.",
                strengths: ["기획", "아이디어 연결", "소통",],
                interests: ["기획", "마케팅", "브랜딩", "창업", "PM"]
            ),
            Learner(
                nickname: "Min", name: "이경민", session: .afternoon,
                imageName: "character7",
                intro: "아카데미 모두와 친구가 되고 싶은 민입니다!",
                introDetail: "사람에 대한 이해를 바탕으로 불편함을 해결하려는 iOS 개발 지망생으로, 먼저 다가와 주길 기다리고 있습니다.",
                strengths: ["Tech"],
                interests: ["Swift", "iOS", "Flutter", "기획"]
            ),
            Learner(
                nickname: "Karin", name: "이진아", session: .afternoon,
                imageName: "character3",
                intro: "세상에 선한 영향력을 끼치고 싶은 카린입니다.",
                introDetail: "분자생물학, 법의학 등 과학적 배경을 가졌으며 보드게임에 진심인 Fearless한 코딩 초보 러너입니다.",
                strengths: ["분자생물학", "생물학", "NGS"],
                interests: ["Swift", "iOS", "기획", "보드게임"]
            ),
            Learner(
                nickname: "Shayne", name: "유세환", session: .afternoon,
                imageName: "character7",
                intro: "국가대표 출신 멀티 크리에이터 쉐인입니다.",
                introDetail: "보디빌딩 국가대표라는 이색 경력이 있으며, 디자인과 개발을 모두 이해하고 연결하는 풀스택 디자이너를 지향합니다.",
                strengths: ["Figma", "Adobe", "UX/UI"],
                interests: ["Swift", "iOS", "VisionOS", "게임개발"]
            ),
            Learner(
                nickname: "Jun", name: "장지훈", session: .afternoon,
                imageName: "character6",
                intro: "함께 성장해 보아요!",
                introDetail: "컴퓨터공학 전공이지만 iOS는 처음인 만큼 열정적으로 공부하고 교류하며 성장하고 싶은 러너입니다.",
                strengths: ["컴퓨터공학"],
                interests: ["Swift", "java", "기획", "Adobe"]
            ),
            Learner(
                nickname: "Tom", name: "우상영", session: .afternoon,
                imageName: "character5",
                intro: "도전을 즐기는 톰입니다.",
                introDetail: "컴퓨터공학 전공이지만 기획, 행사 운영, 마케팅에 더 큰 열정을 가지고 다양한 경험을 쌓아왔습니다.",
                strengths: ["기획", "AI 활용", "마케팅"],
                interests: ["Swift", "iOS", "React", "Aws"]
            ),
            Learner(
                nickname: "Chris", name: "최민기", session: .afternoon,
                imageName: "character6",
                intro: "공감할 줄 아는 평범한 크리스입니다.",
                introDetail: "사용자의 입장에서 생각하는 UX 디자인을 좋아하며, 무한도전 밈으로 소통하는 것을 즐깁니다.",
                strengths: ["UI/UX 디자인", "3d", "Figma"],
                interests: ["Swift", "Figma", "디자인", "Unreal Engine"]
            ),
            Learner(
                nickname: "Eepy", name: "이윤진", session: .afternoon,
                imageName: "character3",
                intro: "꾸준함이 가장 중요하다고 생각해요!",
                introDetail: "적응이 빠르고 배움에 열정이 넘치며, 기획과 문제 정의 분야에서 꾸준하게 성장하고 싶은 러너입니다.",
                strengths: ["기획", "아이디어 연결", "소통"],
                interests: ["Swift", "iOS", "Figma", "UI/UX 디자인"]
            ),
            Learner(
                nickname: "Crystal", name: "이수정", session: .afternoon,
                imageName: "character4",
                intro: "반짝반짝 빛나는 크리스탈입니다🔮",
                introDetail: "직군 간의 소통을 돕는 외교관 역할을 지향하며, 인스타그램 만화 작가이자 피그마 전문가로 활동 중입니다.",
                strengths: ["UI/UX 디자인", "디자인", "콘텐츠마케팅"],
                interests: ["JavaScript", "Figma", "디자인", "Marketing"]
            ),
            Learner(
                nickname: "Jenna", name: "권민정", session: .afternoon,
                imageName: "character1",
                intro: "디자인까지 잘하는 개발자를 꿈꾸는 제나입니다｡*⭒",
                introDetail: "미감 있는 개발자를 꿈꾸며 개발과 디자인의 조화를 찾아가는 여정 중인 컴퓨터공학 전공생입니다.",
                strengths: ["프론트엔드", "Figma", "컴퓨터공학"],
                interests: ["Swift", "iOS", "Figma", "Blender"]
            ),
            Learner(
                nickname: "Dani", name: "이다예", session: .afternoon,
                imageName: "character2",
                intro: "안녕하세요! 다니입니다🌀",
                introDetail: "풍부한 UX/UI 기획 경험이 있으며, 이번 기회를 통해 개발 지식까지 갖춘 기획자로 성장하고 싶어 합니다.",
                strengths: ["UI/UX 디자인", "Figma", "기획"],
                interests: ["바이브코딩", "기획", "English", "AI"]
            ),
            Learner(
                nickname: "Jade", name: "이종현", session: .afternoon,
                imageName: "character5",
                intro: "세상을 바꿀 무언가를 만들고 싶은 제이드입니다.",
                introDetail: "전자/로봇공학 전공으로 임베디드와 On-device AI에 관심이 많으며 아키텍처 로직 설계에 도움을 줄 수 있습니다.",
                strengths: ["전자공학", "임베디드", "python"],
                interests: ["ML", "HCI", "Healthcaare", "AI"]
            ),
            Learner(
                nickname: "Lauren", name: "채다혜", session: .afternoon,
                imageName: "character3",
                intro: "만들며 함께 멀리 나아갈 사람을 찾는 로렌입니다.",
                introDetail: "브랜딩 디자이너 경력이 있으며 최근 바이브 코딩으로 앱을 출시했습니다. iOS 앱 출시를 목표로 열정적으로 임하고 있습니다.",
                strengths: ["디자인", "브랜딩", "Visual Design"],
                interests: ["Swift", "iOS", "JavaScript", "Figma"]
            ),
            Learner(
                nickname: "Phoebe", name: "김경아", session: .afternoon,
                imageName: "character4",
                intro: "꾸준히 고민하고 성장하는 디자이너 피비입니다!",
                introDetail: "사람을 위한 디자인과 HCI 분야에 관심이 많으며, 긍정적인 사고로 개발과 VisionOS 도전을 꿈꿉니다.",
                strengths: ["UI/UX 디자인"],
                interests: ["Swift", "Figma", "VisionOS", "SwiftUI"]
            ),
            Learner(
                nickname: "BK", name: "최봉권", session: .afternoon,
                imageName: "character6",
                intro: "더 나은 세상을 만드는 도구를 만들고 싶습니다.",
                introDetail: "음악과 사운드 디자인 배경을 가졌으며, 사회 문제 해결을 위한 기술과 예술의 조화에 야망이 있는 기획자입니다.",
                strengths: ["기획", "Apple Logic", "사운드 디자인"],
                interests: ["iOS", "VisionOS", "바이브코딩", "기획"]
            ),
            Learner(
                nickname: "YOOJUN", name: "박유준", session: .afternoon,
                imageName: "character5",
                intro: "대체 불가능한 인력이 되기 위해 노력하는 유준입니다.",
                introDetail: "사회 현상에 컴퓨터공학 지식을 결합해 문제를 해결하는 데 매력을 느끼는 전공자 러너입니다.",
                strengths: ["컴퓨터공학전공"],
                interests: ["Swift", "C++", "문제해결"]
            ),
            Learner(
                nickname: "CurlySue", name: "임정서", session: .afternoon,
                imageName: "character3",
                intro: "도움을 주는 프로덕트를 만드는 기획자 컬리수입니다.",
                introDetail: "문화예술 기획과 공공 SI 프로젝트 경험이 있으며, 비즈니스 모델과 지속 가능성에 대해 깊이 고민합니다.",
                strengths: ["기획"],
                interests: ["iOS", "Figma", "VisionOS", "디자인"]
            ),
            Learner(
                nickname: "Iri", name: "이승아", session: .morning,
                imageName: "character2",
                intro: "안녕하세요! 이리입니다😚",
                introDetail: "컴퓨터학부 전공이지만 디자인과 영어에도 관심이 많으며, 협업하고 귀여운 것을 찾아다니는 것을 좋아합니다.",
                strengths: ["컴퓨터공학", "협업"],
                interests: ["Swift", "Python", "Figma", "C"]
            ),
            Learner(
                nickname: "Bino", name: "김의빈", session: .morning,
                imageName: "character7",
                intro: "직접 물어봐 주시면 알려드리는 비노입니다.",
                introDetail: "모바일 기획과 바이브 코딩에 강점이 있으며 VisionOS와 AR/VR 환경에 깊은 관심을 가지고 있습니다.",
                strengths: ["모바일", "기획", "바이브 코딩"],
                interests: ["VisionOS", "AR", "VR"]
            ),
            Learner(
                nickname: "Iris", name: "박채은", session: .morning,
                imageName: "character2",
                intro: "경험을 통한 배움을 중요하게 생각하는 아이리스예요!",
                introDetail: "공연영상 및 미디어커뮤니케이션 전공자로, 새로운 분야인 IT 협업에 뛰어든 도전적인 러너입니다.",
                strengths: ["미디어", "커뮤니케이션"],
                interests: ["Figma", "디자인", "기획", "Marketing"]
            ),
            Learner(
                nickname: "Norton6", name: "이환훈", session: .morning,
                imageName: "character",
                intro: "사회 문제를 기술과 디자인으로 푸는 노튼입니다😊",
                introDetail: "산업공학 배경의 데이터 사이언티스트로, iOS의 직관적인 경험 설계에 매료되어 시스템적 해결책을 설계하러 왔습니다.",
                strengths: ["데이터 사이언스", "UI/UX 디자인", "HCI"],
                interests: ["Swift", "Python", "ML", "Figma"]
            ),
            Learner(
                nickname: "March", name: "현지민", session: .afternoon,
                imageName: "character2",
                intro: "귀여운 것들을 좋아하는 마치입니다! 🐻",
                introDetail: "다재다능한 디자이너를 꿈꾸며 UI/UX, 그래픽 디자인뿐만 아니라 프론트엔드 역량도 키우고 싶어 합니다.",
                strengths: ["UI/UX 디자인", "디자인", "Graphic Design"],
                interests: ["Swift", "iOS", "JavaScript", "Figma"]
            ),
            Learner(
                nickname: "Stark", name: "이승윤", session: .afternoon,
                imageName: "character7",
                intro: "Apple 생태계에 녹아든 개발자 스타크입니다.",
                introDetail: "스타트업과 오픈소스 경험이 풍부하며 SwiftUI, TCA, Tuist 등 심화된 iOS 기술 스택에 관심이 많습니다.",
                strengths: ["모바일", "iOS"],
                interests: ["Swift", "Figma", "SwiftUI", "Tuist"]
            ),
            
            
            Learner(
                nickname: "Leeo", name: "이현호", session: .mentor,
                imageName: "mentor1",
                intro: "개발자 리입니다. 무엇이든 물어보세요!",
                introDetail: "",
                strengths: ["테크", "iOS 개발"],
                interests: []
            ),
            Learner(
                nickname: "Judy", name: "이민지", session: .mentor,
                imageName: "mentor2",
                intro: "테크멘토입니다. 무엇이든 물어보세요!",
                introDetail: "",
                strengths: ["테크", "멘토링"],
                interests: []
            ),
            Learner(
                nickname: "Gommin", name: "이준민", session: .mentor,
                imageName: "mentor1",
                intro: "테크멘토입니다. 무엇이든 물어보세요!",
                introDetail: "",
                strengths: ["테크", "멘토링"],
                interests: []
            ),
            Learner(
                nickname: "Jiku", name: "구슬지", session: .mentor,
                imageName: "mentor2",
                intro: "디자인 멘토입니다. 무엇이든 물어보세요!",
                introDetail: "",
                strengths: ["디자인", "UI/UX"],
                interests: []
            ),
            Learner(
                nickname: "Sunny", name: "백수영", session: .mentor,
                imageName: "mentor2",
                intro: "IT 담당자 Sunny입니다.",
                introDetail: "",
                strengths: ["IT 인프라", "시스템 관리"],
                interests: []
            ),
            Learner(
                nickname: "Sejin", name: "상세진", session: .mentor,
                imageName: "mentor1",
                intro: "무엇이든 물어보세요!",
                introDetail: "",
                strengths: ["멘토링", "운영"],
                interests: []
            ),
            Learner(
                nickname: "Soo", name: "박수연", session: .mentor,
                imageName: "mentor2",
                intro: "러너들이 아카데미와 포스텍에 잘 적응하고, 무사히 수료할 수 있도록 전반적인 학사 업무를 맡고 있어요!!",
                introDetail: "",
                strengths: ["학사 행정", "운영", "러너 케어"],
                interests: []
            ),
            Learner(
                nickname: "Saya", name: "이사야", session: .mentor,
                imageName: "mentor1",
                intro: "디자인 멘토입니다. 무엇이든 물어보세요!",
                introDetail: "",
                strengths: ["디자인", "시각 디자인"],
                interests: []
            ),
            Learner(
                nickname: "Nathon", name: "염도영", session: .mentor,
                imageName: "mentor1",
                intro: "테크멘토입니다. 무엇이든 물어보세요!",
                introDetail: "",
                strengths: ["테크", "iOS 개발"],
                interests: []
            ),
            Learner(
                nickname: "Friday", name: "김여운", session: .mentor,
                imageName: "mentor1",
                intro: "디자인 멘토입니다. 무엇이든 물어보세요!",
                introDetail: "",
                strengths: ["디자인", "사용자 경험"],
                interests: []
            ),
            Learner(
                nickname: "Jaesung", name: "이재성", session: .mentor,
                imageName: "mentor1",
                intro: "테크 멘토입니다. 무엇이든 물어보세요!",
                introDetail: "",
                strengths: ["테크", "프로그래밍"],
                interests: []
            ),
            Learner(
                nickname: "Haword", name: "한윤진", session: .mentor,
                imageName: "mentor1",
                intro: "테크 멘토입니다. 무엇이든 물어보세요!",
                introDetail: "",
                strengths: ["테크", "Swift"],
                interests: []
            ),
            Learner(
                nickname: "MK", name: "김민경", session: .mentor,
                imageName: "mentor2",
                intro: "Learning Development Mentor입니다.",
                introDetail: "",
                strengths: ["학습 개발", "교육 기획"],
                interests: []
            ),
            Learner(
                nickname: "Gwen", name: "김은정", session: .mentor,
                imageName: "mentor2",
                intro: "멘토 Gwen입니다.",
                introDetail: "",
                strengths: ["운영", "멘토링"],
                interests: []
            ),
            Learner(
                nickname: "Jinny", name: "이여진", session: .mentor,
                imageName: "mentor2",
                intro: "회계 담당자입니다.",
                introDetail: "",
                strengths: ["회계", "재무 관리"],
                interests: []
            ),
            Learner(
                nickname: "Isaac", name: "강희종", session: .mentor,
                imageName: "mentor1",
                intro: "테크 멘토입니다. 무엇이든 물어보세요!.",
                introDetail: "",
                strengths: ["테크", "아키텍처"],
                interests: []
            ),
            Learner(
                nickname: "Jason", name: "이재성", session: .mentor,
                imageName: "mentor1",
                intro: "테크 멘토입니다. 무엇이든 물어보세요!",
                introDetail: "",
                strengths: ["테크", "멘토링"],
                interests: []
            ),
            Learner(
                nickname: "Scarly", name: "김혜리", session: .mentor,
                imageName: "mentor2",
                intro: "파운데이션 프로그램과 대외 협력 담당자입니다.",
                introDetail: "",
                strengths: ["대외 협력", "프로그램 기획"],
                interests: []
            ),
            Learner(
                nickname: "Lingo", name: "윤성관", session: .mentor,
                imageName: "mentor1",
                intro: "테크 멘토입니다. 무엇이든 물어보세요!",
                introDetail: "",
                strengths: ["테크", "컴퓨터 과학"],
                interests: []
            ),
            Learner(
                nickname: "SungP", name: "성유진", session: .mentor,
                imageName: "mentor2",
                intro: "멘토 SungP입니다.",
                introDetail: "",
                strengths: ["운영", "관리"],
                interests: []
            ),
            Learner(
                nickname: "Lumi", name: "정영진", session: .mentor,
                imageName: "mentor1",
                intro: "테크 멘토입니다. 무엇이든 물어보세요!",
                introDetail: "",
                strengths: ["테크", "개발 역량"],
                interests: []
            ),
            Learner(
                nickname: "Jin", name: "손혜진", session: .mentor,
                imageName: "mentor2",
                intro: "애플과 포스텍 간의 연결고리 역할을 하고 있습니다.",
                introDetail: "",
                strengths: ["커뮤니케이션", "파트너십"],
                interests: []
            ),
            Learner(
                nickname: "Jett", name: "최진욱", session: .mentor,
                imageName: "mentor1",
                intro: "멘토 Jett입니다.",
                introDetail: "",
                strengths: ["테크", "운영"],
                interests: []
            ),
            Learner(
                nickname: "Senny", name: "오세빈", session: .mentor,
                imageName: "mentor2",
                intro: "멘토 Senny입니다.",
                introDetail: "",
                strengths: ["운영", "지원"],
                interests: []
            )
        ]
    }
    
}

//프리뷰용
//static var previewContainer: ModelContainer = {
//    let schema = Schema([Learner.self])
//    let config = ModelConfiguration(isStoredInMemoryOnly: true)
//    let container = try! ModelContainer(for: schema, configurations: [config])
//    return container
//}()



