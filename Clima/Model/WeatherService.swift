//
//  WeatherService.swift
//  Clima
//
//  Created by FABRIZIO on 27/09/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

class WeatherService {
    var delegate: WeatherFetcher?
    
    func getWeather(city: String) {
        delegate?.fetch(city: city)
    }
}
