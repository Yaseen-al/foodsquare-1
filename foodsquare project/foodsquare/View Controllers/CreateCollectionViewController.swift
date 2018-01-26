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
    var preCreatedCollection: Collection? = nil
    var newCollectionName: String? = ""
    
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
        let createButton = UIBarButtonItem(title: "Create", style: .plain, target: self, action: #selector(createButtonAction))
        self.navigationItem.rightBarButtonItem = createButton
          navigationController?.navigationBar.barTintColor = foodsquareColor.mainColor
    }
    //MARK: _ Create Button Action
    @objc func createButtonAction(){
        newCollectionName = createCollectionView.textField.text
        FileManagerHelper.manager.addNew(newCollection: Collection(venues: nil, title: newCollectionName!, imageName: ""))
        print("DEV: create collection is pressed")
        let alert = UIAlertController(title: "New Collection Created", message: "", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: { (handler) in
            // go back to the previous viewcontroller
            _ = self.navigationController?.popViewController(animated: true)

        })
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }
}



extension CreateCollectionViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.becomeFirstResponder()
    }
    
}


