//
//  SearchViewController.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 13/11/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    var viewModel: SearchViewModel!
    
    weak var delegate: SearchViewControllerDelegate?

    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    private func bind(to viewModel: SearchViewModel) {
         
    }
    
}
