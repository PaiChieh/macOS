//
//  ViewController.swift
//  CoreDataApp
//
//  Created by apple on 2019/6/11.
//  Copyright © 2019 OBFirm. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addChannelData()
        fetchCoreData()
        cleanCoreData()
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    func addChannelData() {

        let context = appDelegate.managedObjectContext
        
        let channel = NSEntityDescription.insertNewObject(forEntityName: "Channel", into: context) as! Channel
        
        channel.title = "Kouhei"
        channel.viewCount = 1
        channel.subscriberCount = 1
        
        do {
            try context.save()
            print(" Save succeed")
        } catch let error {
            print(" Context can't save!, Error:\(error)")
        }
    }
    
    func addVideoData() {
        
    }
    
    func fetchCoreData() {
        let context = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult> (entityName: "Channel")
        
        do {
            let list = try context.fetch(fetchRequest)
            
            print(" Searching...")

            for data in list as! [Channel] {
                
                print(data.title!)
            }
        } catch let error {
            print(" Context can't fetch!, Error:\(error)")
        }
        
        
    }
    
    func cleanCoreData() {
        let context = appDelegate.managedObjectContext

        let fetchRequest = NSFetchRequest<NSFetchRequestResult> (entityName: "Channel")
        
        do {
            let list = try context.fetch(fetchRequest)
            
            print(" Deleting...")

            for data in list as! [Channel] {
                
                context.delete(data)
            }
            try context.save()
            
        } catch let error {
            print(" Delete all data, Error:\(error)")
        }
    }
    
}

extension ViewController {
    var appDelegate: AppDelegate {
        return NSApplication.shared.delegate as! AppDelegate
    }
}

