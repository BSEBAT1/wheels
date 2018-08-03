
//
//  DataSourceDelegate.swift
//  WheelsUpStart
//
//  Created by Berkay Sebat on 8/3/18.
//  Copyright © 2018 Berkay Sebat. All rights reserved.
//

import Foundation
import UIKit

protocol DataSourceUpdates: class {

    func updateData()
    
    func displayError(error: String)
    
}

protocol NetworkingUpdates: class {
    
    func downloadedSucess(galaxy: [Planet], next: String?)
    
    func didEnconterError(error: String)
}
