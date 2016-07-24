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
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func night(num: Int) {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let fitbitid = userDefaults.objectForKey("fitbitid")!
        
        let today = NSDate()
        let format = NSDateFormatter()
        format.locale = NSLocale(localeIdentifier: "ja_JP")
        format.dateFormat = "yyyy/MM/dd"
        let date = format.stringFromDate(today)
        
        let night = ("fitbitid=\(fitbitid)&date=\(date)&time=night&point=\(num).dataUsingEncoding").dataUsingEncoding(NSUTF8StringEncoding)!
        
        let url = NSURL(string:"http://133.27.171.211/~usuii/fitbit/moodData.php")
        let request = NSMutableURLRequest(URL: url!)
        
        request.HTTPMethod = "GET"
        request.HTTPBody = night
        
        let data = try? NSURLConnection.sendSynchronousRequest(request, returningResponse: nil)
        let strData = NSString(data: data!, encoding: NSUTF8StringEncoding)
        print(strData)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}