//
//  DetailMapVC.swift
//  hellogenio
//
//  Created by Mauricio Pérez Flores on 11/17/17.
//  Copyright © 2017 wappdevelopers. All rights reserved.
//

import UIKit
import GooglePlacePicker

class DetailMapVC: UIViewController {

    var address: [GMSAddressComponent]!
    var coordinate: CLLocationCoordinate2D!
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for element in address {
            print(element.name)
        }
        
        view.backgroundColor = UIColor.white
        
        tableView = UITableView()
        tableView.frame = view.frame
        tableView.dataSource = self
        tableView.register(MapVCTableViewCell.self, forCellReuseIdentifier: HomeVC.identifier)
        view.addSubview(tableView)
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension DetailMapVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        } else {
            return address.count 
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath.row)

        let cell = tableView.dequeueReusableCell(withIdentifier: HomeVC.identifier, for: indexPath) as! MapVCTableViewCell

        if indexPath.section == 0 {
            cell.cellType = "coordinate"
            cell.latitudeLabel.text = String(coordinate.latitude)
            cell.longitudeLabel.text = String(coordinate.longitude)

        } else {
            cell.cellType = "address"
            let addressElement = address[indexPath.row]
            cell.addressLabel.text = addressElement.name 
        }
        return cell
    }
}
