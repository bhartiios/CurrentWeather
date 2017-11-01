//
//  WeatherDetailViewController.swift
//  WeatherApp
//
//  Created by Bharti Sharma on 01/11/17.
//  Copyright © 2017 Bharti Sharma. All rights reserved.
//

import UIKit

class WeatherDetailViewController: UIViewController {

    @IBOutlet weak var lblDetail: UILabel!
    @IBOutlet weak var imgViewIcon: UIImageView!
    
    @IBOutlet weak var lblMaxTemp: UILabel!
    @IBOutlet weak var lblMinTemp: UILabel!
    @IBOutlet weak var lblHumidity: UILabel!
    @IBOutlet weak var lblPressure: UILabel!
    
    var tempModel:TempModel?
    var tempUnit = TempUnits.Kelvin
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Custom Methods
    
    func setViewNavTitle(){
        self.navigationItem.title = "Detail"
    }
    
    func fillData(){
        guard let model = tempModel else {
            return
        }
        
        lblDetail.text = model.weatherMain + "\n" + model.weatherDescription
        imgViewIcon.loadImageForWeatherIcon(url: model.weatherIcon)
        
        if tempUnit == .Kelvin{
            lblMaxTemp.text = "\(model.maxTemp)K"
            lblMinTemp.text = "\(model.minTemp)K"
        } else{
            let celciusTemp = Float(model.maxTemp - 273.15)
            lblMaxTemp.text = "\(celciusTemp)°C"
            let celciusMinTemp = Float(model.minTemp - 273.15)
            lblMinTemp.text = "\(celciusMinTemp)°C"
        }
        
        lblHumidity.text = "\(model.humidity)%"
        lblPressure.text = "\(model.presurre)"
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
