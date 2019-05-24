//
//  ViewController.swift
//  TableView
//
//  Created by apple on 2019/5/23.
//  Copyright © 2019 OBFirm. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var tableView: NSTableView!
    
    var datas = [NSDictionary]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateData()
        // Do any additional setup after loading the view.
    }
    
    func updateData(){
        self.datas = [ ["name":"json","address":"USA","gender":"male","married":(1)],["name":"Daba","address":"Russia","gender":"female","married":(1)]]
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}

extension ViewController: NSTableViewDataSource
{
    func numberOfRows(in tableView: NSTableView) -> Int {

        return self.datas.count
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        
        let data = self.datas[row]
        
        let key = tableColumn?.identifier
        
        let value = data[key!]
        
        return value
    }
}


