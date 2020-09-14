//
//  ViewController.swift
//  WikiBrowser
//
//  Created by StartupBuilder.INFO on 9/14/20.
//  Copyright © 2020 StartupBuilder.INFO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func searchPressed(_ sender: UIButton) {
        
        searchField.text = ""
    }
    
}

