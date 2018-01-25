//
//  SearchViewCustomCollectionViewCell.swift
//  foodsquare
//
//  Created by C4Q on 1/23/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class SearchViewCustomCollectionViewCell: UICollectionViewCell {
    lazy var venueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Tasty Mushrooms"
        return label
    }()
    let venueImage: UIImageView = {
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
    }
    func setupCollectionImage(){
        addSubview(venueImage)
        venueImage.snp.makeConstraints { (constraint) in
            constraint.centerX.equalTo(snp.centerX)
            constraint.top.equalTo(snp.top).offset(5)
            constraint.width.equalTo(snp.width).multipliedBy(0.85)
            constraint.height.equalTo(snp.height).multipliedBy(0.65)
        }
    }
    func setupCollectionLabel() {
        addSubview(venueLabel)
        venueLabel.snp.makeConstraints { (constraint) in
            constraint.centerX.equalTo(snp.centerX)
            constraint.top.equalTo(venueImage.snp.bottom).offset(5)
            constraint.width.equalTo(snp.width).multipliedBy(0.85)
        }
    }
    
}
