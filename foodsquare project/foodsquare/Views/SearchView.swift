//
//  SearchView.swift
//  foodsquare
//
//  Created by C4Q on 1/23/18.
//  Copyright © 2018 C4Q. All rights reserved.
//


import UIKit
import MapKit
import SnapKit

class SearchView: UIView {
    
    lazy var collectionView: UICollectionView = {
        let screenHeight: CGFloat = UIScreen.main.bounds.height
        let screenWidth: CGFloat = UIScreen.main.bounds.width
        let cellSpacing: CGFloat = 10
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: screenWidth * 0.35, height: screenHeight * 0.20)
        layout.sectionInset = UIEdgeInsetsMake(cellSpacing, cellSpacing + 5, cellSpacing, cellSpacing + 5)
        layout.minimumLineSpacing = cellSpacing
        layout.minimumInteritemSpacing = cellSpacing
        layout.scrollDirection = .horizontal
        let cView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        
        let gradient: CAGradientLayer = CAGradientLayer()
        
        gradient.colors = [UIColor(displayP3Red: 238/255, green: 242/255, blue: 245/255, alpha: 0.1 ), UIColor(displayP3Red: 238/255, green: 242/255, blue: 245/255, alpha: 1 )]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: cView.bounds.width, height: cView.bounds.height)
        
        //        cView.backgroundView?.layer.insertSublayer(gradient, at: 0)
        cView.backgroundColor = UIColor(displayP3Red: 238/255, green: 242/255, blue: 245/255, alpha: 0.8 )
        cView.register(SearchViewCustomCollectionViewCell.self, forCellWithReuseIdentifier: "customCell")
        return cView
    }()
    
    lazy var venueSearchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "What's your tummy caving for today"
        
        return searchBar
    }()
    lazy var locationSearchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.barTintColor = UIColor(displayP3Red: 249/255, green: 249/255, blue: 249/255, alpha: 1 )
        searchBar.searchBarStyle = UISearchBarStyle.prominent
        searchBar.placeholder = "Your City's Goes Here"
        return searchBar
    }()
    lazy var mapView: MKMapView = {
        let map = MKMapView()
        return map
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupViews(){
        setupMapView()
        setupLocationSearchBar()
        setupCollectionView()
    }
    func setupMapView(){
        addSubview(mapView)
        mapView.snp.makeConstraints { (constraint) in
            constraint.edges.equalTo(snp.edges)
        }
    }
    func setupLocationSearchBar() {
        addSubview(locationSearchBar)
        locationSearchBar.snp.makeConstraints { (constraint) in
            constraint.top.equalTo(snp.top)
            constraint.right.equalTo(snp.right)
            constraint.left.equalTo(snp.left)
        }
    }
    func setupCollectionView(){
        addSubview(collectionView)
        collectionView.snp.makeConstraints { (constraint) in
            constraint.bottom.equalTo(snp.bottom)
            constraint.width.equalTo(snp.width)
            constraint.left.equalTo(snp.left)
            constraint.right.equalTo(snp.right)
            constraint.height.equalTo(snp.height).multipliedBy(0.3)
        }
    }
}

