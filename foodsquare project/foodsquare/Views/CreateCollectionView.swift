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
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.backgroundColor = .white
        return view
    }()
    
    lazy var textField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Enter a New Collection Title"
        textfield.backgroundColor = UIColor(displayP3Red: 238/255, green: 242/255, blue: 245/255, alpha: 1 )
        textfield.layer.cornerRadius = 10
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
        setupContainerView()
        setupTextField()
    }
    
    private func setupContainerView() {
        addSubview(containerView)
        containerView.snp.makeConstraints { (make) in
            make.top.bottom.leading.trailing.equalTo(safeAreaLayoutGuide)
        }
    }

    private func setupTextField() {
        addSubview(textField)
        // snapkit constraints
        textField.snp.makeConstraints { (make) in
            make.top.equalTo(containerView.snp.top).offset(5)
            make.width.equalTo(containerView.snp.width).multipliedBy(0.95)
            make.height.equalTo(containerView.snp.height).multipliedBy(0.07)
            make.centerX.equalTo(containerView.snp.centerX)
        }
    }
}



