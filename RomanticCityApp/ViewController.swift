//
//  ViewController.swift
//  RomanticCityApp
//
//  Created by Nitesh Sharma on 27/02/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var RomanticCityTableView: UITableView!
    var romantic_cities = [
        "Paris",
        "Venice",
        "Kyoto",
        "Prague",
        "Buenos Aires",
        "Bruges",
        "Vienna",
        "Santorini",
        "Florence",
        "Barcelona"
    ]

    let romanticCities: [String: String] = [
        "Paris": "France",
        "Venice": "Italy",
        "Kyoto": "Japan",
        "Prague": "Czech Republic",
        "Buenos Aires": "Argentina",
        "Bruges": "Belgium",
        "Vienna": "Austria",
        "Santorini": "Greece",
        "Florence": "Italy",
        "Barcelona": "Spain"
    ]

    struct constants {
        static let cellIdentifier = "RomanticCityApp"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        RomanticCityTableView.register(UITableViewCell.self, forCellReuseIdentifier: constants.cellIdentifier)
    }


}

extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return romantic_cities.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: constants.cellIdentifier, for: indexPath)
        var tableViewCellContentConfugration = tableViewCell.defaultContentConfiguration()
        tableViewCellContentConfugration.text = romantic_cities[indexPath.row]
        tableViewCellContentConfugration.secondaryText = romanticCities[romantic_cities[indexPath.row]]
        tableViewCell.contentConfiguration = tableViewCellContentConfugration
        
        
        return tableViewCell
    }
    
    
}

extension ViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cityToPrint = romantic_cities[indexPath.row]
        let countryToPrint = romanticCities[romantic_cities[indexPath.row]]

        print("You Selected : \(cityToPrint), \(countryToPrint ?? "There is no Data To show") at \(indexPath) IndexPath")
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
