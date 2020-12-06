//
//  DnDClassDetailViewController.swift
//  ExampleProject
//
//  Created by Sergio Castillo on 05/12/2020.
//

import UIKit
import RxSwift
import RxCocoa

class DnDClassDetailViewController: UIViewController {
 
    @IBOutlet weak var descriptionLabel: UILabel!
    
    private let disposeBag = DisposeBag()
    var viewModel: DnDClassDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    private func bindViewModel() {
        guard let viewModel = viewModel else { return }
        let viewWillAppear = rx.sentMessage(#selector(UIViewController.viewWillAppear(_:)))
            .mapToVoid()
            .asDriverOnErrorJustComplete()
        
        let input = DnDClassDetailViewModel.Input(trigger: Driver.merge(viewWillAppear))
        let output = viewModel.transform(input: input)
       
        output.dndClass.drive() { viewModel in
            self.title = viewModel.name
            self.descriptionLabel.text = viewModel.description
        }.disposed(by: disposeBag)
    }
}




