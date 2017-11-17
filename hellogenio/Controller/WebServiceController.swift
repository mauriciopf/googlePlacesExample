//
//  WebServiceController.swift
//  hellogenio
//
//  Created by Mauricio Pérez Flores on 11/16/17.
//  Copyright © 2017 wappdevelopers. All rights reserved.
//

import UIKit

class WebServiceController: NSObject {

    static let url = "https://api.hellogenio.com/common/global/test/android/sample/data"
    
    struct myArray: Decodable {
        var array: [jsonArray]
    }
    
    struct jsonArray: Decodable {
        var type: String?
        var name: String?
        var text: String?
        var image: String?
    }
    
    static func getRequest(completition: @escaping ([jsonArray]) -> Void) {
        
        let request = NSMutableURLRequest(url: URL(string: WebServiceController.url)!)
        request.addValue("application-json", forHTTPHeaderField: "content-type")
        request.httpMethod = "GET"
        let session = URLSession.shared
        let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
            

            do {
                let myStruct = try JSONDecoder().decode(myArray.self, from: data!)  // Decoding our data
                completition(myStruct.array)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
}
