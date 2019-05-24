//
//  ViewController.swift
//  Dibbler
//
//  Created by apple on 2019/5/24.
//  Copyright © 2019 OBFirm. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var textField: NSTextField!
    
    let type = "video"
    
    var apiKey = ""
   
    var resultsArray = [NSDictionary]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func searchAction(_ sender: Any) {
//        print(textField.stringValue)
        let urlString = "https://www.googleapis.com/youtube/v3/search?part=snippet&q=\(textField.stringValue)&type=\(type)&key=\(apiKey)"

        let decodeString:String = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
//        print(decodeString)
        
        //OrginURL
//        let normalString:String = (decodeString.removingPercentEncoding)!
//        print(normalString)

        guard let url = URL(string: decodeString) else {
            print("Error: cannot create URL")
            return
        }
        let urlRequest = URLRequest(url: url)
        
        // set up the session
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        // make the request
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            // check for any errors
            guard error == nil else {
                print(error!)
                return
            }
            // make sure we got data
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            do {
                guard let resultsDic = try JSONSerialization.jsonObject(with: responseData, options: [])
                    as? [String: Any] else {
                        print("Error trying to convert data to JSON")
                        return
                }
                print("The JSON is: " + resultsDic.description)
                
                guard let resultsArray = resultsDic["items"] as? String else {
                    print("Could not get data from JSON")
                    return
                }
                print("The title is: " + resultsArray)
            } catch  {
                print("Error trying to convert data to JSON")
                return
            }
            
        }
        task.resume()
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

extension ViewController:NSTextFieldDelegate
{
    
}

