//
//  LoadingScreenView.swift
//  foodsquare
//
//  Created by Clint Mejia on 1/25/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit

class LoadingScreenView: UIView {
    
    //MARK: - Outlets
    lazy var imageViewOne: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "fooddonuts")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var imageViewTwo: UIImageView = {
        let imageView = UIImageView()
        imageView.image =  #imageLiteral(resourceName: "foodcocktail")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var imageViewThree: UIImageView = {
        let imageView = UIImageView()
        imageView.image =  #imageLiteral(resourceName: "foodiceCream")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var imageViewFour: UIImageView = {
        let imageView = UIImageView()
        imageView.image =  #imageLiteral(resourceName: "foodpizzaPie")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var imageViewFive: UIImageView = {
        let imageView = UIImageView()
        imageView.image =  #imageLiteral(resourceName: "foodcomboMeal2")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var imageViewSix: UIImageView = {
        let imageView = UIImageView()
        imageView.image =  #imageLiteral(resourceName: "foodsandwich")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var imageViewSeven: UIImageView = {
        let imageView = UIImageView()
        imageView.image =  #imageLiteral(resourceName: "foodcomboMeal")
        imageView.contentMode = .scaleAspectFit
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
        addSubview(imageViewOne)
        addSubview(imageViewTwo)
        addSubview(imageViewThree)
        addSubview(imageViewFour)
        addSubview(imageViewFive)
        addSubview(imageViewSix)
        addSubview(imageViewSeven)
    }
    
    private func setupViews() {
        setupImageViewOne()
        setupImageViewTWo()
        setupImageViewThree()
        setupImageViewFour()
        setupImageViewFive()
        setupImageViewSix()
        setupImageViewSeven()
    }
    
    private func setupImageViewOne() {
        imageViewOne.snp.makeConstraints { (make) -> Void in
            make.centerX.equalTo(self)
            make.bottom.equalTo(self).offset(-20)
            make.height.width.equalTo(snp.height).multipliedBy(0.15)
        }
    }
    
    private func setupImageViewTWo() {
        imageViewOne.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(self).offset(-20)
            make.top.equalTo(self).offset(-20)
            make.height.width.equalTo(snp.height).multipliedBy(0.15)
        }
    }
    
    private func setupImageViewThree() {
        imageViewOne.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(self).offset(-150)
            make.top.equalTo(self).offset(-90)
            make.height.width.equalTo(snp.height).multipliedBy(0.15)
        }
    }
    
    private func setupImageViewFour() {
        imageViewOne.snp.makeConstraints { (make) -> Void in
            make.centerX.equalTo(self).offset(100)
            make.trailing.equalTo(self).offset(-200)
            make.height.width.equalTo(snp.height).multipliedBy(0.15)
        }
    }
    
    private func setupImageViewFive() {
        imageViewOne.snp.makeConstraints { (make) -> Void in
            make.centerX.equalTo(self).offset(-40)
            make.bottom.equalTo(self).offset(-140)
            make.height.width.equalTo(snp.height).multipliedBy(0.15)
        }
    }
    
    private func setupImageViewSix() {
        imageViewOne.snp.makeConstraints { (make) -> Void in
            make.centerX.equalTo(self)
            make.bottom.equalTo(self).offset(-20)
            make.height.width.equalTo(snp.height).multipliedBy(0.15)
        }
    }
    
    private func setupImageViewSeven() {
        imageViewOne.snp.makeConstraints { (make) -> Void in
            make.centerX.equalTo(self)
            make.bottom.equalTo(self).offset(-20)
            make.height.width.equalTo(snp.height).multipliedBy(0.15)
        }
    }
    
}
