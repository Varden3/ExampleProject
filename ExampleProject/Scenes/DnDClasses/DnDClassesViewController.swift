//
//  DnDClassesViewController.swift
//  ExampleProject
//
//  Created by Sergio Castillo on 04/12/2020.
//

import UIKit

class DnDClassesViewController: ReusableRxTableViewController<DnDClassViewModel, DnDClass, DnDClassTableViewCell, DefaultDnDClassesNavigator> {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        self.title = "Classes".localized()
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
