//
//  CreateCollectionViewController.swift
//  foodsquare
//
//  Created by C4Q on 1/23/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

/// Presented via Favorites Tab > Top Right Nav Bar Button (+) > Modal View to Create a Favorites Folder/Collection

class CreateCollectionViewController: UIViewController {
    
    let createCollectionView = CreateCollectionView()
    
    let newCollectionName: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(createCollectionView)
        createCollectionView.textField.delegate = self
        configureNavBar()
    }
    
    private func configureNavBar() {
        navigationItem.title = "Create Collection"
        navigationController?.navigationBar.prefersLargeTitles = true
        let createBarItem = UIBarButtonItem(title: "Create", style: .plain, target: self, action: #selector(createCollection))
        navigationItem.rightBarButtonItem = createBarItem
    }
    
    @objc func createCollection() {
        createCollectionView.textField.text = newCollectionName
        print("Create button pressed")
        
        /// save this New Collection Name to the Favorites VC Collection View
        
        /// create a new empty Collection of Favorites with the given name from the textfield
    }
}


extension CreateCollectionViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.becomeFirstResponder()
    }
    
    /// do not use this function below, use createCollection button instead
    //    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    //        textField.resignFirstResponder()
    //        return true
    //    }
}


