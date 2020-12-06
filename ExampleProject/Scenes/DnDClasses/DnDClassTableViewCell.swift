//
//  DnDClassTableViewCell.swift
//  ExampleProject
//
//  Created by Sergio Castillo on 04/12/2020.
//

import UIKit

class DnDClassTableViewCell: BasePaginationTableViewCell<DnDClassViewModel> {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var hitDiceLabel: UILabel!
    
    override func bind(_ viewModel: DnDClassViewModel) {
        self.nameLabel.text = viewModel.name
        self.hitDiceLabel.text = viewModel.hitDice
    }
    
}
