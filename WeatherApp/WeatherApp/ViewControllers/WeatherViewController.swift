//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Bharti Sharma on 28/10/17.
//  Copyright © 2017 Bharti Sharma. All rights reserved.
//

import UIKit
import MBProgressHUD

enum TempUnits{
    case Kelvin, Celcius
}

class WeatherViewController: UITableViewController, TemperatureAPI {
    
    @IBOutlet var viewTempConverter: UIView!
    @IBOutlet weak var btnKelvin: UIButton!
    @IBOutlet weak var btnCelcius: UIButton!
    
    var selectedCityIndex = 0
    var arrTempCity:[TempModel] = []
    var currentTempUnit = TempUnits.Kelvin
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewNavTitle()
        callWebserviceForTemp()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrTempCity.count
    }
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as? WeatherTableViewCell else{
            return UITableViewCell()
        }
        cell.fillData(modelTemp: arrTempCity[indexPath.row],tempUnit: currentTempUnit)
        return cell
     }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCityIndex = indexPath.row
    }
    
    //MARK:- Custom Methods
    
    func setViewNavTitle(){
        self.navigationItem.title = "Temperature"
        self.tableView.tableFooterView = viewTempConverter
        viewTempConverter.isHidden = true
        btnKelvin.isSelected = true //By default temp is in Kelvin coming from webservice
    }
    
    func callWebserviceForTemp(){
        showLoader()
        self.getTempOfAllCities(arrCities: [AppConstants.sydneyId,AppConstants.melbourneId,AppConstants.brisbaneId]) { (arrResult, error) in
            self.hideLoader()
            guard let arrResult = arrResult else{
                return
            }
            self.arrTempCity = arrResult
            self.tableView.reloadData()
            self.viewTempConverter.isHidden = false
            
        }
    }
    
    //MARK:- IBAction Methods
    
    @IBAction func btnTempConverterAction(_ sender: UIButton) {
        btnKelvin.isSelected = false
        btnCelcius.isSelected = false
        
        sender.isSelected = true
        if btnCelcius.isSelected{
            currentTempUnit = .Celcius
        } else{
            currentTempUnit = .Kelvin
        }
        self.tableView.reloadData()
    }
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
        if segue.identifier == "ShowWeatherDetail"{
            if let vcDetail = segue.destination as? WeatherDetailViewController{
                vcDetail.tempModel = arrTempCity[selectedCityIndex]
                vcDetail.tempUnit = self.currentTempUnit
            }
        }
     }
}
