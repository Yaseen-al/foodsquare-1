//
//  ResultCustomTableViewCell.swift
//  foodsquare
//
//  Created by C4Q on 1/23/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class ResultCustomTableViewCell: UITableViewCell {
    
    // image square with rounded corners
    lazy var venueImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .gray
        imageView.image = #imageLiteral(resourceName: "No_Image_Available")
        return imageView
    }()
    
    
    // Venue Name Label
    lazy var venueNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Venue Name"
        label.textAlignment = .left
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
        venueImageView.translatesAutoresizingMaskIntoConstraints = false
        // constrain image in custom cell
        //        venueImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        venueImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        venueImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        //        venueImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        venueImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.9).isActive = true
        venueImageView.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.9).isActive = true
    }
    
    func setupVenueNameLabel() {
        addSubview(venueNameLabel)
        venueNameLabel.translatesAutoresizingMaskIntoConstraints = false
        // constrain venue name in custom cell
        venueNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        venueNameLabel.leadingAnchor.constraint(equalTo: venueImageView.trailingAnchor, constant: 5).isActive = true
    }
    
    func setupCategoryLabel() {
        addSubview(categoryLabel)
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        // constrain category label in custom cell
        categoryLabel.topAnchor.constraint(equalTo: venueNameLabel.bottomAnchor, constant: 5).isActive = true
        categoryLabel.leadingAnchor.constraint(equalTo: venueImageView.trailingAnchor, constant: 5).isActive = true
    }
    
    
    public func configureCell(venue: Venue) {
        venueNameLabel.text = venue.name
        categoryLabel.text = "\(venue.categories)"
        //        if let imageURL = /// IMAGE URL  {
        //        if let image =
        //    } else {
        //        venueImageView.image = UIImage(#imageLiteral(resourceName: "No_Image_Available")
    }
    
}




