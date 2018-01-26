//
//  VenueListViewController.swift
//  foodsquare
//
//  Created by C4Q on 1/23/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import TableFlip

class VenueListViewController: UIViewController {
    var venues:[Venue]!
    var collection: Collection!
    init(venues: [Venue], collection: Collection) {
        super.init(nibName: nil, bundle: nil)
        self.venues = venues
        self.collection = collection
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let venueListView = VenueListView()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        setupVenueListView()
        //TableView delegates and dataSource
        self.venueListView.tableView.dataSource = self
        self.venueListView.tableView.delegate = self
    }
    
    override func viewWillLayoutSubviews() {
        animateTableView()
    }
    
    private func animateTableView() {
        self.venueListView.tableView.animate(animation: TableViewAnimation.Cell.fade(duration: 1.0))
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func configureNavBar(){
        //TODO configure the navigation bar and add a create new collection button
        navigationItem.title = collection.title
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    private func setupVenueListView(){
        view.addSubview(venueListView)
        venueListView.snp.makeConstraints { (constraint) in
            constraint.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }
    }
    
}


//MARK: - Table view Data source methods
extension VenueListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return venues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let venueSetup = venues[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "customTableViewCell") as? ResultCustomTableViewCell else{
            let defaultCell = UITableViewCell()
            defaultCell.backgroundColor = .yellow
            return defaultCell
        }
        cell.venueNameLabel.text = venueSetup.name
        cell.categoryLabel.text = venueSetup.categories.first?.name
        var items = [Item](){
            didSet{
                print(items.count)
                guard let item = items.first else{
                    return
                }
                
                let imageURLStr = "\(item.purplePrefix)\(item.width)\(item.height)\(item.suffix)"
                if let image = ImageCache.manager.getImage(with: imageURLStr){
                    
                    cell.venueImageView.image = image
                    
                }else{
                    let imageURL =  URL(string: imageURLStr)
                    cell.venueImageView.kf.indicatorType = .activity
                     cell.venueImageView.kf.setImage(with: imageURL, placeholder: nil, options: nil, progressBlock: nil, completionHandler: { (image, error, cache, url) in
                        if let image = image{
                            ImageCache.manager.addImage(with: imageURLStr, and: image)
                        }
                    })
                    
                }
            }
        }
        PhotoAFireAPIClient.manager.getPhotosForVenue(venueID: venueSetup.id
            , completionHandler: {items = $0}, errorHandler: {print($0)})
        return cell
    }
    
    
}

//Mark: - Table view Delegate methods
extension VenueListViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard !self.venues.isEmpty else {
            return
        }
        let venueSetup = venues[indexPath.row]
        let detailedController = VenueDetailedViewController(venue: venueSetup)
        let detailedNavigationController = UINavigationController(rootViewController: detailedController)
        detailedNavigationController.modalTransitionStyle = .crossDissolve
        self.navigationController?.pushViewController(detailedController, animated: true)
    }
}

//MARK: - Table view Cell setup

extension VenueListViewController {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.bounds.height * 0.20
    }
}









