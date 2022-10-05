//
//  ApiKey.swift
//  Clima
//
//  Created by FABRIZIO on 4/10/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

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
