//
//  NetworkJedi.swift
//  WheelsUpStart
//
//  Created by Berkay Sebat on 8/3/18.
//  Copyright © 2018 Berkay Sebat. All rights reserved.
//

import UIKit

class NetworkJedi { 
    
    weak var delegate: NetworkingUpdates?

    func fetchDataWithUrlString(url: String) {
        
        var arrayofPlanets = [Planet]()
        
        guard let jsonString = URL(string: url) else {
            
            delegate?.didEnconterError(error: "Malformed URL Error")
            
            return
        }
        
        URLSession.shared.dataTask(with: jsonString) { [weak self] (data, response, error) in
            guard let strongSelf = self else { return }
            
            if let error = error {
                
                strongSelf.delegate?.didEnconterError(error: error.localizedDescription)
                
                return
            }
            
            guard let starwarsData = data else {
                
                strongSelf.delegate?.didEnconterError(error: "Malformed Data Erorr")
              
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                
                strongSelf.delegate?.didEnconterError(error: "Unable to Get Server Response")
                
                return
            }
            
            guard case httpResponse.statusCode = 200 else {
                
                  strongSelf.delegate?.didEnconterError(error: "Invalid Server Response")
                
                return
            }
            
            do {
                
                let json =  try JSONDecoder().decode(Results.self, from: starwarsData)
                
                if let galaxy = json.results {
                    
                    galaxy.forEach {arrayofPlanets.append($0)}
                    
                    strongSelf.delegate?.downloadedSucess(galaxy: arrayofPlanets, next: json.next)
                    
                }
                
            } catch let jsonError {
                
                strongSelf.delegate?.didEnconterError(error: jsonError.localizedDescription)
        
            }
            
            }.resume()
    }

}
