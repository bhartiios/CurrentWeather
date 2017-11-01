//
//  AppUtility.swift
//  WeatherApp
//
//  Created by Bharti Sharma on 01/11/17.
//  Copyright © 2017 Bharti Sharma. All rights reserved.
//

import UIKit
import MBProgressHUD

extension UIViewController{
    
    func showLoader(){
        MBProgressHUD.showAdded(to: self.view, animated: true)
    }
    
    func hideLoader(){
        MBProgressHUD.hide(for: self.view, animated: true)
    }
}

