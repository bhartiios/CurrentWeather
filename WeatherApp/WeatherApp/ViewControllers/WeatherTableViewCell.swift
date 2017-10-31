//
//  WeatherTableViewCell.swift
//  WeatherApp
//
//  Created by Bharti Sharma on 28/10/17.
//  Copyright © 2017 Bharti Sharma. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblTemp: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    
    /// Fill Cell with Data
    ///
    /// - Parameters:
    ///   - modelTemp: temp model
    ///   - tempUnit: Current temp unit i.e Kelvin or Celcius
    
    func fillData(modelTemp: TempModel, tempUnit:TempUnits){
        lblCity.text = modelTemp.city
        if tempUnit == .Kelvin{
            lblTemp.text = "\(modelTemp.temp)K"
        } else{
            let celcius = Float(modelTemp.temp - 273.15)
            lblTemp.text = "\(celcius)°C"
        }
    }
}
