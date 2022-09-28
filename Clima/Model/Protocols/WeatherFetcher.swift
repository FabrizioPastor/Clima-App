//
//  WeatherFetcher.swift
//  Clima
//
//  Created by FABRIZIO on 27/09/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherFetcher {
    func fetch(city: String)
}
