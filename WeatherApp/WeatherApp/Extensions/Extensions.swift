//
//  AppUtility.swift
//  WeatherApp
//
//  Created by Bharti Sharma on 01/11/17.
//  Copyright © 2017 Bharti Sharma. All rights reserved.
//

import UIKit
import MBProgressHUD
import Alamofire
 
extension UIViewController{
    
    func showLoader(){
        MBProgressHUD.showAdded(to: self.view, animated: true)
    }
    
    func hideLoader(){
        MBProgressHUD.hide(for: self.view, animated: true)
    }
}

extension UIImageView {
    
    func loadImageForWeatherIcon(url: String){
        
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        activityIndicator.frame = self.bounds
        self.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        let urlImg = AppConstants.openWeatherImageURl + url + ".png"
        
        Alamofire.request(urlImg).responseData { (response) in
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
            if let dataImage = response.data {
                self.image = UIImage(data: dataImage)
            }
        }
    }
}

