//
//  SaveToFavoritesView.swift
//  foodsquare
//
//  Created by C4Q on 1/23/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class SaveToFavoritesView: UIView {
    lazy var tipLabel: UILabel = {
        let label = UILabel()
        label.text = "Leave A Tip"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textAlignment = .center
        return label
    }()
    lazy var tipTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Add a tip, e.g: Best Tacos in town"
        textView.layer.cornerRadius = 10
        textView.textAlignment = .center
        textView.textColor = .gray
        return textView
    }()
    lazy var newCollectionTitleTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 10
        textField.textAlignment = .center
        textField.backgroundColor = .white
        textField.placeholder = " Enter new Collection Title"
        return textField
    }()
    lazy var collectionView: UICollectionView = {
        let screenHeight: CGFloat = UIScreen.main.bounds.height
        let screenWidth: CGFloat = UIScreen.main.bounds.width
        let cellSpacing: CGFloat = 10
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: screenWidth * 0.35, height: screenHeight * 0.20)
        layout.sectionInset = UIEdgeInsetsMake(cellSpacing, cellSpacing + 5, cellSpacing, cellSpacing + 5)
        layout.minimumLineSpacing = cellSpacing
        layout.minimumInteritemSpacing = cellSpacing
        layout.scrollDirection = .horizontal
        layout.scrollDirection = .vertical
        let cView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        cView.backgroundColor = .white
        let defaultCell = UICollectionViewCell()
        cView.layer.cornerRadius = 10
        cView.register(SaveToFavoritesCustomCollectionViewCell.self, forCellWithReuseIdentifier: "customCell")
        return cView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(displayP3Red: 238/255, green: 242/255, blue: 245/255, alpha: 1 )
        setupViews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupViews(){
        setupNewCollectionTitleTextField()
        setupTipLabel()
        setupTipTextField()
        setupCollectionView()
    }
    func setupNewCollectionTitleTextField(){
        addSubview(newCollectionTitleTextField)
        newCollectionTitleTextField.snp.makeConstraints { (constraint) in
            constraint.centerX.equalTo(snp.centerX)
            constraint.top.equalTo(snp.top).offset(5)
            constraint.width.equalTo(snp.width).multipliedBy(0.90)
            constraint.height.equalTo(snp.height).multipliedBy(0.05)
        }
    }
    func setupTipLabel(){
        addSubview(tipLabel)
        tipLabel.snp.makeConstraints { (constraint) in
            constraint.top.equalTo(newCollectionTitleTextField.snp.bottom).offset(5)
            constraint.centerX.equalTo(snp.centerX)
            constraint.width.equalTo(snp.width).multipliedBy(0.90)
            constraint.height.equalTo(snp.height).multipliedBy(0.05)
        }
    }
    func setupTipTextField() {
        addSubview(tipTextView)
        tipTextView.snp.makeConstraints { (constraint) in
            constraint.top.equalTo(tipLabel.snp.bottom).offset(10)
            constraint.centerX.equalTo(snp.centerX)
            constraint.width.equalTo(snp.width).multipliedBy(0.90)
            constraint.height.equalTo(snp.height).multipliedBy(0.35)
            
        }
    }
    func setupCollectionView(){
        addSubview(collectionView)
        collectionView.snp.makeConstraints { (constraint) in
            constraint.top.equalTo(tipTextView.snp.bottom).offset(10)
            constraint.centerX.equalTo(snp.centerX)
            constraint.width.equalTo(snp.width).multipliedBy(0.90)
            constraint.bottom.equalTo(snp.bottom)
            
        }
    }
    
    
}

