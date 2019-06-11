//
//  ViewController.swift
//  Dibbler
//
//  Created by apple on 2019/5/24.
//  Copyright © 2019 OBFirm. All rights reserved.
//

import Cocoa
import AVKit
import WebKit

class ViewController: NSViewController,WKUIDelegate{

    @IBOutlet weak var textField: NSTextField!
    
    @IBOutlet weak var playerView: AVPlayerView!
    
    let type = "video"
    
    var apiKey = ""
   
    let serverURI = "https://unity-dev-youtube.herokuapp.com/api/info?url=https://www.youtube.com/watch?v="
    
    let formatURI = "&format=best[ext=mp4]/mp4&flatten=true"
    
    var resultCount:Int = ApiData.URLSetting.maxResults
    var resultOrder:String = ApiData.URLSetting.order.relevance.rawValue
    
    var resultsArray = Dictionary<String, AnyObject>()
    
    var str = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = getWebHTML(htmlString: "Ko")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func searchAction(_ sender: Any) {
        sentSearchString()
    }
    
   
    
    func sentSearchString()
    {
        let urlString = "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=\(resultCount)&order=\(resultOrder)&q=\(textField.stringValue)&type=\(type)&key=\(apiKey)"
        
        let decodeString:String = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
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
                    as? Dictionary<String, AnyObject> else {
                        print("Error trying to convert data to JSON")
                        return
                }
                //                let items:String = ApiData.YoutubeKey.items.rawValue
                let items: Array<Dictionary<String, AnyObject>> = resultsDic["items"] as! Array<Dictionary<String, AnyObject>>
                
                print("The JSON is: https://www.youtube.com/watch?v=\((items[0]["id"]!["videoId"]!)!)")
                
                /////////
                let urlString = String((self.serverURI + "\((items[0]["id"]!["videoId"]!)!)" + self.formatURI))
                
                print("urlString:\(urlString)")
                
                let decodeString:String = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
                
                guard let url = URL(string: decodeString) else {
                    print("Error: cannot create URL")
                    return
                }
                let urlRequest = URLRequest(url: url)
                
                // set up the session
                let config = URLSessionConfiguration.default
                let session = URLSession(configuration: config)
                
                let task = session.dataTask(with: urlRequest) {
                    (data, response, error) in
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
                            as? Dictionary<String, AnyObject> else {
                                print("Error trying to convert data to JSON")
                                return
                        }
                        
                        let aUrl:Array<Dictionary<String,AnyObject>> = resultsDic["videos"]! as! Array<Dictionary<String,AnyObject>>
                        
                        
                        print(":\((aUrl[0]["url"])!)")
                        self.str = (aUrl[0]["url"])! as! String
                        
                    }
                    catch  {
                        print("Error trying to convert data to JSON")
                        return
                    }
                    
                    print("URL:\(self.str)")
                    let playerURL = URL(string: self.str)
                    let player = AVPlayer(url: playerURL!)
                    self.playerView.player = player
                    player.play()
                }
                task.resume()
                
                
            } catch  {
                print("Error trying to convert data to JSON")
                return
            }
            
        }
        task.resume()
        
        
    }
    
    func getWebHTML(htmlString: String) -> String
    {
        let webURLString = htmlString
        guard let webURL = URL(string: webURLString) else {
            print("Error: \(webURLString) doesn't seem to be a valid URL")
            return "Error"
        }
        
        do {
            let webHTMLString = try String(contentsOf: webURL, encoding: .ascii)
            
//            let a:String = webHTMLString.slice(from: "loaderUrl", to: "quality=medium")!
//            let b:String = webHTMLString.slice(from: "url=", to: "\\u0026")!

//            let decodeString:String = b.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
//            let normalString:String = (b.removingPercentEncoding)!
            
//            ViewController.str = normalString + "yt8"
//            print("HTML : \(decodeString)")

            return webHTMLString
        } catch let error {
            print("Error: \(error)")
        }
        return "Error"
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

extension ViewController:NSTextFieldDelegate {
    
    override func keyDown(with event: NSEvent) {
        if event.keyCode == 36
        {
            sentSearchString()
            print(":Enter")
            print(":\(event.keyCode)")
        }
    }
}

extension String {
    func slice(from: String, to: String) -> String? {
        return (range(of: from)?.upperBound).flatMap { substringFrom in
            (range(of: to, range: substringFrom..<endIndex)?.lowerBound).map { substringTo in
                String(self[substringFrom..<substringTo])
            }
        }
    }
    
    
}
