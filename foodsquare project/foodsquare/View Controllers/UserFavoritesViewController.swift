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
    
    // TODO: Rename placeholders or Replace them where in use
    // temporary place holders
    let placeHolderImage = UIImage()
    let placeHolderText = "PlaceHolder Text"
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
    }
    
    private func addSubView() {
        self.view.addSubview(userFavoritesView)
    }
    
    private func setupView() {
        setupUserFavoritesView()
    }
    
    private func configureNavigationBar() {
        navigationItem.title = "My Favorites"
        navigationController?.navigationBar.prefersLargeTitles = true
        let refreshButton =  UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(addNewCollectionButtonPressed))
        navigationItem.rightBarButtonItem = refreshButton
    }
    
    // Bar Button Segue
    @objc private func addNewCollectionButtonPressed() {
        //TODO: add block of code for action
    }
    
    //MARK: - Constraints
    private func setupUserFavoritesView() {
        userFavoritesView.snp.makeConstraints { (constraint) in
            constraint.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }
    }
}



extension UserFavoritesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! UserFavoritesCustomCollectionViewCell
        cell.configureCell(with: placeHolderText, and: placeHolderImage )
        return cell
    }
}

//MARK: CollectionView Delegate method
extension UserFavoritesViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}



















