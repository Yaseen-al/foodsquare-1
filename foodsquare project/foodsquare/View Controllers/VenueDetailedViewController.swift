//
//  VenueDetailedViewController.swift
//  foodsquare
//
//  Created by C4Q on 1/23/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class VenueDetailedViewController: UIViewController {
    var venue: Venue{
        didSet{
        }
    }
    init(venue: Venue) {
        self.venue = venue
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let venueView = VenueDetailView()
    override func viewDidLoad() {
        view.backgroundColor = .white
        setupvenueView()
        configureNavBar()
        configureViews()
    }
    private func configureViews(){
        self.venueView.venueTypTitle.text = self.venue.categories.first?.name
        self.venueView.tipTextView.text = self.venue.location.formattedAddress.joined(separator: " ")
        
//                ImageAFireAPIClient.manager.getImages(urlStr: self.venue.imageURL!, completionHandler: {self.venueView.venueImageView.image = $0}, errorHandler: {print($0)})
        
        var items = [Item](){
            didSet{
                print(items.count)
                guard let item = items.first else{
                    return
                }
                let imageURLStr = "\(item.purplePrefix)\(item.width)\(item.height)\(item.suffix)"
                let imageURL = URL(string: imageURLStr)
                self.venueView.venueImageView.kf.setImage(with: imageURL, placeholder: #imageLiteral(resourceName: "restaurant logo"), options: nil, progressBlock: nil, completionHandler: nil)
            }
        }
        PhotoAFireAPIClient.manager.getPhotosForVenue(venueID: venue.id
            , completionHandler: {items = $0}, errorHandler: {print($0)})
        
        
    }
    private func configureNavBar(){
        navigationItem.title = self.venue.name
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        let addNavButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNavButtonAction))
        navigationItem.rightBarButtonItem = addNavButton
    }
    
    //MARK: - addNavButton Action
    @objc func addNavButtonAction(){
        //TODO Add the venue to a collection buy going to the addToCollection view controller
        let saveVenueToFavoritesViewController = SaveToFavoritesViewController()
        let saveVenueToFavoritesNavController = UINavigationController(rootViewController: saveVenueToFavoritesViewController)
        present(saveVenueToFavoritesNavController, animated: true, completion: nil)
    }
    func setupvenueView(){
        view.addSubview(venueView)
        venueView.snp.makeConstraints { (constraint) in
            constraint.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
}

