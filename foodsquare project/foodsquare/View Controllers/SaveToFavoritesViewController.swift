//
//  SaveToFavoritesViewController.swift
//  foodsquare
//
//  Created by C4Q on 1/23/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class SaveToFavoritesViewController: UIViewController {
    var favoriteCollections:[Collection]!
    var preCreatedCollection: Collection!
    var venue: Venue!
    private let collectionImagesInAssets = ["salmon dish", "burger Image"]
    init(venue: Venue, precreatedCollection: Collection) {
        super.init(nibName: nil, bundle: nil)
        self.preCreatedCollection = precreatedCollection
        self.venue = venue
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let saveToFavoriteView = SaveToFavoritesView()
    //collectionViewCell cell spacing
    let cellSpacing: CGFloat = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //configuring the navigation bar
        setupsaveToFavoriteView()
        configureNavBar()
        //textFieldDelegate
        self.saveToFavoriteView.newCollectionTitleTextField.delegate = self
        //textViewDelegate
        self.saveToFavoriteView.tipTextView.delegate = self
        FileManagerHelper.manager.loadCollections()
        self.favoriteCollections = FileManagerHelper.manager.getAllCollections()
        
    }
    
    func configureNavBar(){
        //        let navigationTitle = UINavigationItem(title: "Add or Create Collection")
        self.navigationItem.title = "Add or Create Collection"
        let createButton = UIBarButtonItem(title: "Create", style: .plain, target: self, action: #selector(createButtonAction))
        // the selector in the cancel button is nil as the style is done which will make it go back to the previous view
        let cancelButton = UIBarButtonItem(image: #imageLiteral(resourceName: "dismissButtonIcon"), style: .done, target: self, action: #selector(cancelButtonAction))
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
        //TODO Check if there is a collection with the same name or no if there is a collecion with the same name present the alert View
        guard let venue = self.venue else{
            return
        }
        preCreatedCollection.venues = [venue]
        
        FileManagerHelper.manager.addNew(newCollection: self.preCreatedCollection)
        print("DEV: create collection is pressed")
        let alert = UIAlertController(title: "You have a new collection now, hit the road with some venue search", message: "", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: { (handler) in
            //TODO : go back to the previos viewcontroller
             self.dismiss(animated: true, completion: nil)
        })
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
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
        return self.favoriteCollections.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! SaveToFavoritesCustomCollectionViewCell
        let collectionSetup = favoriteCollections[indexPath.row]
        cell.collectionLabel.text = collectionSetup.title
        cell.collectionImage.image = UIImage(named: collectionSetup.imageName)
        return cell
    }
}

// Mark: CollectionView Delegates Extension
extension SaveToFavoritesViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let collectionSetup = favoriteCollections[indexPath.row]
        let fileManagerResponse = FileManagerHelper.manager.addVenueToExistingCollection(addVenue: self.venue, collectionTitle: collectionSetup.title)
        switch fileManagerResponse {
        case .alreadyExists:
            let alert = UIAlertController(title: "Venue already exist in your collection", message: "", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Ok", style: .default, handler: { (handler) in
                             self.dismiss(animated: true, completion: nil)
            })
            alert.addAction(alertAction)
            self.present(alert, animated: true, completion: nil)
            return
        case .addedSuccessfully:
            let alert = UIAlertController(title: "Succesfully Added your item to your collection", message: "", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Ok", style: .default, handler: { (handler) in
                             self.dismiss(animated: true, completion: nil)
            })
            alert.addAction(alertAction)
            self.present(alert, animated: true, completion: nil)

        }
        
    }
}

//MARK: - Collection title textField delegate
extension SaveToFavoritesViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard textField.text != "", let title = textField.text else {
            textField.resignFirstResponder()
            return false
        }
        self.preCreatedCollection.title = title
        textField.resignFirstResponder()
        
        return false
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard textField.text != "", let title = textField.text else {
            textField.resignFirstResponder()
            return
        }
        self.preCreatedCollection.title = title
        textField.resignFirstResponder()
    }
}
//MARK: - textViewDelegate
extension SaveToFavoritesViewController: UITextViewDelegate{
    func textViewDidEndEditing(_ textView: UITextView) {
        guard let text = textView.text else{
            return
        }
        guard var tips = self.venue.tips else{
            self.venue.tips = [text]
            return
        }
        tips.append(text)
        self.venue.tips = tips
    }
}



