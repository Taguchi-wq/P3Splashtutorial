//
//  PortraitCharacter.swift
//  P3Splashtutorial
//
//  Created by cmStudent on 2021/08/01.
//  Copyright © 2021 cmStudent. All rights reserved.
//

import Foundation

public enum PortraitCharacter: CaseIterable {
    case ne, mi, ushi, uma, tora, hitsuji, u, saru, tatsu, tori
    
    /// 画像の名前
    var imageName: String {
        switch self {
        case .ne:
            return "ne"
        case .mi:
            return "mi"
        case .ushi:
            return "ushi"
        case .uma:
            return "uma"
        case .tora:
            return "tora"
        case .hitsuji:
            return "hitsuji"
        case .u:
            return "u"
        case .saru:
            return "saru"
        case .tatsu:
            return "tatsu"
        case .tori:
            return "tori"
        }
    }
}
