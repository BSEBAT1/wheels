//
//  DetailViewController.swift
//  WheelsUpStart
//
//  Created by Berkay Sebat on 8/3/18.
//  Copyright © 2018 Berkay Sebat. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {

        super.viewDidLoad()

        var image:UIImageView = UIImageView()
        var artistName:UILabel = UILabel()
        var genreLabel:UILabel = UILabel()
        var titleLabel:UILabel = UILabel()
        var label: UILabel = UILabel()

        image.translatesAutoresizingMaskIntoConstraints=false
        artistName.translatesAutoresizingMaskIntoConstraints=false
        genreLabel.translatesAutoresizingMaskIntoConstraints=false
        titleLabel.translatesAutoresizingMaskIntoConstraints=false
        view.addSubview(image)
        view.addSubview(artistName)
        view.addSubview(genreLabel)
        view.addSubview(titleLabel)
        artistName.text="Artist:Dua Lipa"
        genreLabel.text="Genre:Pop/House"
        titleLabel.text="CurrentAlbum:Dua Lipa"
        image.image=UIImage.init(named:"planet")
        image.layer.cornerRadius=8;
        image.clipsToBounds=true;
        label = UILabel()
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints=false
        label.text="demo"

        let dictonaryofviews:[String:AnyObject] = ["Image":image,"Artist":artistName,"Genre":genreLabel,"Title":titleLabel,"label":label]

        let imagevert=NSLayoutConstraint.constraints(withVisualFormat:"H:|-2-[Image(95@1000)]-10-[Artist(55@500)]" , options:[.alignAllTop], metrics:nil, views:dictonaryofviews)
        let imagehor = NSLayoutConstraint.constraints(withVisualFormat:"V:|-2-[Image(95@1000)]|" , options:NSLayoutFormatOptions(rawValue: 0), metrics:nil, views:dictonaryofviews)
         // swiftlint:disable:next line_length
        let genretvert=NSLayoutConstraint.constraints(withVisualFormat:"V:[Artist]-5-[Genre(25@650)]-5-[Title(25@650)]-[label(20@650)]" , options:[.alignAllLeading], metrics:nil, views:dictonaryofviews)

        view.addConstraints(genretvert)
        view.addConstraints(imagevert)
        view.addConstraints(imagehor)


    }




}
