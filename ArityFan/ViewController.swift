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

    private var sharedEngine: DEMDrivingEngineManager!
    private var engineConfiguration: DEMConfiguration!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        setupCoreEngine()
    }

    private func setupCoreEngine() {
        self.sharedEngine = DEMDrivingEngineManager.sharedManager() as! DEMDrivingEngineManager
        self.engineConfiguration = DEMConfiguration.sharedManager() as DEMConfiguration
        self.engineConfiguration.enableDeveloperMode = true
        self.engineConfiguration.speedLimit = 60
        self.engineConfiguration.enableRawDataCollection = false
        self.engineConfiguration.enableWebServices = false
        self.sharedEngine.setConfiguration(engineConfiguration)
        self.sharedEngine.delegate = self
        registerForAllEvents()
    }

    private func registerForAllEvents() {
        self.sharedEngine.register(for: .all)
    }

}

extension ViewController: DEMDrivingEngineDelegate {

    func didStartTripRecording(_ drivingEngine: DEMDrivingEngineManager!) -> String! {
        return "ABC"
    }

    func didStartTripRecording(with tripInfo: DEMTripInfo!) {

    }

    func didStopTripRecording(_ drivingEngine: DEMDrivingEngineManager!) {

    }

    func drivingEngine(_ drivingEngine: DEMDrivingEngineManager!, didSaveTripInformation trip: DEMTripInfo!, driveStatus driveCompletionFlag: Bool) {

    }

    func didStopInvalidTripRecording(_ drivingEngine: DEMDrivingEngineManager!) {

    }

    func drivingEngine(_ drivingEngine: DEMDrivingEngineManager!, didDetectStartOfSpeeding overSpeedingEvent: DEMEventInfo!) {

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

    func drivingEngine(_ drivingEngine: DEMDrivingEngineManager!, didDetectEndOfSpeeding overSpeedingEvent: DEMEventInfo!) {


    }

    func drivingEngine(_ drivingEngine: DEMDrivingEngineManager!, didDetectAcceleration accelerationEvent: DEMEventInfo!) {

    }

    func drivingEngine(_ drivingEngine: DEMDrivingEngineManager!, didDetectBraking brakingEvent: DEMEventInfo!) {

        }
    }

}

