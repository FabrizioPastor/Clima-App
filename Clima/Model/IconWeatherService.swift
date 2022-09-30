//
//  IconWeatherService.swift
//  Clima
//
//  Created by FABRIZIO on 29/09/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct IconWeatherService {
    let weatherId: Int
    init(weatherId: Int) {
        self.weatherId = weatherId
    }
    
    var icon: String { get {
        switch self.weatherId {
        case 200...232: //thunderstorm
            return "cloud.bolt.rain"
        case 300...321: //Drizzle
            return "cloud.drizzle"
        case 500...531: //Rain
            return "cloud.rain"
        case 600...622: //Snow
            return "cloud.snow"
        case 800: //Clear
            return "sun.max.fill"
        case 801...804: //Clouds
            return "cloud"
        default:
            return "cloud"
        }
    } }
}
