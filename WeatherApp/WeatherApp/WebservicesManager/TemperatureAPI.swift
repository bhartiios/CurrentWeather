//
//  TemperatureAPI.swift
//  WeatherApp
//
//  Created by Bharti Sharma on 30/10/17.
//  Copyright © 2017 Bharti Sharma. All rights reserved.
//

import Foundation

protocol TemperatureAPI: WebserviceCall {
    
}

extension TemperatureAPI{
    
    
    /// Api to get current weather of multiple cities using their id's. Id's can be get from openweatherapi page
    ///
    /// - Parameters:
    ///   - arrCities: array constaining list of all cities id's
    ///   - completionHandler: completion closure
    
    func getTempOfAllCities(arrCities:[String], completionHandler: @escaping (_ jsonResponse:[TempModel]?, _ error: Error?)->Void){
        
        self.makeGETWebserviceCall(strURL: "https://api.openweathermap.org/data/2.5/group?id=\(arrCities.joined(separator: ","))&appid=\(AppConstants.openWeatherKey)") { (response, error) in
            
            if let webError = error {
                completionHandler(nil, webError)
                return
            }
            guard let jsonResponse = response as? [String:Any] else{
                completionHandler(nil,nil)
                return
            }
            
            var arrCityTemp:[TempModel] = []
            
            guard let arrList = jsonResponse["list"] as? [[String:Any]] else{
                completionHandler(nil,nil)
                return
            }
            for dict in arrList{
                var modelTemp = TempModel()
                modelTemp.fillCityTemperature(dictResponse: dict)
                arrCityTemp.append(modelTemp)
            }
            
            completionHandler(arrCityTemp, nil)
        }
    }
}
