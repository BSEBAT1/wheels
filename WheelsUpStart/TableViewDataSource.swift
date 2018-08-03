//
//  TableViewDataSource.swift
//  WheelsUpStart
//
//  Created by Berkay Sebat on 8/3/18.
//  Copyright © 2018 Berkay Sebat. All rights reserved.
//

import UIKit

class TableViewDataSource: NSObject {
    
    var starWarsPlanets = [Planet]()
    let network = NetworkJedi()
    var nextURL: String?
    
    weak var delegate: DataSourceUpdates?

    init(withDataSource: String) {
        super.init()

        network.delegate = self
        fetchData(urlString: withDataSource)
    }
    
    func fetchData(urlString: String) {

        network.fetchDataWithUrlString(url: urlString)
    }
}

extension TableViewDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print(starWarsPlanets.count)
        
        return  starWarsPlanets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? StarWarsTableViewCell

        if let planetCell = cell {

            let planetIndexPath = starWarsPlanets[indexPath.row]

            planetCell.setUp(starWarsPlanet: planetIndexPath)

            if indexPath.row == starWarsPlanets.count - 1 {
                if let next = nextURL {
                    fetchData(urlString: next)
                }
            }

            return planetCell
        }

        //return blank cell in case we cannot assemble a burrito cell
        let blank: UITableViewCell = UITableViewCell()

        return blank
}
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        return "PLANETS"
    }
}

extension TableViewDataSource: NetworkingUpdates {
    
    func downloadedSucess(galaxy: [Planet], next: String?) {

      starWarsPlanets.append(contentsOf: galaxy)

        nextURL = next
        
        delegate?.updateData()
    }
    
    func didEnconterError(error: String) {

        delegate?.displayError(error: error)
    }
    
}
