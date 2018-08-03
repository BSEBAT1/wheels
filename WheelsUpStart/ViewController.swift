//
//  ViewController.swift
//  WheelsUpStart
//
//  Created by Berkay Sebat on 8/3/18.
//  Copyright © 2018 Berkay Sebat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let table = UITableView()
    
    let networking = NetworkJedi()
    
    var datasource: TableViewDataSource?
    
    override func viewDidLoad() {

        super.viewDidLoad()

        table.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(table)

        table.delegate = self

        datasource = TableViewDataSource(withDataSource: "https://swapi.co/api/planets")

        datasource?.delegate = self

        table.dataSource = datasource

        table.register(StarWarsTableViewCell.self, forCellReuseIdentifier: "cell")

        table.layer.masksToBounds = true

        setupViews()
    }
    
    func setupViews() {
        
        let subviews: [String: AnyObject] = ["tableView": table]
        
        let tableViewHorizontal = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[tableView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: subviews)
        
        let tableViewVertical = NSLayoutConstraint.constraints(withVisualFormat: "V:|-[tableView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: subviews)
        
        view.addConstraints(tableViewVertical)
        
        view.addConstraints(tableViewHorizontal)
        
        table.tableFooterView = UIView(frame: .zero)
        
    }
    
}

extension ViewController: UITableViewDelegate {
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

            let selected = datasource?.starWarsPlanets[indexPath.row]

        if let selectedplanet = selected {

            let detail = DetailViewController.init(withPlanet: selectedplanet)

            self.navigationController?.pushViewController(detail, animated: false)
        }

        }
}

extension ViewController: DataSourceUpdates {
    
    func updateData() {
       
        DispatchQueue.main.async {
           
            self.table.reloadData()
        }
       
    }

    func displayError(error: String) {
        
        // create the alert
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))

        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
}
