//
//  AppDelegate.swift
//  LifeCycle
//
//  Created by apple on 2019/5/23.
//  Copyright © 2019 OBFirm. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var mainWindow: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        print("applicationDidFinishLaunching")
        
        mainWindow = NSApplication.shared.windows[0] 
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
        print("applicationWillTerminate")
    }
}

