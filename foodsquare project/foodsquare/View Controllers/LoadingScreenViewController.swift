//
//  LoadingScreenViewController.swift
//  foodsquare
//
//  Created by Clint Mejia on 1/25/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class LoadingScreenViewController: UIViewController {
    
    //MARK: - Variable
    open override var prefersStatusBarHidden : Bool {
        return true
    }
    
    //MARK: - Constants
    let welcomeView = LoadingScreenView()
    
    //MARK: - Override ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
    
    //MARK: - Functions
    private func commonInit() {
        self.view.backgroundColor = .white
        addSubView()
        setupView()
    }
    
    private func addSubView() {
        self.view.addSubview(welcomeView)
    }
    
    private func setupView() {
        setupWelcomeView()
    }
    
    private func setupWelcomeView() {
        welcomeView.snp.makeConstraints { (make) -> Void in
            make.edges.equalToSuperview()
        }
    }
}
