//
//  MorningViewController.swift
//  usuiiApp
//
//  Created by usuii on 2016/07/17.
//  Copyright © 2016年 usuii. All rights reserved.
//

import Foundation
import UIKit

class MorningViewController: UIViewController {
    
    @IBAction func unwindToModalViewController(segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func button1(sender: AnyObject) {
        morning(1)
    }
    @IBAction func button2(sender: AnyObject) {
        morning(2)
    }
    @IBAction func button3(sender: AnyObject) {
        morning(3)
    }
    @IBAction func button4(sender: AnyObject) {
        morning(4)
    }
    @IBAction func button5(sender: AnyObject) {
        morning(5)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func morning(num: Int) {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let fitbitid = userDefaults.objectForKey("fitbitid")!
        print(fitbitid)
        
        let today = NSDate()
        let format = NSDateFormatter()
        format.locale = NSLocale(localeIdentifier: "ja_JP")
        format.dateFormat = "yyyy/MM/dd"
        let date = format.stringFromDate(today)
        print(date)
        
        let morning = ("fitbitid=\(fitbitid)&date=\(date)&time=morning&point=\(num).dataUsingEncoding").dataUsingEncoding(NSUTF8StringEncoding)!
        
        let url = NSURL(string:"http://133.27.171.211/~usuii/fitbit/moodData.php")
        print(url)
        let request = NSMutableURLRequest(URL: url!)
        print(request)
        request.HTTPMethod = "GET"
        request.HTTPBody = morning
        
        let data = try? NSURLConnection.sendSynchronousRequest(request, returningResponse: nil)
        let strData = NSString(data: data!, encoding: NSUTF8StringEncoding)
        print(strData)
        
        //let nextView: AnyObject = self.storyboard!.instantiateViewControllerWithIdentifier("done")
        //self.presentViewController(nextView as! UIViewController, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}