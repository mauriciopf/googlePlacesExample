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

    var isPresented = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        if !isPresented {
        isPresented = true
        let config = GMSPlacePickerConfig(viewport: nil)
        let pickerVC = GMSPlacePickerViewController(config: config)
        pickerVC.delegate = self

        pickerVC.modalPresentationStyle = .overFullScreen
        self.present(pickerVC, animated: false, completion: nil)

        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension MapVC: GMSPlacePickerViewControllerDelegate {
    func placePicker(_ viewController: GMSPlacePickerViewController, didPick place: GMSPlace) {
        isPresented = false
        let detailVC = DetailMapVC()
        detailVC.address = place.addressComponents
        detailVC.coordinate = place.coordinate
        self.navigationController?.pushViewController(detailVC, animated: true)
        self.dismiss(animated: true, completion: nil)

    }
    
    func placePickerDidCancel(_ viewController: GMSPlacePickerViewController) {
        self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
}
