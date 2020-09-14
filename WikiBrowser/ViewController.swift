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
            print(response)
        }
        
        searchField.text = ""
    }
    
}

