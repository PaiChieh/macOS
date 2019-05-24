//
//  AppDelegate.swift
//  Dibbler
//
//  Created by apple on 2019/5/24.
//  Copyright © 2019 OBFirm. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var apiKey = "AIzaSyAkyilvy068AG7LtIDYmO3NqxWFxea9u5s"
    
    var desiredChannelsArray = ["Apple", "Google", "Microsoft"]
    
    var channelIndex = 0
    
    var channelsDataArray: Array<Dictionary<NSObject, AnyObject>> = []

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

