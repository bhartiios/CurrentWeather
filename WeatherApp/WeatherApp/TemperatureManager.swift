//
//  TemperatureManager.swift
//  WeatherApp
//
//  Created by Bharti Sharma on 30/10/17.
//  Copyright © 2017 Bharti Sharma. All rights reserved.
//

import Foundation

protocol TemperatureManager: WebserviceCall {
    
}

extension TemperatureManager{
    
    func getTempOfAllCities(completionHandler: @escaping (_ jsonResponse:[TempModel]?, _ error: Error?)->Void){
        
        self.makeGETWebserviceCall(strURL: "https://api.openweathermap.org/data/2.5/group?id=4163971,2147714,2174003&appid=19e4379f7f24ccd74ea4a061bff08e64") { (response, error) in
            
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
