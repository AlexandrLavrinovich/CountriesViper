//
//  MainScreenMainScreenViewController.swift
//  Countries
//
//  Created by Alexandr Lavrinovich on 08/09/2020.
//  Copyright © 2020 FlatStack. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController {

    var presenter: MainScreenViewOutput?
    var countries: [CountryModel] = [CountryModel]()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.beginFetchCountries()
        makeView()
    }


    // MARK: MainScreenViewInput
    func setupInitialState() {
    }
}



//MARK: - Private
private extension MainScreenViewController {
    func makeView() {
        self.title = "Countries"
        tableView.delegate = self
        tableView.dataSource = self
    }
}



//MARK: - MainScreenViewInput
extension MainScreenViewController: MainScreenViewInput {
    func showCountries(countries: [CountryModel]) {
        self.countries = countries
        self.tableView.reloadData()
    }
    
    func showError() {
        let alert = UIAlertController(title: "Error", message: "Countries not downloaded", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
}



//MARK: - UITableViewDelegate
extension MainScreenViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectRowAt(index: indexPath.row)
    }
}



//MARK: - UITableViewDataSource
extension MainScreenViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CountryCell else { return UITableViewCell() }
        let country = countries[indexPath.row]
        cell.flagImage.load(url: URL(string:country.country_info.flag)!)
        cell.countryName.text = country.name
        cell.countryCapital.text = country.capital
        cell.smallDescription.text = country.description_small
        if country.description_small.isEmpty {
            cell.bottomConstraint.constant = 0
        } else {
            cell.bottomConstraint.constant = 16
        }
        view.layoutIfNeeded()
        return cell
    }
}
