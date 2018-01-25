//
//  SaveToFavoritesCustomCollectionViewCell.swift
//  foodsquare
//
//  Created by C4Q on 1/23/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class SaveToFavoritesCustomCollectionViewCell: UICollectionViewCell {
    lazy var addToCollectionButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "add"), for: .normal)
        return button
    }()
    lazy var collectionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Tasty Mushrooms"
        return label
    }()
    let collectionImage: UIImageView = {
        var image = UIImageView()
        return image
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupViews(){
        setupCollectionImage()
        setupCollectionLabel()
        setupAddToCollectionButton()
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
    func setupAddToCollectionButton() {
        collectionImage.addSubview(addToCollectionButton)
        addToCollectionButton.snp.makeConstraints { (constraint) in
            constraint.centerY.equalTo(collectionImage.snp.centerY)
            constraint.centerX.equalTo(collectionImage.snp.centerX)
        }
    }
    
    
}
