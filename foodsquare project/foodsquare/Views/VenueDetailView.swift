//
//  VenueDetailView.swift
//  foodsquare
//
//  Created by C4Q on 1/23/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class VenueDetailView: UIView {
    lazy var addressButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.blue, for: .normal)
        button.setTitleColor(UIColor.gray, for: .selected)
        return button
    }()
    lazy var venueTypTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.text = "Sushi Resturant"
        label.backgroundColor = UIColor(displayP3Red: 238/255, green: 242/255, blue: 245/255, alpha: 1 )
        return label
    }()
    lazy var tipTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Tips are great for the community"
        textView.backgroundColor = UIColor(displayP3Red: 238/255, green: 242/255, blue: 245/255, alpha: 1 )
        return textView
    }()
    lazy var venueImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "Store Front")
        imageView.backgroundColor = UIColor(displayP3Red: 238/255, green: 242/255, blue: 245/255, alpha: 1 )
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(displayP3Red: 238/255, green: 242/255, blue: 245/255, alpha: 1 )
        setupViews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupViews(){
        setupvenueImageView()
        setupVenueTypeTitle()
        setupTipTextView()
        setupAddressButton()
    }
    func setupvenueImageView(){
        addSubview(venueImageView)
        venueImageView.snp.makeConstraints { (constraint) in
            constraint.top.equalTo(safeAreaLayoutGuide.snp.top)
            constraint.width.equalTo(safeAreaLayoutGuide.snp.width)
            constraint.height.equalTo(safeAreaLayoutGuide.snp.height).multipliedBy(0.65)
            constraint.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
        }
    }
    func setupVenueTypeTitle(){
        addSubview(venueTypTitle)
        venueTypTitle.snp.makeConstraints { (constrain) in
            constrain.top.equalTo(venueImageView.snp.bottom)
            constrain.centerX.equalTo(snp.centerX)
            constrain.width.equalTo(snp.width)
            constrain.height.equalTo(snp.height).multipliedBy(0.05)
        }
    }
    func setupTipTextView() {
        addSubview(tipTextView)
        tipTextView.snp.makeConstraints { (constraint) in
            constraint.top.equalTo(venueTypTitle.snp.bottom)
            constraint.width.equalTo(snp.width)
            constraint.height.equalTo(snp.height).multipliedBy(0.20)
        }
    }
    func setupAddressButton(){
        addSubview(addressButton)
        addressButton.snp.makeConstraints { (constaint) in
            constaint.top.equalTo(tipTextView.snp.bottom).offset(5)
            constaint.centerX.equalTo(snp.centerX)
            constaint.width.equalTo(snp.width)
        }
    }
    
    
}
