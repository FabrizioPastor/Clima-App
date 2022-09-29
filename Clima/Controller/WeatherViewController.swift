//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

//UITextFieldDelefate es un protocol (interfaz)
class WeatherViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var searchTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchTextField.delegate = self
    }


    @IBAction func searchPressed(_ sender: Any) {
        searchTextField.endEditing(true)
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            return true
        }
        
        textField.placeholder = "Type something"
        
        // Create new Alert
        let dialogMessage = UIAlertController(title: "Confirm", message: "Please, try type something", preferredStyle: .alert)
         
         // Create OK button with action handler
         let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
          })
         
         //Add OK button to a dialog message
         dialogMessage.addAction(ok)
         // Present Alert to
         self.present(dialogMessage, animated: true, completion: nil)
        
        return false
    }
    
    @objc func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder() // dismiss keyboard
            return true
        }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTextField.text {
            let weatherService = WeatherService()
            weatherService.delegate = WeatherFetcherHttp()
            
            weatherService.getWeather(city: city)
        }
        
        searchTextField.text = ""
    }
}

protocol APIKeyable {
    var SERVICE_API_KEY: String { get }
}

class BaseEnv {
    
    let dict: NSDictionary
    
    init(resourceName: String) {
        guard let filePath = Bundle.main.path(forResource: resourceName, ofType: "plist"), let plist = NSDictionary(contentsOfFile: filePath) else {
            fatalError("Couldn't find the file plist")
        }
        
        self.dict = plist
    }
}

class DebugEnv: BaseEnv, APIKeyable {
    
    init() {
        super.init(resourceName: "DEBUG-Keys")
    }
    
    var SERVICE_API_KEY: String {
        dict.object(forKey: "SERVICE_API_KEY") as? String ?? ""
    }
    
    
    
}

class ProdEnv: BaseEnv, APIKeyable {
    
    init() {
        super.init(resourceName: "PROD-Keys")
    }
    
    var SERVICE_API_KEY: String {
        dict.object(forKey: "SERVICE_API_KEY") as? String ?? ""
    }
    
    
    
}
