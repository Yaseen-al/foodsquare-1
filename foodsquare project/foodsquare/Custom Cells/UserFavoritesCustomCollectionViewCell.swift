//
//  UserFavoritesCustomCollectionViewCell.swift
//  foodsquare
//
//  Created by Clint M on 1/23/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit

class UserFavoritesCustomCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Outlets
    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Category Name"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    lazy var categoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        // update image
        imageView.image = nil
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    // required. Storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    //MARK: - Functions
    private func commonInit() {
        backgroundColor = .white
        addSubviews()
        setupViews()
    }
    
    private func addSubviews() {
        addSubview(categoryImageView)
        addSubview(categoryLabel)
    }
    
    private func setupViews() {
        setupcategoryImageView()
        setupCategoryLabel()
    }
    
    private func setupcategoryImageView() {
        categoryImageView.snp.makeConstraints { (constraint) -> Void in
            constraint.centerX.equalTo(snp.centerX)
            constraint.top.equalTo(snp.top)
            constraint.width.equalTo(snp.width)
            constraint.height.equalTo(snp.height).multipliedBy(0.75)
            //            constraint.height.equalTo(self).multipliedBy(0.85)
        }
    }
    
    private func setupCategoryLabel() {
        categoryLabel.snp.makeConstraints { (constraint) -> Void in
            constraint.top.equalTo(self.categoryImageView.snp.bottom).offset(10)
            constraint.centerX.equalTo(snp.centerX)
            constraint.width.equalTo(snp.width).multipliedBy(0.9)
        }
    }
    
    public func configureCell(with details: String, and favoriteImage: UIImage) {
        categoryLabel.text = details
        categoryImageView.image = favoriteImage
    }
    
}
