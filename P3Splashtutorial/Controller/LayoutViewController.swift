//
//  LayoutViewController.swift
//  P3Splashtutorial
//
//  Created by cmStudent on 2021/08/01.
//  Copyright © 2021 cmStudent. All rights reserved.
//

import UIKit

class LayoutViewController: UIViewController {
    
    /// MARK: - Properties
    /// 縦画面
    private var isPortrait  = Bool()
    /// 横画面
    private var isLandscape = Bool()
    
    
    // MARK: - @IBOutlets
    /// 崩れないレイアウト
    @IBOutlet private weak var layoutCollectionView: UICollectionView!
    
    
    // MARK: - Override Func
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView(layoutCollectionView)
        setupNotification()
        orientationChanged()
    }
    
    
    // MARK: - Private Func
    /// UICollectionViewを設定する
    private func setupCollectionView(_ collectionView: UICollectionView) {
        collectionView.dataSource = self
        collectionView.delegate   = self
        collectionView.register(UINib(nibName: CharacterCell.reuseIdentifier, bundle: nil),
                                forCellWithReuseIdentifier: CharacterCell.reuseIdentifier)
    }
    
    /// Notificationの設定をする
    private func setupNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(orientationChanged), name: UIDevice.orientationDidChangeNotification, object: nil)
    }

    
    // MARK: - @objc Func
    /// デバイスの向きが変わった時に呼ばれる
    @objc private func orientationChanged() {
        let orientation = UIDevice.current.orientation
        isLandscape = orientation.isLandscape
        isPortrait  = orientation.isPortrait
        
        // 画面が縦でも横でもない時(フラットの状態)、UIScreen.main.boundsを利用して縦横の状態を取得
        if !isLandscape && !isPortrait {
            isPortrait = UIScreen.main.bounds.width < UIScreen.main.bounds.height
            isLandscape = !isPortrait
        }
        
        layoutCollectionView.reloadData()
    }
    
}


// MARK: - UICollectionViewDataSource
extension LayoutViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isPortrait {
            return PortraitCharacter.allCases.count
        } else {
            return LandscapeCharacter.allCases.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let characterCell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCell.reuseIdentifier, for: indexPath) as! CharacterCell
        
        var imageName = String()
        if isPortrait {
            imageName = PortraitCharacter.allCases[indexPath.item].imageName
        } else {
            imageName = LandscapeCharacter.allCases[indexPath.item].imageName
        }
        
        characterCell.initialize(imageName: imageName)
        return characterCell
    }
    
}


// MARK: - UICollectionViewDelegateFlowLayout
extension LayoutViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if isPortrait {
            let width  = collectionView.bounds.width / 2 - 10
            let height = collectionView.bounds.height / 5 - 10
            return CGSize(width: width, height: height)
        } else {
            let width  = collectionView.bounds.width / 4 - 10
            let height = collectionView.bounds.height / 3 - 10
            return CGSize(width: width, height: height)
        }
    }
    
}


// MARK: - Reusable
extension LayoutViewController: Reusable {}
