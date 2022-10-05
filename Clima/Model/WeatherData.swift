//
//  WeatherData.swift
//  Clima
//
//  Created by FABRIZIO on 28/09/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

//REPRESENTACION DE MI MODELO DE DATOS
//CODEABLE HACE QUE SE IMPLEMENTE DECODEABLE Y CODEABLE
struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let id: Int
}
