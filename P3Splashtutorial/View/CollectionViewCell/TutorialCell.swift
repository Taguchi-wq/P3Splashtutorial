//
//  TutorialCell.swift
//  P3Splashtutorial
//
//  Created by cmStudent on 2021/07/31.
//  Copyright © 2021 cmStudent. All rights reserved.
//

import UIKit

class TutorialCell: UICollectionViewCell {

    // MARK: - @IBOutlets
    /// チュートリアルの画像を表示するUIImageView
    @IBOutlet private weak var tutorialNumberImageView: UIImageView!
    /// チュートリアルの現在地を表示するUIPageControl
    @IBOutlet private weak var tutorialPageControl: UIPageControl!
    /// スキップボタン
    @IBOutlet private weak var skipButton: UIButton!
    /// ページを進めるボタン
    @IBOutlet private weak var nextButton: UIButton!
    
    
    // MARK: - Override Func
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}


// MARK: - Reusable
extension TutorialCell: Reusable {}
