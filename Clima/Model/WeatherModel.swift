//
//  WeatherModel.swift
//  Clima
//
//  Created by FABRIZIO on 29/09/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    private let conditionId: Int
    let cityName: String
    private let temperature: Double
    
    init(conditionId: Int, cityName: String, temperature: Double) {
        self.conditionId = conditionId
        self.cityName = cityName
        self.temperature = temperature
    }
    
    var temperatureFormated: String { get { String(format: "%.1f", temperature) } }
    var conditionName: String { get { IconWeatherService(weatherId: self.conditionId).icon } }
}
