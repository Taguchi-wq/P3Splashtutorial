//
//  CharacterCell.swift
//  P3Splashtutorial
//
//  Created by cmStudent on 2021/08/01.
//  Copyright © 2021 cmStudent. All rights reserved.
//

import UIKit

class CharacterCell: UICollectionViewCell {

    // MARK: - @IBOutlets
    /// キャラクターを表示するUIImageView
    @IBOutlet private weak var characterImageView: UIImageView!
    
    
    // MARK: - Override Func
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    // MARK: - initializer
    func initialize(imageName: String) {
        characterImageView.image = UIImage(named: imageName)
    }

}


// MARK: - Reusable
extension CharacterCell: Reusable {}
