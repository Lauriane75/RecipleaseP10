//
//  CreateMyRecipeViewController.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 12/01/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit
import Photos

class CreateMyRecipeViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - Outlet
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var personsTextField: UITextField!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var ingredientsTextField: UITextField!
    @IBOutlet weak var methodTextField: UITextField!
    
    // MARK: - Properties
    
    private var lastImageViewTapped: UIImageView?
    
    var viewModel: CreateMyRecipeViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        elementsCustom()
    }
    
    // MARK: - Private Functions
    
    private func bind(to viewModel: CreateMyRecipeViewModel) {
        //
        //           viewModel.recipeDisplayed = { [weak self] recipe in
        //               self?.recipeDetailDataSource.update(with: recipe)
        //               self?.tableView.reloadData()
        //           }
    }
    
    
    private func navigationBar() {
        navigationItem.title = Accessibility.CreateMyRecipe.title
        
    }
    
    // MARK: - View actions
    
    @IBAction func didPressAddButton(_ sender: Any) {
        addPhoto()
        contentView.isHidden = false
        label.isHidden = true
    }
    
    @IBAction func didPressSaveButton(_ sender: Any) {

        guard self.timeTextField.text != nil else { return }
        viewModel.saveTime(for: timeTextField.text!)
        
        guard self.categoryTextField.text != nil else { return }
        viewModel.saveCategory(for: categoryTextField.text!)
        
        guard self.personsTextField.text != nil else { return }
        viewModel.savePersons(for: personsTextField.text!)
        
        guard self.timeTextField.text != nil else { return }
        viewModel.saveTime(for: timeTextField.text!)
        
        guard self.ingredientsTextField.text != nil else { return }
        viewModel.saveIngredient(for: ingredientsTextField.text!)
        
        guard self.methodTextField.text != nil else { return }
        viewModel.saveMethod(for: methodTextField.text!)
    }
    
    // MARK: - Private Files
    
    fileprivate func  PhotoPickerController() {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self
        myPickerController.sourceType = .photoLibrary
        self.present(myPickerController, animated: true)
        myPickerController.allowsEditing = true
    }
    
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let image = info[.editedImage] as? UIImage {
            self.lastImageViewTapped?.image = image
        } else if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.lastImageViewTapped?.image = image
        }
        dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
    
    /// func in case resticted requestAuthorization
    fileprivate func restrictedCase() {
        let alert = UIAlertController(title: "Photo library restricted", message: "Photo library acces is restriced and can't be accessed", preferredStyle: .alert)
        let okAction = UIAlertAction(title : "OK", style: .default)
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
    /// func in case not determined requestAuthorization
    fileprivate func notDeterminedCase(_ status: PHAuthorizationStatus) {
        if status == PHAuthorizationStatus.authorized{
            self.PhotoPickerController()
        }
    }
    /// func in case denied requestAuthorization
    fileprivate func deniedCase() {
        let alert = UIAlertController(title: "Photo library denied", message: "Photo library acces was denied and can't be accessed. Please update your settings if you want to change it", preferredStyle: .alert)
        let goToSettings = UIAlertAction(title : "Go to your settings", style: .default) { (action) in
            DispatchQueue.main.async {
                let url = URL(string: UIApplication.openSettingsURLString)!
                UIApplication.shared.open(url, options:[:])
            }
        }
        let cancelAction = UIAlertAction(title:"Cancel", style: .cancel)
        alert.addAction(goToSettings)
        alert.addAction(cancelAction)
        self.present(alert, animated: true)
    }
    
    fileprivate func addPhoto() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        let actionSheet = UIAlertController(title: "photo source", message: "choose a source", preferredStyle: .actionSheet)
        // Camera access
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action:UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion: nil)
            }else{
                print ("Camera not available")
            }
        }))
        // Photo Library access
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: {
            (action:UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                PHPhotoLibrary.requestAuthorization { (status) in
                    switch status {
                    case .authorized:
                        DispatchQueue.main.async {
                            self.PhotoPickerController()
                            self.lastImageViewTapped = self.imageView
                        }
                    case .notDetermined:
                        self.notDeterminedCase(status)
                    case .restricted:
                        self.restrictedCase()
                    case .denied:
                        self.deniedCase()
                    default:break
                        
                    }
                }
            }
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:nil))
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    fileprivate func elementsCustom() {
        imageView.layer.cornerRadius = 15
        saveButton.layer.cornerRadius = 15
        contentView.layer.cornerRadius = 15
        saveButton.layer.borderWidth = 1
        saveButton.layer.borderColor = UIColor.orange.cgColor
    }
    
    
    
}

