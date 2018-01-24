//
//  UserFavoritesView.swift
//  foodsquare
//
//  Created by C4Q on 1/23/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class UserFavoritesView: UIView {
    
    //MARK: - Constants
    let cellID = "UserFavoritesCustomCollectionViewCell"
    
    //MARK: - Outlets
    lazy var userFavoritesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        let screenHeight: CGFloat = UIScreen.main.bounds.height
        let screenWidth: CGFloat = UIScreen.main.bounds.width
        let cellSpacing: CGFloat = 15.0
        let numberOfCells: CGFloat = 2
        let numberOfSpaces: CGFloat = numberOfCells + 1
        layout.itemSize = CGSize(width: (screenWidth - (cellSpacing * numberOfSpaces)) / numberOfCells, height: screenHeight * 0.25)
        layout.sectionInset = UIEdgeInsetsMake(cellSpacing, cellSpacing , cellSpacing, cellSpacing )
        layout.minimumLineSpacing = cellSpacing
        layout.minimumInteritemSpacing = cellSpacing
        collectionView.backgroundColor = .white
        collectionView.register(UserFavoritesCustomCollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupView(){
        setupUserFavoritesCollectionView()
    }
    
    private func setupUserFavoritesCollectionView(){
        addSubview(userFavoritesCollectionView)
        userFavoritesCollectionView.snp.makeConstraints { (constraint) in
            constraint.edges.equalTo(snp.edges)
        }
    }
}

