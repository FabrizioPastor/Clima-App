//
//  WeatherService.swift
//  Clima
//
//  Created by FABRIZIO on 27/09/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

//SERVICIO QUE RECIBIRA UN DELEGADO PARA OBTENER EL CLIMA POR CUALQUIER IMPLEMENTACION X
class WeatherService {
    var delegate: WeatherFetcher?
    
    func getWeather(city: String) {
        delegate?.fetch(city: city)
    }
}
