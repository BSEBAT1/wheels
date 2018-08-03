//
//  StarWarsTableViewCell.swift
//  WheelsUpStart
//
//  Created by Berkay Sebat on 8/3/18.
//  Copyright © 2018 Berkay Sebat. All rights reserved.
//

import UIKit

class StarWarsTableViewCell: UITableViewCell {

    let title = UILabel()

    let detailIcon: UIImageView = UIImageView ()

    let planetIcon: UIImageView = UIImageView()

    func setUp(starWarsPlanet: Planet) {

        title.translatesAutoresizingMaskIntoConstraints = false

        self.addSubview(title)

        detailIcon.translatesAutoresizingMaskIntoConstraints = false

        detailIcon.contentMode = UIViewContentMode.scaleAspectFit

        detailIcon.clipsToBounds = true

        detailIcon.image = UIImage(named: "light2")

        self.addSubview(detailIcon)

        planetIcon.translatesAutoresizingMaskIntoConstraints = false

        planetIcon.contentMode = UIViewContentMode.scaleAspectFit

        planetIcon.clipsToBounds = true

        planetIcon.image = UIImage(named: "planet")

        self.addSubview(planetIcon)

        if let name =  starWarsPlanet.name {

            title.text = name

            title.font = UIFont(name: "Futura-Medium", size: 20)
        }

        layoutConstraits()
}
    
    func layoutConstraits() {

        let views: [String: AnyObject] = ["title": title, "detail": detailIcon, "planet": planetIcon]

        let verticalTitle = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|[title]-[planet]-|",
            options: NSLayoutFormatOptions(rawValue: 0),
            metrics: nil,
            views: views)

        let verticalDetail = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-15-[detail]-|",
            options: NSLayoutFormatOptions(rawValue: 0),
            metrics: nil,
            views: views)

        let horizontalDetail = NSLayoutConstraint.constraints(
            withVisualFormat: "H:[detail]-0-|",
            options: NSLayoutFormatOptions(rawValue: 0),
            metrics: nil,
            views: views)

        let horizontalPlanet = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-10-[planet]",
            options: NSLayoutFormatOptions(rawValue: 0),
            metrics: nil,
            views: views)

        let horizontalTitle = NSLayoutConstraint.constraints(
                withVisualFormat: "H:|-[title]-|",
                options: NSLayoutFormatOptions(rawValue: 0),
                metrics: nil,
                views: views)

            self.addConstraints(verticalTitle)

            self.addConstraints(horizontalTitle)

            self.addConstraints(horizontalDetail)

            self.addConstraints(verticalDetail)

            self.addConstraints(verticalDetail)

            self.addConstraints(horizontalPlanet)

    }

}
