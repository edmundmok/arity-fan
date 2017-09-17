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
        <#code#>
    }

    func didStartTripRecording(with tripInfo: DEMTripInfo!) {
        <#code#>
    }

    func didStopTripRecording(_ drivingEngine: DEMDrivingEngineManager!) {
        <#code#>
    }

    func drivingEngine(_ drivingEngine: DEMDrivingEngineManager!, didSaveTripInformation trip: DEMTripInfo!, driveStatus driveCompletionFlag: Bool) {
        <#code#>
    }

    func didStopInvalidTripRecording(_ drivingEngine: DEMDrivingEngineManager!) {
        <#code#>
    }

    func drivingEngine(_ drivingEngine: DEMDrivingEngineManager!, didDetectStartOfSpeeding overSpeedingEvent: DEMEventInfo!) {
        <#code#>
    }

    func drivingEngine(_ drivingEngine: DEMDrivingEngineManager!, didDetectEndOfSpeeding overSpeedingEvent: DEMEventInfo!) {
        <#code#>
    }

    func drivingEngine(_ drivingEngine: DEMDrivingEngineManager!, didDetectAcceleration accelerationEvent: DEMEventInfo!) {
        <#code#>
    }

    func drivingEngine(_ drivingEngine: DEMDrivingEngineManager!, didDetectBraking brakingEvent: DEMEventInfo!) {
        <#code#>
    }

}

