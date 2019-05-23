//
//  ViewController.swift
//  LifeCycle
//
//  Created by apple on 2019/5/23.
//  Copyright © 2019 OBFirm. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    var modalWindow: NSWindow!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let frame = CGRect (x: 0, y: 0, width: 400, height: 280)
        let style : NSWindow.StyleMask = [.titled,.closable,.resizable]
        modalWindow = NSWindow (contentRect: frame, styleMask: style, backing: .buffered, defer: false)
        modalWindow.title = "Locked Window"
        modalWindow.makeKeyAndOrderFront(self)
        modalWindow.center()
        // Do any additional setup after loading the view.
        
        let btnFrame = CGRect (x: 10, y: 10, width: 120, height: 24)
        let button = NSButton (frame: btnFrame)
        button.bezelStyle = .rounded
        button.title = "WindowClose"
        button.target = self
        button.action = #selector(windowsClose (_:))
        self.modalWindow.contentView?.addSubview(button)
    }

    @IBAction func showModalWindow(_ sender: Any) {
        print("showModalWindow")
        NSApplication.shared.runModal(for: modalWindow)
    }
    @objc func windowsClose(_ sender: NSButton) {
        print("windowsClose")
        NSApplication.shared.stopModal()
    }
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

