//
//  UserFavoritesViewController.swift
//  foodsquare
//
//  Created by C4Q on 1/23/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit

class UserFavoritesViewController: UIViewController {
    
    var favorites = [Collection](){
        didSet{
            self.userFavoritesView.userFavoritesCollectionView.reloadData()
        }
    }
    
    // TODO: Rename placeholders or Replace them where in use
    // temporary place holders
    let placeHolderDidSelectItemAtSegue = "favoritesDetailViewController"
    
    //MARK: - Constants
    let userFavoritesView = UserFavoritesView()
    let cellID = "UserFavoritesCustomCollectionViewCell"
    
    //MARK: - Override ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userFavoritesView.userFavoritesCollectionView.dataSource = self
        self.userFavoritesView.userFavoritesCollectionView.delegate = self
        commonInit()
    }
    
    //MARK: - Functions
    private func commonInit() {
        self.view.backgroundColor = .white
        addSubView()
        setupView()
        configureNavigationBar()
        loadCollections()
    }
    
    private func addSubView() {
        self.view.addSubview(userFavoritesView)
    }
    
    private func setupView() {
        setupUserFavoritesView()
    }
    
    private func loadCollections() {
        FileManagerHelper.manager.loadCollections()
        self.favorites =  FileManagerHelper.manager.getAllCollections()
    }
    
    private func configureNavigationBar() {
        navigationItem.title = "My Favorites"
        navigationController?.navigationBar.prefersLargeTitles = true
        let refreshButton =  UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(addNewCollectionButtonPressed))
        navigationItem.rightBarButtonItem = refreshButton
    }
    
    // Bar Button Segue
    @objc private func addNewCollectionButtonPressed() {
        let createCollectionViewController = CreateCollectionViewController()
        createCollectionViewController.modalTransitionStyle = .crossDissolve
        createCollectionViewController.modalPresentationStyle = .overCurrentContext
        present(createCollectionViewController, animated: true, completion: nil)
        
    }
    
    
    
    //MARK: - Constraints
    private func setupUserFavoritesView() {
        userFavoritesView.snp.makeConstraints { (constraint) in
            constraint.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }
    }
}


//MARK: - CollectionView Data Source
extension UserFavoritesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.favorites.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! UserFavoritesCustomCollectionViewCell
        let favorite = favorites[indexPath.row]
        let favoriteImage = UIImage(named: favorite.imageName) ?? #imageLiteral(resourceName: "No_Image_Available")
        cell.configureCell(with: favorite.title, and: favoriteImage)
        return cell
    }
}

//MARK: CollectionView Delegate method
extension UserFavoritesViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let favorite = favorites[indexPath.row]
        
        guard let favoriteVenues = favorite.venues else{
            let alert = UIAlertController(title: "No Venues saved to your collection, hit the road with some venue search", message: "", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Ok", style: .default, handler: { (handler) in
            })
            alert.addAction(alertAction)
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        let venueListViewController = VenueListViewController(venues: favoriteVenues)
        self.navigationController?.pushViewController(venueListViewController, animated: true)
    }
}



















