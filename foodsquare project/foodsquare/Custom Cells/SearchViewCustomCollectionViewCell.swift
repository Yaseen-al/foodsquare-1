//
//  SearchViewCustomCollectionViewCell.swift
//  foodsquare
//
//  Created by C4Q on 1/23/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class SearchViewCustomCollectionViewCell: UICollectionViewCell {
    lazy var collectionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.text = "Tasty Mushrooms testing"
        label.numberOfLines = 2
        return label
    }()
    let collectionImage: UIImageView = {
        var image = UIImageView()
        image.backgroundColor = .orange
        return image
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        backgroundColor = .cyan
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupViews(){
        setupCollectionImage()
        setupCollectionLabel()
    }
    func setupCollectionImage(){
        addSubview(collectionImage)
        collectionImage.snp.makeConstraints { (constraint) in
            constraint.centerX.equalTo(snp.centerX)
            constraint.top.equalTo(snp.top).offset(5)
            constraint.width.equalTo(snp.width).multipliedBy(0.85)
            constraint.height.equalTo(snp.height).multipliedBy(0.65)
        }
    }
    func setupCollectionLabel() {
        addSubview(collectionLabel)
        collectionLabel.snp.makeConstraints { (constraint) in
            constraint.centerX.equalTo(snp.centerX)
            constraint.top.equalTo(collectionImage.snp.bottom).offset(5)
            constraint.width.equalTo(snp.width).multipliedBy(0.85)
        }
    }
    
}


