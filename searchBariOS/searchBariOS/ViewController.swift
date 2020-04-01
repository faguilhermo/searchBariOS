//
//  ViewController.swift
//  searchBariOS
//
//  Created by Fabrício Guilhermo on 01/04/20.
//  Copyright © 2020 Fabrício Guilhermo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var filter = [Country]()
    let countries = Country.getAllCountries()

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CountryCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()

    lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        // search bar
        searchController.searchBar.placeholder = "Procure por um país"
        searchController.searchBar.sizeToFit()
        searchController.searchBar.searchBarStyle = .prominent
        searchController.searchBar.scopeButtonTitles = ["Todos", "Europa", "Asia", "Africa"]
        searchController.searchBar.delegate = self

        return searchController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        setupUI()
        setupAutolayout()
    }

    private func filterContent(search: String, in scope: String = "All") {
        filter = countries.filter({ (country: Country) -> Bool in
            let match = (scope == "All") || (country.continent == scope)
        })
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        <#code#>
    }
}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        <#code#>
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CountryCell else { return UITableViewCell() }
        cell.titleLabel.text = countries[indexPath.row].title
        cell.categoryLabel.text = countries[indexPath.row].continent

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

extension ViewController {
    private func setupUI() {
        view.addSubview(tableView)
    }

    private func setupAutolayout(){
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}

