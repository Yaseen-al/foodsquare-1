//
//  VenueDetailedViewController.swift
//  foodsquare
//
//  Created by C4Q on 1/23/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class VenueDetailedViewController: UIViewController {
    var venue: Venue
    init(venue: Venue) {
        self.venue = venue
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let venueView = VenueDetailView()
    override func viewDidLoad() {
        
        setupvenueView()
        configureNavBar()
        configureViews()
    }
    private func configureViews(){
        self.venueView.venueTypTitle.text = self.venue.categories.first?.name
        self.venueView.tipTextView.text = self.venue.contact.formattedPhone
        self.venueView.addressButton.setTitle(venue.location.formattedAddress.joined(separator: " "), for: UIControlState.normal)
        self.venueView.addressButton.addTarget(self, action: #selector(addressNavigation(selector:)), for: UIControlEvents.touchUpInside)
        var items = [Item](){
            didSet{
                print(items.count)
                guard let item = items.first else{
                    return
                }
                
                let imageURLStr = "\(item.purplePrefix)\(item.width)\(item.height)\(item.suffix)"
                if let image = ImageCache.manager.getImage(with: imageURLStr){
                    
                    self.venueView.venueImageView.image = image
                    
                }else{
                    let imageURL =  URL(string: imageURLStr)
                    self.venueView.venueImageView.kf.setImage(with: imageURL, placeholder: #imageLiteral(resourceName: "Store Front"), options: nil, progressBlock: nil, completionHandler: { (image, error, cache, url) in
                        if let image = image{
                            ImageCache.manager.addImage(with: imageURLStr, and: image)
                        }
                    })
                    
                }
            }
        }
        PhotoAFireAPIClient.manager.getPhotosForVenue(venueID: venue.id
            , completionHandler: {items = $0}, errorHandler: {print($0)})
    }
    @objc func addressNavigation(selector: UIButton){
        print("Dev: Navigate")
    }
    private func configureNavBar(){
        navigationItem.title = self.venue.name
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        let addNavButton = UIBarButtonItem(image: #imageLiteral(resourceName: "add-anchor-point"), style: .done, target: self, action: #selector(addNavButtonAction))
        navigationItem.rightBarButtonItem = addNavButton
    }
    
    //MARK: - addNavButton Action
    @objc func addNavButtonAction(){
        //TODO Add the venue to a collection buy going to the addToCollection view controller
        let preCreatedCollection = Collection(venues: nil, title: "American Food", imageName: "burger Image")
        
        let saveVenueToFavoritesViewController = SaveToFavoritesViewController(venue: self.venue, precreatedCollection: preCreatedCollection)
        let SaveVenueToFavoritesNavController = UINavigationController(rootViewController: saveVenueToFavoritesViewController)
        present(SaveVenueToFavoritesNavController, animated: true, completion: nil)
    }
    func setupvenueView(){
        view.addSubview(venueView)
        venueView.snp.makeConstraints { (constraint) in
            constraint.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
}
