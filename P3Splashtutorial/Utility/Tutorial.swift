//
//  Tutorial.swift
//  P3Splashtutorial
//
//  Created by cmStudent on 2021/07/31.
//  Copyright © 2021 cmStudent. All rights reserved.
//

import Foundation

public enum Tutorial: CaseIterable {
    case one
    case two
    case three
    
    /// 画像の名前
    var imageName: String {
        switch self {
        case .one:
            return "1"
        case .two:
            return "2"
        case .three:
            return "3"
        }
    }
}
