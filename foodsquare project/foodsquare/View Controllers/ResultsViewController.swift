//
//  ResultsViewController.swift
//  foodsquare
//
//  Created by C4Q on 1/23/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit

/// Connect to the Search VC > Nav Bar

class ResultsViewController: UIViewController {
    
    let resultsView = ResultsView()
    
    var venues = [Venue]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
        view.addSubview(resultsView)
        
        resultsView.resultsTableView.delegate = self
        resultsView.resultsTableView.dataSource = self
        
        configureNavBar()
    }
    
    private func configureNavBar() {
        navigationItem.title = "Results List"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension ResultsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        return venues.count
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = resultsView.resultsTableView.dequeueReusableCell(withIdentifier: "ResultCell", for: indexPath) as! ResultCustomTableViewCell
        let venue = venues[indexPath.row]
        cell.configureCell(venue: venue)
        return cell
    }
}

extension ResultsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let venue = venues[indexPath.row]
        var cellImage: UIImage!
        if let cell = tableView.cellForRow(at: indexPath) as? ResultCustomTableViewCell {
            if let image = cell.venueImageView.image {
                cellImage = image
            } else {
                cellImage = #imageLiteral(resourceName: "No_Image_Available")
            }
        }
        /// segue to dvc
        //        return cell
        
        // dependency injection to pass Venue Object to Detail VC
        /// update below with correct name for Venue Detail VC
        //        let detailViewController = DetailViewController()
        //        detailViewController.modalTransitionStyle = .crossDissolve
        //        detailViewController.modalPresentationStyle = .overCurrentContext
        //        present(detailViewController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
}

