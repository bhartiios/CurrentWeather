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
    var weatherMain = ""
    var weatherDescription = ""
    var weatherIcon = ""
    var minTemp = 0.0
    var maxTemp = 0.0
    var humidity = 0
    var presurre  = 0.0
    
    
    /// Fill all the variables of struct from server data
    ///
    /// - Parameter dictResponse: server dict
    
    mutating func fillCityTemperature(dictResponse: [String:Any]){
        
        if let city = dictResponse["name"] as? String{
            self.city = city
        }
        
        if let dictMain = dictResponse["main"] as? [String:NSNumber]{
            if let tempo = dictMain["temp"]{
                self.temp = tempo.doubleValue
            }
            if let tempo = dictMain["temp_min"]{
                self.minTemp = tempo.doubleValue
            }
            if let tempo = dictMain["temp_max"]{
                self.maxTemp = tempo.doubleValue
            }
            if let tempo = dictMain["humidity"]{
                self.humidity = tempo.intValue
            }
            if let tempo = dictMain["pressure"]{
                self.presurre = tempo.doubleValue
            }
        }
        
        if let arrMain = dictResponse["weather"] as? [[String:Any]]{
            if let dictMain = arrMain.first {
                if let main = dictMain["main"] as? String{
                    self.weatherMain = main
                }
                if let desc = dictMain["description"] as? String{
                    self.weatherDescription = desc
                }
                if let icon = dictMain["icon"] as? String{
                    self.weatherIcon = icon
                }
            }
        }
    }
}
