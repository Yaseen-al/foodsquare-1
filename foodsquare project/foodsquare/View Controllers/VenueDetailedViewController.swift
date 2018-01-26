//
//  VenueDetailedViewController.swift
//  foodsquare
//
//  Created by C4Q on 1/23/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import MapKit
class VenueDetailedViewController: UIViewController {
    var imageToSave: UIImage?
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
        self.venueView.venueCategoryTitle.text = self.venue.categories.first?.name
        self.venueView.addressLabel.text = self.venue.location.formattedAddress.joined(separator: " ")
        self.venueView.tipTextView.text =  self.venue.tips?.joined(separator: "\n") ?? "My Tips:"
        self.venueView.addressButton.addTarget(self, action: #selector(addressNavigation(selector:)), for: UIControlEvents.touchUpInside)
        self.venueView.venueImageView.kf.indicatorType = .activity
        var items = [Item](){
            didSet{
                print(items.count)
                guard let item = items.first else{
                    return
                }
                
                let imageURLStr = "\(item.purplePrefix)\(item.width)\(item.height)\(item.suffix)"
                if let image = ImageCache.manager.getImage(with: imageURLStr){
                    
                    self.venueView.venueImageView.image = image
                    self.imageToSave = image
                }else{
                    let imageURL =  URL(string: imageURLStr)
        
                    self.venueView.venueImageView.kf.setImage(with: imageURL, placeholder: nil, options: nil, progressBlock: nil, completionHandler: { (image, error, cache, url) in
                        if let image = image{
                            ImageCache.manager.addImage(with: imageURLStr, and: image)
                            self.imageToSave = image
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
        guard UserPreference.manager.getLongitude() != 0, UserPreference.manager.getLatitude() != 0 else {
            return
        }
        let userCoordinate = CLLocationCoordinate2DMake(UserPreference.manager.getLatitude(), UserPreference.manager.getLongitude())
        let placeCoordinate = CLLocationCoordinate2DMake(venue.location.lat, venue.location.lng)
        
        let directionsURLString = "http://maps.apple.com/?saddr=\(userCoordinate.latitude),\(userCoordinate.longitude)&daddr=\(placeCoordinate.latitude),\(placeCoordinate.longitude)"
        UIApplication.shared.open(URL(string: directionsURLString)!, options: [:]) { (done) in
            print("launched apple maps")
        }
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
        let preCreatedCollection = Collection(venues: nil, title: "My First Collection", imageName: self.venue.name)
        
        let saveVenueToFavoritesViewController = SaveToFavoritesViewController(venue: self.venue, precreatedCollection: preCreatedCollection,image: imageToSave!)
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
