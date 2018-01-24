//
//  CreateCollectionView.swift
//  foodsquare
//
//  Created by C4Q on 1/23/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit

class CreateCollectionView: UIView {
    
    // top right bar button hosted on CreateCollectionViewController
    
    lazy var textField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Enter a New Collection Title"
        textfield.borderStyle = .line
        textfield.textAlignment = .center
        return textfield
    }()
    
    // setup custom view
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .clear
        setupViews()
    }
    
    private func setupViews() {
        setupTextField()
    }
    
    private func setupTextField() {
        addSubview(textField)
        // snapkit constraints
        textField.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.width.equalTo(safeAreaLayoutGuide.snp.width)
            make.height.equalTo(safeAreaLayoutGuide.snp.height).multipliedBy(0.09)
            make.centerX.equalTo(center)
        }
    }
}
