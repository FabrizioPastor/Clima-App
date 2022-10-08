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

    var delegate: WeatherManagerDelegate?
    
    func fetch(city: String) {
        let urlString = prepareURL(city: city)
        performRequest(with: urlString)
    }
    
    func fetch(lat: Double, long: Double){
        let urlString = prepareURL(lat: lat, long: long)
        performRequest(with: urlString)
    }
    
    //REALIZA LA PETICION MEDIANTE URLSESSION Y REALIZA EL DECODE DE LA DATA DEVUELTA
    private func performRequest(with urlString: String) {
        
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url, completionHandler: { (data: Data?, response: URLResponse?, error: Error? )  in
                //VALIDAR SI EL SERVICIO NOS HA RETORNADO ALGÚN ERROR
                if error != nil {
                    delegate?.didFailWithError(error!)
                    return
                }
                
                if let safeData = data {
                    
                    if let weather = parseJSON(safeData){
                        delegate?.didUpdateWeather(self, weather: weather)
                    }
                    
                }
            })
            
            task.resume()
        }
    }
    
    private func parseJSON(_ weatherData: Data) ->  WeatherModel? {
        
        do {
            let decodedData = try JSONDecoder().decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weather
        } catch  {
            delegate?.didFailWithError(error)
            return nil
        }
        
    }
    
    //FORMATEA LA URL A LA QUE SE LE REALIZARÁ LA PETICION, ESTA ESTA ALOJADA EN CONSTANTS.SWIFT
    private func prepareURL(city: String) -> String {
        return URLS.WEATHER_API_URL.replacingOccurrences(of: "{API key}", with: ENV.SERVICE_API_KEY).replacingOccurrences(of: "{city name}", with: city)
    }
    private func prepareURL(lat: Double, long: Double) -> String {
        return URLS.WEATHER_API_URL_COORDENATES.replacingOccurrences(of: "{API key}", with: ENV.SERVICE_API_KEY).replacingOccurrences(of: "{lat}", with: String(lat)).replacingOccurrences(of: "{lon}", with: String(long))
    }
}
