//
//  LandscapeCharacter.swift
//  P3Splashtutorial
//
//  Created by cmStudent on 2021/08/01.
//  Copyright © 2021 cmStudent. All rights reserved.
//

import Foundation

public enum LandscapeCharacter: CaseIterable {
    case ne, ushi, mi, uma, tora, u, hitsuji, saru, tatsu, space, tori
    
    /// 画像の名前
    var imageName: String {
        switch self {
        case .ne:
            return "ne"
        case .ushi:
            return "ushi"
        case .mi:
            return "mi"
        case .uma:
            return "uma"
        case .tora:
            return "tora"
        case .u:
            return "u"
        case .hitsuji:
            return "hitsuji"
        case .saru:
            return "saru"
        case .tatsu:
            return "tatsu"
        case .space:
            return ""
        case .tori:
            return "tori"
        }
    }
}
