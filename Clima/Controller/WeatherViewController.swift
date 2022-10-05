//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

//UITextFieldDelefate es un protocol (interfaz)
class WeatherViewController: UIViewController, UITextFieldDelegate, WeatherManagerDelegate {
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherFethcerHttp = WeatherFetcherHttp()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        weatherFethcerHttp.delegate = self
        searchTextField.delegate = self
    }


    @IBAction func searchPressed(_ sender: Any) {
        searchTextField.endEditing(true)
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        }
        
        textField.placeholder = "Type something"
        
        showAlertEmtySearch()
        
        return false
    }
    
    @objc func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder() // dismiss keyboard
            return true
        }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //HACIENDO USO DEL PATRON DELEGADO
        if let city = searchTextField.text {
            weatherFethcerHttp.fetch(city: city)
        }
        
        searchTextField.text = ""
    }
    
    func showAlertEmtySearch(){
        
        // Create new Alert
        let dialogMessage = UIAlertController(title: "Confirm", message: "Please, try type something", preferredStyle: .alert)
         
         // Create OK button with action handler
         let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
          })
         
         //Add OK button to a dialog message
         dialogMessage.addAction(ok)
         // Present Alert to
         self.present(dialogMessage, animated: true, completion: nil)
        
    }
    
    func didUpdateWeather(_ weatherFetcherHttp: WeatherFetcherHttp ,weather: WeatherModel) {
        
    }
    
    func didFailWithError(_ error: Error) {
        print(error)
    }
}

