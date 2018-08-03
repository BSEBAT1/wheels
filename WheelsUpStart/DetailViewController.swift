//
//  DetailViewController.swift
//  WheelsUpStart
//
//  Created by Berkay Sebat on 8/3/18.
//  Copyright © 2018 Berkay Sebat. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var detailPlanet:Planet?

    let name = UILabel()

    let climate = UILabel()

    let population = UILabel()

    let created = UILabel()

    init(withPlanet: Planet) {

        detailPlanet = withPlanet

        super.init(nibName: nil, bundle: nil)

    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {

        view.backgroundColor = UIColor.white

        let labels: [UILabel] = [name,climate,population,created]

        var textlabel = "Unknown"

        for (count, views) in labels.enumerated() {

            switch (count)
            {
            case 0:
                if let name = detailPlanet?.name {

                    textlabel = "Planet Name "+name

                    views.text = textlabel
                }

                views.text = textlabel
            case 1:

                if let climate = detailPlanet?.climate {

                    textlabel = "Planet Climate "+climate

                    views.text = textlabel
                }

                views.text = textlabel

            case 2:
                if let population = detailPlanet?.population {

                    textlabel = "Planet Population "+population

                    views.text = population
                }

                views.text = textlabel

            case 3:
                if let created = detailPlanet?.created {

                    textlabel = "Planet Created "+created

                    views.text = textlabel
                }

                views.text = textlabel

            default:
                views.text = textlabel
            }

            views.translatesAutoresizingMaskIntoConstraints = false

            self.view.addSubview(views)
        }

        setUpConstraints()
    }

    //Mark Setup Constraints 
    func setUpConstraints() {

        let views: [String: AnyObject] = ["name": name, "population": population, "climate": climate,"created": created]

        let verticalTitle = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-150-[name]-[population]-[climate]-[created]",
            options: .alignAllLeading,
            metrics: nil,
            views: views)

        self.view.addConstraints(verticalTitle)

    }

}
