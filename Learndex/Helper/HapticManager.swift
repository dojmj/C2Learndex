//
//  HapticManager.swift
//  Learndex
//
//  Created by 조민지 on 4/23/26.
//

import Foundation
import UIKit

class HapticManager {
    static let instance = HapticManager()
    
    //가벼운 햅틱
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.prepare()
        generator.impactOccurred()
    }
    
    //묵직한 햅틱
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.prepare()
        generator.notificationOccurred(type)
    }
}
