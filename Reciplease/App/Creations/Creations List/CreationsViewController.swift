//
//  CreationsViewController.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 12/01/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit

class CreationsViewController: UIViewController {
    
    // MARK: - Outlet
    
    
    
    // MARK: - Properties
    
    var viewModel: CreationsViewModel!
    
    // MARK: - View life cycl
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.viewWillAppear()
    }
    
    
    
    // MARK: - Private Functions
    
    private func bind(to viewModel: CreationsViewModel) {
        //
        //           viewModel.recipeDisplayed = { [weak self] recipe in
        //               self?.recipeDetailDataSource.update(with: recipe)
        //               self?.tableView.reloadData()
        //           }
    }
    
    fileprivate func  PhotoPickerController() {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = (self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate)
        myPickerController.sourceType = .photoLibrary
        self.present(myPickerController, animated: true)
        myPickerController.allowsEditing = true
    }
    
    //    let imagePickerController = UIImagePickerController()
    //    imagePickerController.delegate = self
    //    let actionSheet = UIAlertController(title: "photo source", message: "choose a source", preferredStyle: .actionSheet)
    //    // Camera access
    //    actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action:UIAlertAction) in
    //        if UIImagePickerController.isSourceTypeAvailable(.camera){
    //            imagePickerController.sourceType = .camera
    //            self.present(imagePickerController, animated: true, completion: nil)
    //        } else {
    //            print ("Camera not available")
    //        }
    //    }))
    
    
    // MARK: - Private Functions
    
    //    fileprivate func elementsCustom() {
    //        contentView.layer.cornerRadius = 20
    //        getDirectionButton.layer.cornerRadius = 15
    //        tableView.layer.cornerRadius = 15
    //        getDirectionButton.layer.borderWidth = 1
    //        getDirectionButton.layer.borderColor = UIColor.orange.cgColor
    //    }
    //
    //    private func navigationBar() {
    //        let image = UIImage(named: "reciplease-favorite-logo")
    //        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: #selector(didPressSelectFavoriteRecipe))
    //        navigationItem.title = Accessibility.DetailView.title
    //
    //    }
    
    // MARK: - View actions
    
    
    
    
    
}
