//
//  ViewController.swift
//  WikiBrowser
//
//  Created by StartupBuilder.INFO on 9/14/20.
//  Copyright © 2020 StartupBuilder.INFO. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage

class ViewController: UIViewController {
    
    let wikipediaURL = "https://en.wikipedia.org/w/api.php"

    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var articleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func searchPressed(_ sender: UIButton) {
        
        let parameters: [String: String] = [
            "format": "json",
            "action": "query",
            "prop": "extracts",
            "exintro": "",
            "explaintext": "",
            "indexpageids": "",
            "redirects": "1",
            "titles": searchField.text!
        ]
        
        AF.request(wikipediaURL, method: HTTPMethod.get, parameters: parameters).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                
                let firstPage = json["query"]["pageids"][0].stringValue
                let firstResult = json["query"]["pages"][firstPage]
                
                print("Title: \(firstResult["extract"])")
                print("Extract: \(firstResult["extract"])")
                
                DispatchQueue.main.async {
                    self.articleLabel.text = firstResult["extract"].stringValue
                }
            case .failure(let error):
                print(error)
            }
        }
        
        searchField.text = ""
    }
    
}

