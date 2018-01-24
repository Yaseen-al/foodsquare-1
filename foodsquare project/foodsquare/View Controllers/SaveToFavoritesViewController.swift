//
//  SaveToFavoritesViewController.swift
//  foodsquare
//
//  Created by C4Q on 1/23/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class SaveToFavoritesViewController: UIViewController {
    let saveToFavoriteView = SaveToFavoritesView()
    //collectionViewCell cell spacing
    let cellSpacing: CGFloat = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //configuring the navigation bar
        setupsaveToFavoriteView()
        configureNavBar()
    }
    
    func configureNavBar(){
        //        let navigationTitle = UINavigationItem(title: "Add or Create Collection")
        self.navigationItem.title = "Add or Create Collection"
        let createButton = UIBarButtonItem(title: "Create", style: .plain, target: self, action: #selector(createButtonAction))
        // the selector in the cancel button is nil as the style is done which will make it go back to the previous view
        let cancelButton = UIBarButtonItem(image: #imageLiteral(resourceName: "cancelButton16pt"), style: .done, target: self, action: #selector(cancelButtonAction))
        self.navigationItem.rightBarButtonItem = createButton
        self.navigationItem.leftBarButtonItem = cancelButton
        
        //collectionViewDelegate
        self.saveToFavoriteView.collectionView.delegate = self
        self.saveToFavoriteView.collectionView.dataSource = self
        
    }
    //MARK: - Cancel Button Action
    @objc func cancelButtonAction(){
        //TODO dismis the current View controller
        self.dismiss(animated: true, completion: nil)
    }
    //MARK: _ Create Button Action
    @objc func createButtonAction(){
        //TODO Setup the Create the button action to make a new collection
    }
    
    //MARK: - Setup View
    func setupsaveToFavoriteView() {
        self.view.addSubview(saveToFavoriteView)
        saveToFavoriteView.snp.makeConstraints { (constraint) in
            constraint.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
    
    
}
// Mark: CollectionView DataSource Extension
extension SaveToFavoritesViewController:  UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! SaveToFavoritesCustomCollectionViewCell
        return cell
    }
    
    
}
// Mark: CollectionView Delegates Extension
extension SaveToFavoritesViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}


