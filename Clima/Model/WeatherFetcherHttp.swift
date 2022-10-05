//
//  WeatherFetcherHttp.swift
//  Clima
//
//  Created by FABRIZIO on 27/09/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

//OBTENER LOS DATOS MEDIANTE HTTP
struct WeatherFetcherHttp: WeatherFetcher {
    
    func fetch(city: String) {
        let urlString = prepareURL(city: city)
        performRequest(urlString: urlString)
    }
    
    //REALIZA LA PETICION MEDIANTE URLSESSION Y REALIZA EL DECODE DE LA DATA DEVUELTA
    private func performRequest(urlString: String) {
        
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url, completionHandler: { (data: Data?, response: URLResponse?, error: Error? )  in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    
                    do {
                        let decodedData = try JSONDecoder().decode(WeatherData.self, from: safeData)
                        print(decodedData.main.temp)
                    } catch  {
                        print(error)
                    }
                    
                }
            })
            
            task.resume()
        }
    }
    
    //FORMATEA LA URL A LA QUE SE LE REALIZARÁ LA PETICION, ESTA ESTA ALOJADA EN CONSTANTS.SWIFT
    private func prepareURL(city: String) -> String {
        return WEATHER_API_URL.replacingOccurrences(of: "{API key}", with: ENV.SERVICE_API_KEY).replacingOccurrences(of: "{city name}", with: city)
    }
}
