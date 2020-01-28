//
//  SavingMyCreationViewController.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 12/01/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit
import Photos

class SavingCreationViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - Outlet
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var timeTextField: UITextField!
    
    @IBOutlet weak var categoryTextField: UITextField!
    
    @IBOutlet weak var yieldTextField: UITextField!
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var ingredientsTextField: UITextField!
    
    @IBOutlet weak var methodTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!

    @IBOutlet weak var addPhotoButton: UIButton!

    // MARK: - Properties
    
    private var lastImageViewTapped: UIImageView?
    
    var viewModel: SavingCreationViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyBoard))
        view.addGestureRecognizer(tap)
        
        elementsCustom()
        
        navigationBar()
        
        settingNotificationCenter()
        
        bind(to: viewModel)
        
        viewModel.viewDidLoad()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification , object: nil)
    }
    
    // MARK: - Private Functions
    
    private func bind(to viewModel: SavingCreationViewModel) {
        
        viewModel.label = { [weak self] text in
            self?.label.text = text
        }
        
        viewModel.timePlaceholder = { [weak self] text in
            self?.timeTextField.placeholder = text
        }
        viewModel.categoryPlaceholder = { [weak self] text in
            self?.categoryTextField.placeholder = text
        }
        viewModel.yieldPlaceholder = { [weak self] text in
            self?.yieldTextField.placeholder = text
        }
        viewModel.titlePlaceholder = { [weak self] text in
            self?.titleTextField.placeholder = text
        }
        viewModel.ingredientsPlaceholder = { [weak self] text in
            self?.ingredientsTextField.placeholder = text
        }
        viewModel.metohdPlaceholder = { [weak self] text in
            self?.methodTextField.placeholder = text
        }
        viewModel.saveButton = { [weak self] text in
            self?.saveButton.setTitle(text, for: .normal)
        }
    }
    
    // MARK: - View actions
    
    @IBAction func didPressAddButton(_ sender: Any) {
        addPhoto()
        contentView.isHidden = false
        label.isHidden = true
    }
    
    @IBAction func didPressSaveButton(_ sender: Any) {
        
        guard self.timeTextField.text != nil else { return }
        guard self.categoryTextField.text != nil else { return }
        guard self.yieldTextField.text != nil else { return }
        guard self.titleTextField.text != nil else { return }
        guard self.ingredientsTextField.text != nil else { return }
        guard self.methodTextField.text != nil else { return }
        
        viewModel.didPressSaveButton(titleTextField: titleTextField.text!, ingredientTextField: ingredientsTextField.text!, methodTextField: methodTextField.text!, timeTextField: timeTextField.text!, dietCategoryTextField: categoryTextField.text!, yieldTextField: yieldTextField.text!)
    }
    
    // MARK: - Private Files
    
    /// NavBar
    fileprivate func navigationBar() {
        viewModel.navBarTitle = { text in
            self.navigationItem.title = text
        }
        let titleColor = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = titleColor
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.barTintColor = .orange
    }
    
    /// Pick photo
    fileprivate func PhotoPickerController() {
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
            // Encoding
            let imageData:Data = image.pngData()! as Data
            viewModel.didPressAddPhoto(imageAdded: imageData)
        }
        dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
    
    /// func in case not determined requestAuthorization
    fileprivate func notDeterminedCase(_ status: PHAuthorizationStatus) {
        if status == PHAuthorizationStatus.authorized{
            self.PhotoPickerController()
        }
    }

    fileprivate func addPhoto() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        let actionSheet = UIAlertController(title: Accessibility.ImagePickerController.titleSource, message: Accessibility.ImagePickerController.messageSource, preferredStyle: .actionSheet)
        // Camera access
        actionSheet.addAction(UIAlertAction(title: Accessibility.ImagePickerController.titleCamera, style: .default, handler: { (action:UIAlertAction)
            in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion: nil)
            }else{
                print ("Camera not available")
            }
        }))
        // Photo Library access
        actionSheet.addAction(UIAlertAction(title: Accessibility.ImagePickerController.titleLibrary, style: .default, handler: {
            (action:UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                PHPhotoLibrary.requestAuthorization { (status) in
                    DispatchQueue.main.async {
                        switch status {
                        case .authorized:
                            self.PhotoPickerController()
                            self.lastImageViewTapped = self.imageView
                        case .notDetermined:
                            self.notDeterminedCase(status)
                        case .restricted:
                            self.viewModel.restrictedCase()
                        case .denied:
                            self.viewModel.deniedCase()

                        default:break
                        }
                    }
                }
            }
        }))
        actionSheet.addAction(UIAlertAction(title: Accessibility.ImagePickerController.titleCancel, style: .cancel, handler:nil))
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    fileprivate func elementsCustom() {
        imageView.layer.cornerRadius = 15
        saveButton.layer.cornerRadius = 15
        contentView.layer.cornerRadius = 15
        saveButton.layer.borderWidth = 1
        saveButton.layer.borderColor = UIColor.orange.cgColor
        addPhotoButton.layer.borderWidth = 1
        addPhotoButton.layer.borderColor = UIColor.orange.cgColor
        addPhotoButton.layer.cornerRadius = 15
    }
    
    /// HideKeyBoard from textField
    @objc private func hideKeyBoard() {
        titleTextField.resignFirstResponder()
        ingredientsTextField.resignFirstResponder()
        addButton.resignFirstResponder()
        methodTextField.resignFirstResponder()
        timeTextField.resignFirstResponder()
        categoryTextField.resignFirstResponder()
        yieldTextField.resignFirstResponder()
    }
    
    fileprivate func settingNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc private func keyboardWillChange(notification: Notification) {
        guard let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        let keyboardRectangle = keyboardFrame.cgRectValue
        let keyboardHeight = keyboardRectangle.height
        
        if notification.name == UIResponder.keyboardWillShowNotification ||
            notification.name == UIResponder.keyboardWillChangeFrameNotification {
            view.frame.origin.y = -(keyboardHeight/2)
        } else {
            view.frame.origin.y = 0
        }
    }
    
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyBoard()
        return true
    }
}
