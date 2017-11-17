//
//  ViewController.swift
//  hellogenio
//
//  Created by Mauricio Pérez Flores on 11/16/17.
//  Copyright © 2017 wappdevelopers. All rights reserved.
//

import UIKit
import GooglePlacePicker

class MapVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        view.backgroundColor = UIColor.white
        let config = GMSPlacePickerConfig(viewport: nil)
        let pickerVC = GMSPlacePickerViewController(config: config)
        pickerVC.delegate = self
        pickerVC.modalPresentationStyle = .fullScreen
        self.present(pickerVC, animated: true, completion: nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension MapVC: GMSPlacePickerViewControllerDelegate {
    func placePicker(_ viewController: GMSPlacePickerViewController, didPick place: GMSPlace) {
        
        let detailVC = DetailMapVC()
        detailVC.address = place.addressComponents
        detailVC.coordinate = place.coordinate
        self.navigationController?.pushViewController(detailVC, animated: true)
        self.dismiss(animated: true, completion: nil)

    }
    
    
    
    
}
