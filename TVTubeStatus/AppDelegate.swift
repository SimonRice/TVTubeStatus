//
//  AppDelegate.swift
//  TVTubeStatus
//
//  Created by Simon Rice on 18/06/2017.
//  Copyright © 2017 Simon Rice. All rights reserved.
//

import RxTfL
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        configIf: if let url = Bundle.main.url(forResource:"Config", withExtension: "plist") {
            do {
                let data = try Data(contentsOf:url)
                let dictionary = try PropertyListSerialization.propertyList(from: data, options: [], format: nil)

                guard let configDictionary = dictionary as? [String: String],
                    let appID = configDictionary["AppID"],
                    let appKey = configDictionary["AppKey"] else {
                        break configIf
                }

                RxTfLAPI.customHeaders = [
                    "app_id": appID,
                    "api_key": appKey
                ]
            } catch {
                print(error)
            }
        }


        return true
    }
}

