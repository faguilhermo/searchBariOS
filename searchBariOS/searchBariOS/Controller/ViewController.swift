//
//  ViewController.swift
//  searchBariOS
//
//  Created by Fabrício Guilhermo on 01/04/20.
//  Copyright © 2020 Fabrício Guilhermo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Variables and constants

    // All filtered results
    var filteredResults = [Country]()
    // All countries
    let countries = Country.getAllCountries()

    // MARK: - UI Elements

    /// creates a  tabel view
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CountryCell.self, forCellReuseIdentifier: "cell")
        tableView.allowsSelection = false
        return tableView
    }()

    /// creates a search controller with search bar and 4 scope buttons
    lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Procure por um país"
        searchController.searchBar.sizeToFit()
        searchController.searchBar.searchBarStyle = .prominent
        searchController.searchBar.scopeButtonTitles = ["Todos", "América", "África", "Europa", "Ásia", "Oceania"]
        searchController.searchBar.delegate = self

        return searchController
    }()

    // MARK: - Application lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        setupUI()
        setupAutolayout()
        navigationItem.searchController = searchController
    }

    // MARK: - Funcitions

    /// Filters the content according to the user's research and the scope used.
    /// - Parameter search: user's text  input.
    /// - Parameter scope: scope selected by the user.
    private func filterContent(search: String, in scope: String = "Todos") {
        filteredResults = countries.filter({ (country: Country) -> Bool in
            let match = (scope == "Todos") || (country.continent == scope)
            if isSearchBarEmpty() {
                return match
            } else {
                return match && country.title.lowercased().contains(search.lowercased())
            }
        })
        tableView.reloadData()
    }

    /// A Boolean value that determines whether the search bar's text is empry.
    /// - Returns: True if the search bar is empty or false if not.
    private func isSearchBarEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }

    /// A Boolean value that determines whether the search is happening.
    /// - Returns: True if the search is happening or false if not.
    private func isFiltering() -> Bool {
        let searchBarScopeIsFiltering = searchController.searchBar.selectedScopeButtonIndex != 0
        return searchController.isActive && (!isSearchBarEmpty() || searchBarScopeIsFiltering)
    }
}

// MARK: - Search bar delegate

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        guard let search = searchBar.text else { return }
        guard let scope = searchBar.scopeButtonTitles?[selectedScope] else { return  }
        filterContent(search: search, in: scope)
    }
}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        guard let search = searchController.searchBar.text else { return }
        guard let scope = searchBar.scopeButtonTitles?[searchBar.selectedScopeButtonIndex] else { return }
        filterContent(search: search, in: scope)
    }
}

// MARK: - Table view delegate and data source

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredResults.count
        }
        return countries.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CountryCell else { return UITableViewCell() }
        let currentCountry: Country
        if isFiltering() {
            currentCountry = filteredResults[indexPath.row]
        } else {
            currentCountry = countries[indexPath.row]
        }
        cell.titleLabel.text = currentCountry.title
        cell.categoryLabel.text = currentCountry.continent

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

// MARK: -  UI Setup

extension ViewController {
    /// Add all  UI elements on the main view.
    private func setupUI() {
        view.addSubview(tableView)
    }

    /// Setup autolayout to all UI  elements.
    private func setupAutolayout(){
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}

