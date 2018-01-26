//
//  VenueListView.swift
//  foodsquare
//
//  Created by C4Q on 1/25/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class VenueListView: UIView {

    lazy var tableView: UITableView = {
        let tView = UITableView()
        tView.register(ResultCustomTableViewCell.self, forCellReuseIdentifier: "customTableViewCell")
        return tView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupView() {
        setupTableView()
    }
    func setupTableView(){
        addSubview(tableView)
        tableView.snp.makeConstraints { (constraint) in
            constraint.edges.equalTo(snp.edges)
        }
    }
    
}

