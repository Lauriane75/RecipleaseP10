//
//  SearchViewController.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 13/11/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var clearButton: UIButton!
    
    @IBOutlet weak var ingredientListLabel: UILabel!
    
    @IBOutlet weak var searchButton: UIButton!
    
    @IBOutlet weak var ingredientListTableView: UITableView!
            
    @IBOutlet weak var createMyRecipe: UIButton!
    
    // MARK: - Properties
    
    var viewModel: HomeViewModel!
    
    private lazy var searchDataSource = SearchDataSource()
        
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        ingredientListTableView.dataSource = searchDataSource
        bind(to: viewModel)
        viewModel.viewDidLoad()
        
        elementCustom()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyBoard))
        
        view.addGestureRecognizer(tap)
        
        settingNotificationCenter()
        
        self.navigationController?.navigationBar.barTintColor = .orange
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification , object: nil)
    }
    
    // MARK: - Private Functions
    
    private func bind(to viewModel: HomeViewModel) {
        viewModel.titleLabel = { [weak self] text in
            self?.titleLabel.text = text
        }
        viewModel.addButton = { [weak self] text in
            self?.addButton.setTitle(text, for: .normal)
        }
        viewModel.placeHolderTextField = { [weak self] text in
            self?.searchTextField.placeholder = text
        }
        viewModel.ingredientTextField = { [weak self] text in
            self?.searchTextField.text = text
        }
        viewModel.listTitleLabel = { [weak self] text in
            self?.ingredientListLabel.text = text
        }
        viewModel.clearButton = { [weak self] text in
            self?.clearButton.setTitle(text, for: .normal)
        }
        viewModel.searchButtonIsHidden = { [weak self] state in
            self?.searchButton.isHidden = state
        }
        viewModel.searchButton = { [weak self] text in
            self?.searchButton.setTitle(text, for: .normal)
        }
        viewModel.ingredients = { [weak self] item in
            print("item = \(item)")
            DispatchQueue.main.async {
                self?.searchDataSource.update(with: item)
                self?.ingredientListTableView.reloadData()
            }
        }
    }
    
    // MARK: - View actions
    
    @IBAction func didPressAddButton(_ sender: Any) {
        guard let newIngredient = self.searchTextField.text else { return }
        print("\(newIngredient)")
        viewModel.didPressAdd(ingredientSelected: newIngredient)
    }
    
    @IBAction func didPressClearButton(_ sender: Any) {
        viewModel.didPressClear()
    }
    
    @IBAction func didPressSearchButton(_ sender: Any) {
        viewModel.didPressSearchForRecipes()
    }
    
    @IBAction func didPressCreationButton(_ sender: Any) {
        viewModel.didPressCreateRecipe()
    }
    
    // MARK: - Private Files
    
    fileprivate func elementCustom() {
        addButton.layer.cornerRadius = 15
        clearButton.layer.cornerRadius = 15
        searchButton.layer.cornerRadius = 20
        createMyRecipe.layer.cornerRadius = 15
    }
    
    @objc private func hideKeyBoard() {
        searchTextField.resignFirstResponder()
        titleLabel.resignFirstResponder()
        addButton.resignFirstResponder()
        clearButton.resignFirstResponder()
        ingredientListLabel.resignFirstResponder()
        searchButton.resignFirstResponder()
        ingredientListTableView.resignFirstResponder()
    }
    
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyBoard()
        return true
    }
    
    fileprivate func settingNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc private func keyboardWillChange(notification: Notification) {
        
        guard let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as?          NSValue else { return }
        let keyboardRectangle = keyboardFrame.cgRectValue
        let keyboardHeight = keyboardRectangle.height
        
        if notification.name == UIResponder.keyboardWillShowNotification ||
            notification.name == UIResponder.keyboardWillChangeFrameNotification {
            view.frame.origin.y = -(keyboardHeight/5)
        } else {
            view.frame.origin.y = 0
        }
    }
}
