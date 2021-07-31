//
//  TutorialViewController.swift
//  P3Splashtutorial
//
//  Created by cmStudent on 2021/07/31.
//  Copyright © 2021 cmStudent. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController {

    // MARK: - @IBOutlets
    /// チュートリアルを表示するUICollectionView
    @IBOutlet private weak var tutorialCollectionView: UICollectionView!
    
    
    // MARK: - Override Func
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView(tutorialCollectionView)
    }
    
    
    // MARK: - Private Func
    /// UICollectionViewの設定をする
    private func setupCollectionView(_ collectionView: UICollectionView) {
        collectionView.dataSource      = self
        collectionView.delegate        = self
        collectionView.isPagingEnabled = true
        collectionView.register(UINib(nibName: TutorialCell.reuseIdentifier, bundle: nil),
                                forCellWithReuseIdentifier: TutorialCell.reuseIdentifier)
    }

}


// MARK: - UICollectionViewDataSource
extension TutorialViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let tutorialCell = collectionView.dequeueReusableCell(withReuseIdentifier: TutorialCell.reuseIdentifier, for: indexPath) as! TutorialCell
        return tutorialCell
    }
    
}


// MARK: - UICollectionViewDelegateFlowLayout
extension TutorialViewController: UICollectionViewDelegateFlowLayout {
    
    /// cellのサイズ
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    
    /// cellの間隔のサイズ
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
