//
//  TutorialViewController.swift
//  P3Splashtutorial
//
//  Created by cmStudent on 2021/07/31.
//  Copyright © 2021 cmStudent. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController {
    
    // MARK: - Properties
    /// チュートリアルのページ
    private var page = 0

    
    // MARK: - @IBOutlets
    /// チュートリアルを表示するUICollectionView
    @IBOutlet private weak var tutorialCollectionView: UICollectionView!
    /// チュートリアルの現在地を表示するUIPageControl
    @IBOutlet private weak var tutorialPageControl: UIPageControl!
    /// スキップボタン
    @IBOutlet private weak var skipButton: UIButton!
    /// ページを進めるボタン
    @IBOutlet private weak var nextButton: UIButton!
    
    
    // MARK: - Override Func
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView(tutorialCollectionView)
        setupPageControl(tutorialPageControl)
    }
    
    
    // MARK: - Private Func
    /// UICollectionViewの設定をする
    private func setupCollectionView(_ collectionView: UICollectionView) {
        collectionView.dataSource      = self
        collectionView.delegate        = self
        collectionView.isScrollEnabled = false
        collectionView.register(UINib(nibName: TutorialCell.reuseIdentifier, bundle: nil),
                                forCellWithReuseIdentifier: TutorialCell.reuseIdentifier)
    }
    
    /// UIPageControlの設定をする
    private func setupPageControl(_ pageControl: UIPageControl) {
        pageControl.currentPage   = 0
        pageControl.numberOfPages = 3
    }
    
    /// チュートリアルをページングする
    private func paging(_ page: Int) {
        if page < tutorialPageControl.numberOfPages {
            tutorialCollectionView.scrollToItem(at: IndexPath(item: page, section: 0), at: .init(), animated: true)
            tutorialPageControl.currentPage = page
        }
        
        if page >= tutorialPageControl.numberOfPages - 1 {
            nextButton.setTitle("END", for: .normal)
            nextButton.addTarget(self, action: #selector(tappedEndButton(_:)), for: .touchUpInside)
        }
    }
    
    
    // MARK: - @objc
    /// 終わりボタン(EndButton)を押した時の処理
    @objc private func tappedEndButton(_ sender: UIButton) {
        print("end button")
    }

    
    // MARK: - @IBActions
    /// スキップボタンをタップした時の処理
    @IBAction private func tappedSkipButton(_ sender: UIButton) {
    }
    
    /// 次へ進むボタンをタップした時の処理
    @IBAction private func tappedNextButton(_ sender: UIButton) {
        page += 1
        paging(page)
    }
    
}


// MARK: - UICollectionViewDataSource
extension TutorialViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Tutorial.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let tutorialCell = collectionView.dequeueReusableCell(withReuseIdentifier: TutorialCell.reuseIdentifier, for: indexPath) as! TutorialCell
        tutorialCell.initialize(imageName: Tutorial.allCases[indexPath.item].imageName)
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
