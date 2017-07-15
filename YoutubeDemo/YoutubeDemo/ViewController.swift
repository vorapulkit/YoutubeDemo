//
//  ViewController.swift
//  YoutubeDemo
//
//  Created by Pulkit on 6/21/17.
//  Copyright © 2017 Pulkeet. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    
    let apiKey = "AIzaSyAwsy0oLudwq-YQDB3wWsWDRbCOpjygt2A"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
//        getVideoDetails(videoId: "AKiiekaEHhI")
//        getCommentList(videoId: "AKiiekaEHhI")
        getVideoList(videoId: "AKiiekaEHhI")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK:
    //MARK: Get Video Details
    func getVideoDetails(videoId : String){
        // Set up your URL
//        let youtubeApi = "https://www.googleapis.com/youtube/v3/videos?part=contentDetails%2C+snippet%2C+statistics&id=AKiiekaEHhI&key=AIzaSyAwsy0oLudwq-YQDB3wWsWDRbCOpjygt2A"
        
        let youtubeApi = "https://www.googleapis.com/youtube/v3/videos?part=contentDetails%2C+snippet%2C+statistics&id=\(videoId)&key=\(apiKey)"
        
        
        
        let url = URL(string:youtubeApi)
        
        // Create your request
        let task = URLSession.shared.dataTask(with: url! as URL, completionHandler: { (data, response, error) -> Void in
            do {
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as? [String : AnyObject] {
                    
                    print("Response from YouTube: \(jsonResult)")
                }
            }
            catch {
                print("json error: \(error)")
            }
            
        })
        
        // Start the request
        task.resume()
    }
    
    
    //MARK:
    //MARK: Get Comment List
    func getCommentList(videoId : String){
        // Set up your URL
        let youtubeApi = "https://www.googleapis.com/youtube/v3/commentThreads?part=snippet&videoId=\(videoId)&key=\(apiKey)"

        let url = URL(string:youtubeApi)
        
        // Create your request
        let task = URLSession.shared.dataTask(with: url! as URL, completionHandler: { (data, response, error) -> Void in
            do {
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as? [String : AnyObject] {
                    
                    print("Response from YouTube: \(jsonResult)")
                }
            }
            catch {
                print("json error: \(error)")
            }
            
        })
        
        // Start the request
        task.resume()
    }
    
    
    //MARK:
    //MARK: Get Video List (Multiple Ids required)
    func getVideoList(videoId : String){
        // Set up your URL
        
        let videoIdOne = videoId;
        let videoIdTwo = videoId;

        let youtubeApi = "https://www.googleapis.com/youtube/v3/videos?part=contentDetails%2C+snippet%2C+statistics&id=\(videoIdOne),\((videoIdTwo))&key=\(apiKey)"
        

        
        let url = URL(string:youtubeApi)
        
        // Create your request
        let task = URLSession.shared.dataTask(with: url! as URL, completionHandler: { (data, response, error) -> Void in
            do {
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as? [String : AnyObject] {
                    
                    print("Response from YouTube: \(jsonResult)")
                }
            }
            catch {
                print("json error: \(error)")
            }
            
        })
        
        // Start the request
        task.resume()
    }
    

}

