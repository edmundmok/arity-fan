//
//  ViewController.swift
//  ArityFan
//
//  Created by Edmund Mok on 9/17/17.
//  Copyright © 2017 Edmund Mok. All rights reserved.
//

import UIKit
import CoreEngine

class ViewController: UIViewController {

    @IBOutlet var startTrip: UIButton!
    @IBOutlet var amountSpilt: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func onStartTrip(_ sender: UIButton) {
        if sender.titleLabel?.text == "Start" {
            sender.setTitle("End", for: .normal)
        } else {

            sender.setTitle("Start", for: .normal)
        }
    }

    func createAlert() {
        let alert = UIAlertController(title: "Trip ended",
                                      message: "You spilt \(amountSpilt) amount of water",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel,
                                      handler: nil))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

