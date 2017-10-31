//
//  TempModel.swift
//  WeatherApp
//
//  Created by Bharti Sharma on 29/10/17.
//  Copyright © 2017 Bharti Sharma. All rights reserved.
//

import Foundation

struct TempModel{
    var city = ""
    var temp = 0.0
    
    mutating func fillCityTemperature(dictResponse: [String:Any]){
        
        if let city = dictResponse["name"] as? String{
            self.city = city
        }
        
        if let dictMain = dictResponse["main"] as? [String:Any]{
            if let tempo = dictMain["temp"] as? NSNumber{
                self.temp = tempo.doubleValue
            }
        }
    }
}
