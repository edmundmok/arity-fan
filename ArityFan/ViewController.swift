//
//  ViewController.swift
//  ArityFan
//
//  Created by Edmund Mok on 9/17/17.
//  Copyright © 2017 Edmund Mok. All rights reserved.
//

import UIKit
import CoreEngine
import BAFluidView

class ViewController: UIViewController {

    @IBOutlet var startTrip: UIButton!
    @IBOutlet var amountSpilt: UILabel!
    @IBOutlet var water: BAFluidView!

    fileprivate var amountRemaining: Double = 100.0

    private var sharedEngine: DEMDrivingEngineManager!
    private var engineConfiguration: DEMConfiguration!

    fileprivate let accelerationPenalty: Double = 2
    fileprivate let brakePenalty: Double = 2
    fileprivate let speedingPenalty: Double = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        water.fillDuration = 0
        water.fillRepeatCount = 0
        water.fillAutoReverse = false
        water.fill(to: 0.8)
        water.stopAnimation()
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

    @IBAction func onStartTrip(_ sender: UIButton) {
        if sender.titleLabel?.text == "Start" {
            sender.setTitle("End", for: .normal)
        } else {
            water.fill(to: 9)
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

    fileprivate func updateView() {

    }

}

extension ViewController: DEMDrivingEngineDelegate {

    func didStartTripRecording(_ drivingEngine: DEMDrivingEngineManager!) -> String! {
        return ""
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
        amountRemaining -= speedingPenalty * overSpeedingEvent.speedChange
        updateView()
    }

    func drivingEngine(_ drivingEngine: DEMDrivingEngineManager!, didDetectEndOfSpeeding overSpeedingEvent: DEMEventInfo!) {
        amountRemaining -= speedingPenalty * overSpeedingEvent.speedChange
        updateView()
    }

    func drivingEngine(_ drivingEngine: DEMDrivingEngineManager!, didDetectAcceleration accelerationEvent: DEMEventInfo!) {
        amountRemaining -= accelerationPenalty * accelerationEvent.speedChange
        updateView()
    }

    func drivingEngine(_ drivingEngine: DEMDrivingEngineManager!, didDetectBraking brakingEvent: DEMEventInfo!) {
        amountRemaining -= brakePenalty * brakingEvent.speedChange
        updateView()
    }
}

