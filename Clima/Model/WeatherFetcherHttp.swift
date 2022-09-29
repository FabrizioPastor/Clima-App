//
//  WeatherFetcherHttp.swift
//  Clima
//
//  Created by FABRIZIO on 27/09/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherFetcherHttp: WeatherFetcher {
    
    func fetch(city: String) {
        print(prepareURL(city: city))
    }
    
    private func prepareURL(city: String) -> String {
        return URL.replacingOccurrences(of: "{API key}", with: ENV.SERVICE_API_KEY).replacingOccurrences(of: "{city name}", with: city)
    }
}
