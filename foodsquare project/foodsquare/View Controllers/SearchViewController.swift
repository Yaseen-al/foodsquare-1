//
//  SearchViewController.swift
//  foodsquare
//
//  Created by C4Q on 1/23/18.
//  Copyright © 2018 C4Q. All rights reserved.
//
import UIKit
import SnapKit

class SearchViewController: UIViewController {
    let searchView = SearchView()
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        //collectionView dataSource and delegate
        self.searchView.collectionView.dataSource = self
        self.searchView.collectionView.delegate = self
        setupSearhView()
        configureNavBar()
    }
    func configureNavBar(){
        navigationItem.largeTitleDisplayMode = .never
        let listNavBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "Hamburger_icon.svg") , style: .plain, target: self, action: #selector(listNavBarButtonItemAction))
        //        let cancelNavBarButtonItem = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: nil)
        navigationItem.rightBarButtonItem = listNavBarButtonItem
        //        navigationItem.rightBarButtonItem =  cancelNavBarButtonItem
        navigationItem.titleView = searchView.venueSearchBar
    }
    
    @objc func listNavBarButtonItemAction(){
        let searchResultsListViewController =  ResultsViewController()
        //        let searchResultNavController = UINavigationController(rootViewController: searchResultsListViewController) ////////QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ
        self.navigationController?.pushViewController(searchResultsListViewController, animated: true)
    }
    func setupSearhView(){
        view.addSubview(searchView)
        searchView.snp.makeConstraints { (constraint) in
            constraint.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
}

extension SearchViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! SearchViewCustomCollectionViewCell
        return cell
    }
    
}
extension SearchViewController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
                let detailedController = VenueDetailedViewController()
                let detailedNavigationController = UINavigationController(rootViewController: detailedController)
                detailedNavigationController.modalTransitionStyle = .crossDissolve
                self.navigationController?.pushViewController(detailedController, animated: true)
    }
    
}
