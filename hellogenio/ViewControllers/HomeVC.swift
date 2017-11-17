//
//  HomeVC.swift
//  hellogenio
//
//  Created by Mauricio Pérez Flores on 11/16/17.
//  Copyright © 2017 wappdevelopers. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    var tableView: UITableView!
    var photosArray = [WebServiceController.jsonArray]()
    static let identifier = "cell"
    var imageCache = NSCache<NSString, UIImage>()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        view.backgroundColor = UIColor.white
        
        tableView = UITableView()
        tableView.frame = view.frame
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeVC.identifier)
        view.addSubview(tableView)
        
        WebServiceController.getRequest { (photos) in

                for element in photos {
                    if element.type == "data_0" || element.type == "data_1" {
                        self.photosArray.append(element)
                }
                }
            
            DispatchQueue.main.async {
            self.tableView.reloadData()
            }
        }
        
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = false
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

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if photosArray.count > 0 {
            return photosArray.count
        } else { return 0 }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeVC.identifier, for: indexPath) as! HomeTableViewCell
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        activityIndicator.startAnimating()
        cell.contentView.addSubview(activityIndicator)
        let jsonElement = photosArray[indexPath.row]
        cell.typeOfCell = jsonElement.type
        let url = URL(string: jsonElement.image!)
        
        downloadImage(url: url!) { (image) in

            cell.myImageView.image = image
            DispatchQueue.main.async {
            activityIndicator.stopAnimating()
            }
        }
        
        return cell
    }
    
    func downloadImage(url: URL, completion: @escaping (UIImage?) -> Void) {
    
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
            completion(cachedImage)
        }  else {
        
        DispatchQueue.global(qos: .background).async {
            let data = NSData(contentsOf: url)! as Data
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                self.imageCache.setObject(image, forKey: url.absoluteString as NSString)
               completion(image)
                }
            }
        }
        
        }
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(MapVC(), animated: true)
        
    }
}
