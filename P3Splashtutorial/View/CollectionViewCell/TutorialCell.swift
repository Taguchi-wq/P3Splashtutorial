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
    
    
    // MARK: - Override Func
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    // MARK: - initializer
    func initialize(imageName: String) {
        tutorialNumberImageView.image = UIImage(named: imageName)
    }

}


// MARK: - Reusable
extension TutorialCell: Reusable {}
