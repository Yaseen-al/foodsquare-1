//
//  ResultCustomTableViewCell.swift
//  foodsquare
//
//  Created by C4Q on 1/23/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit

class ResultCustomTableViewCell: UITableViewCell {
    
    // image square with rounded corners
    lazy var venueImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .gray
        imageView.image = nil
        return imageView
    }()
    
    
    // Venue Name Label
    lazy var venueNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Venue Name"
        label.textAlignment = .left
        label.numberOfLines = 2
        //        label.backgroundColor = .green
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    
    // Category Label
    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Category Name"
        label.textAlignment = .left
        //        label.backgroundColor = .red
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    
    // setup custom view
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "ResultCell") // name my custom cell
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .white
        setupViews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //        venueImageView.layer.cornerRadius = venueImageView.bounds.width / 5.0 // rounds the image corners
        venueImageView.layer.cornerRadius = 5.0
        venueImageView.layer.masksToBounds = true
    }
    
    
    private func setupViews() {
        setupVenueImageView()
        setupVenueNameLabel()
        setupCategoryLabel()
    }
    
    func setupVenueImageView() {
        addSubview(venueImageView)
        venueImageView.snp.makeConstraints { (make) in
            make.top.equalTo(snp.top).offset(5)
            make.leading.equalTo(snp.leading).offset(5)
            make.centerY.equalTo(snp.centerY)
            make.height.equalTo(snp.height).multipliedBy(0.9)
            make.width.equalTo(snp.height).multipliedBy(0.9)
        }
    }
    
    func setupVenueNameLabel() {
        addSubview(venueNameLabel)
        venueNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(snp.top).offset(5)
            make.leading.equalTo(venueImageView.snp.trailing).offset(5)
            make.trailing.equalTo(snp.trailing).offset(-5)
        }
        
    }
    
    func setupCategoryLabel() {
        addSubview(categoryLabel)
        categoryLabel.snp.makeConstraints { (make) in
            make.top.equalTo(venueNameLabel.snp.bottom).offset(5)
            make.leading.equalTo(venueImageView.snp.trailing).offset(5)
        }
    }
    
    
    public func configureCell(venue: Venue) {
        venueNameLabel.text = venue.name
        categoryLabel.text = "\(venue.categories)"
//                if let imageURL =  /// IMAGE URL  {
//                if let image =
//            } else {
//                venueImageView.image = UIImage(#imageLiteral(resourceName: "No_Image_Available")
    }
    
}




