//
//  SearchViewController.swift
//  foodsquare
//
//  Created by C4Q on 1/23/18.
//  Copyright © 2018 C4Q. All rights reserved.
//
import UIKit
import SnapKit
import MapKit
class SearchViewController: UIViewController {
    private var annotations = [MKAnnotation]()
    var venues = [Venue](){
        didSet{
            //TODO refresh the collectionVIew and make it visible
            for venue in venues{
                let annotation = MKPointAnnotation()
                annotation.coordinate = CLLocationCoordinate2DMake(venue.location.lat, venue.location.lng)
                annotation.title = venue.name
                annotations.append(annotation)
            }
            DispatchQueue.main.async {
                self.searchView.mapView.addAnnotations(self.annotations)
                self.searchView.mapView.showAnnotations(self.annotations, animated: true)
            }
            
            self.searchView.collectionView.isHidden = false
            self.searchView.collectionView.reloadData()
        }
    }
    
    var currentCity = ""{
        didSet{
            print(currentCity)
            self.searchView.locationSearchBar.placeholder = currentCity
            guard currentCity != "Please Enter your City" else{
                return
            }
        }
    }
    
    let searchView = SearchView()

    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        //collectionView dataSource and delegate
        self.searchView.collectionView.dataSource = self
        self.searchView.collectionView.delegate = self
        //searchBar Delegate
        self.searchView.locationSearchBar.delegate = self
        self.searchView.venueSearchBar.delegate = self
        LocationService.manager.delegate = self
        setupSearchView()
        configureNavBar()
        //Getting the location authorization
        let authorizationStatus = LocationService.manager.checkForLocationServices()
        authorizationHandling(inputAuthization: authorizationStatus)
    }
    
    // This function gets the city name based on the user authorization and the stored UserPreference
    func authorizationHandling(inputAuthization: CLAuthorizationStatus) {
        if inputAuthization == .authorizedWhenInUse || inputAuthization == .authorizedAlways {
            let currentCLLocation = CLLocation(latitude: UserPreference.manager.getLatitude(), longitude: UserPreference.manager.getLongitude())
            LocationService.manager.getCityNameFromCLLocation(inputCLLocation: currentCLLocation, completion: {self.currentCity = $0})
            // this will move to the current location if the it is authorized
            configureMapRegion(from: currentCLLocation)
            self.searchView.mapView.showsUserLocation = true
        }else{
            self.currentCity = "Please Enter your City"
        }
    }
    // this function will center the map to a specific point using CLLocation
    func configureMapRegion(from inputCLLocation: CLLocation){
        let span = MKCoordinateSpanMake(0.1, 0.1)
        let region = MKCoordinateRegionMake(inputCLLocation.coordinate, span)
        self.searchView.mapView.setRegion(region, animated: true)
    }
    //MARK: - Configure the nav Bar
    func configureNavBar(){
        navigationItem.largeTitleDisplayMode = .never
        let listNavBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "Menu"), style: .plain, target: self, action: #selector(listNavBarButtonItemAction))
        navigationItem.rightBarButtonItem = listNavBarButtonItem
        navigationItem.titleView = searchView.venueSearchBar
    }
    
    @objc func listNavBarButtonItemAction(){
        // guard to make sure that you have venues result else return
        guard !self.venues.isEmpty else {
            return
        }
        // make a SearchResultsListViewController using dependency
        
        let searchResultsListViewController = ResultsViewController(venues: self.venues)
        self.navigationController?.pushViewController(searchResultsListViewController, animated: true)

    }
    //MARK: - Setup the searchView
    func setupSearchView(){
        view.addSubview(searchView)
        searchView.snp.makeConstraints { (constraint) in
            constraint.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
        // this will make the collectionView Hidden and should make it back visible when data is loaded
        searchView.collectionView.isHidden = true
    }
}

//MARK: - CollectionView DataSource
extension SearchViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return venues.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let venueSetup = venues[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! SearchViewCustomCollectionViewCell
        cell.venueLabel.text = venueSetup.name
        cell.venueImage.image = nil
        var items = [Item](){
            didSet{
                print(items.count)
                guard let item = items.first else{
                    return
                }
                let imageURLStr = "\(item.purplePrefix)\(item.width)\(item.height)\(item.suffix)"
                let imageURL =  URL(string: imageURLStr)
                cell.venueImage.kf.setImage(with: imageURL, placeholder: #imageLiteral(resourceName: "restaurant logo"), options: nil, progressBlock: nil, completionHandler: nil)
            }
        }
        PhotoAFireAPIClient.manager.getPhotosForVenue(venueID: venueSetup.id
            , completionHandler: {items = $0}, errorHandler: {print($0)})
        return cell
    }
    
}
//MARK: - CollectionView Delegates
extension SearchViewController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard !self.venues.isEmpty else {
            return
        }
        let venueSetup = venues[indexPath.row]
        let detailedController = VenueDetailedViewController(venue: venueSetup)
        self.navigationController?.pushViewController(detailedController, animated: true)
        
    }
    
}
//MARK: - CollectionView Delegate
extension SearchViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if searchBar == self.searchView.locationSearchBar{
            guard let cityName = searchBar.text, searchBar.text != " " else {
                return
            }
            // this will move the map to a a valid city if not the alert will kick in and notify the user for the error
            LocationService.manager.getCityCordinateFromCityName(inputCityName: cityName, completion: {
                self.configureMapRegion(from: $0);
                self.currentCity = cityName
            }, errorHandler: {
                let alert = UIAlertController(title: "Invalid input City, please enter a valid city", message: "\($0)", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "Ok", style: .default, handler: { (handler) in
                    self.searchView.locationSearchBar.text = ""
                })
                alert.addAction(alertAction)
                self.present(alert, animated: true, completion: nil)
                
            })
            self.venues = []
            self.searchView.collectionView.isHidden = true
        }
        if searchBar == self.searchView.venueSearchBar{
            guard let searchTerm = searchBar.text, searchBar.text != " " else{
                return
            }
            guard self.currentCity != " ", currentCity != "Please Enter your City" else{
                return
            }
            var location = CLLocation(){
                didSet{
                    
                    self.venues.removeAll()
                    self.searchView.mapView.removeAnnotations(self.annotations)
                    self.annotations.removeAll()
                    VenueAFireAPIClient.manager.getVenues(searchTerm: searchTerm, location: location, completionHandler: {self.venues = $0
                    }, errorHandler: {print($0)})
                }
            }
            LocationService.manager.getCityCordinateFromCityName(inputCityName: currentCity, completion: {location = $0}, errorHandler: {print($0)})
            
        }
    }
}


extension SearchViewController: LocationDelegate{
    func userDeniedLocation() {
        LocationService.manager.getCityCordinateFromCityName(inputCityName: "New York City", completion: { (location) in
            self.configureMapRegion(from: location)
            VenueAFireAPIClient.manager.getVenues(searchTerm: "Beer", location: location, completionHandler: {self.venues = $0
            }, errorHandler: {print($0)})
        }, errorHandler: {_ in print("error")})
        
    
    }
    
    func userAllowedLocation(with location: CLLocation) {
        configureMapRegion(from: location)
        self.searchView.mapView.showsUserLocation = true
    }
    
    
    
    
    
    

}
