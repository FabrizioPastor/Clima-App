//
//  Constants.swift
//  Clima
//
//  Created by FABRIZIO on 27/09/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct URLS {
    static let WEATHER_API_URL: String = "https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}&units=metric"
    static let WEATHER_API_URL_COORDENATES: String = "https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}&units=metric"
}
