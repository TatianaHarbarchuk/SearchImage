//
//  ViewController.swift
//  VIPER Architecture
//
//  Created by Tania Harbarchuk on 27.11.2023.
//

import UIKit

class TableViewController: UIViewController, UITextFieldDelegate, UISearchBarDelegate  {
    
    //MARK: - Properties
    var tableView: UITableView?
    var searchTextField = UITextField()
    var searchController = UISearchController(searchResultsController: nil)
    var presenter: (ViewToPresenterTableViewProtocol & InteractorToPresenterTableViewProtocol)?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        setupSearchController()
    }
    
    //MARK: - Func setUpUI
    private func setUpUI() {
        view.backgroundColor = .white
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView?.translatesAutoresizingMaskIntoConstraints = false
        tableView?.register(with: TableViewCell.self)
        tableView?.delegate = self
        
        tableView?.dataSource = self
        tableView?.backgroundColor = .clear
        if let tableView = tableView {
            view.addSubview(tableView)
        }
    }
    
    private func setupSearchController() {
        searchController.searchBar.delegate = self
        searchController.searchBar.returnKeyType = .search
        searchController.searchBar.searchTextField.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchBarText = searchController.searchBar.text else { return }
        presenter?.viewDidLoad(with: searchBarText)
        searchBar.resignFirstResponder()
    }
    
    //MARK: - Func searchBarCancelButtonClicked
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    //MARK: - Func textFieldShouldClear
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        searchController.searchBar.searchTextField.clearButtonMode = .whileEditing
        return true
    }
}

extension TableViewController: PresenterToViewTableViewProtocol {
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView?.reloadData()
        }
    }
}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return presenter?.setCell(tableView: tableView, forRowAt: indexPath) ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return presenter?.tableViewCellHeight() ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectRowAt(index: indexPath.row)
    }
}
