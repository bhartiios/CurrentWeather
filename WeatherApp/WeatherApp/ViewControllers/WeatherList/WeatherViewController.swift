//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Bharti Sharma on 28/10/17.
//  Copyright © 2017 Bharti Sharma. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

enum TempUnits{
    case Kelvin, Celcius
}

class WeatherViewController: UITableViewController, TemperatureManager, NVActivityIndicatorViewable {
    
    @IBOutlet var viewTempConverter: UIView!
    @IBOutlet weak var btnKelvin: UIButton!
    @IBOutlet weak var btnCelcius: UIButton!
    
    var arrTempCity:[TempModel] = []
    var currentTempUnit = TempUnits.Kelvin
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = viewTempConverter
        self.getTempOfAllCities { (arrResult, error) in
            
            guard let arrResult = arrResult else{
                return
            }
            self.arrTempCity = arrResult
            self.tableView.reloadData()
        }
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
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
