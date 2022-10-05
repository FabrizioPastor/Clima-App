//
//  UpdateWeatherDelegate.swift
//  Clima
//
//  Created by FABRIZIO on 4/10/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherFetcherHttp: WeatherFetcherHttp ,weather: WeatherModel)
    func didFailWithError(_ error: Error)
}
