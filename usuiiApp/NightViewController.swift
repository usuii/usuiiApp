//
//  NightViewController.swift
//  usuiiApp
//
//  Created by usuii on 2016/07/17.
//  Copyright © 2016年 usuii. All rights reserved.
//

import Foundation
import UIKit

class NightViewController: UIViewController {
    
    @IBAction func unwindToModalViewController(segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func button1(sender: AnyObject) {
        night(1)
    }
    @IBAction func button2(sender: AnyObject) {
        night(2)
    }
    @IBAction func button3(sender: AnyObject) {
        night(3)
    }
    @IBAction func button4(sender: AnyObject) {
        night(4)
    }
    @IBAction func button5(sender: AnyObject) {
        night(5)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func night(num: Int) {
        // パラメータを指定
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let fitbitid = userDefaults.objectForKey("fitbitid")
        print(fitbitid)
        
        let today = NSDate()
        let format = NSDateFormatter()
        format.locale = NSLocale(localeIdentifier: "ja_JP")
        format.dateFormat = "yyyy/MM/dd"
        let date = format.stringFromDate(today)
        print(date)
        
        print(num)

        let night = "fitbitid=\(fitbitid!)&date=\(date)&time=night&point=\(num)"
        print(night)
        
        // HTTP通信
        let url = NSURL(string:"http://133.27.171.211/~usuii/fitbit/moodData.php?" + night)
        print(url)
        let request = NSMutableURLRequest(URL: url!)
        print(request)
        request.HTTPMethod = "GET"
        _ = try? NSURLConnection.sendSynchronousRequest(request, returningResponse: nil)
        
        // 画面遷移
        let doneView: AnyObject = self.storyboard!.instantiateViewControllerWithIdentifier("done")
        self.presentViewController(doneView as! UIViewController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}