//
//  loginViewController.swift
//  usuiiApp
//
//  Created by usuii on 2016/07/17.
//  Copyright © 2016年 usuii. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBAction func unwindToModalViewController(segue: UIStoryboardSegue) {
        
    }
    
    // テキストフィールドに名前
    @IBOutlet weak var textfield: UITextField!
    
    func login() {
        // テキストフィールドからFitbitIDを取得
        let fitbitid = textfield.text
        print("fitbitid")
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setObject(fitbitid, forKey: "fitbitid")
        userDefaults.synchronize()
        
        // 画面遷移
        let storyboard: UIStoryboard = self.storyboard!
        let homeView = storyboard.instantiateViewControllerWithIdentifier("home") as! ViewController
        self.presentViewController(homeView, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view, typically from a nib.
        super.viewDidLoad()
        textfield.delegate = self
    }
    
    func textFieldShouldReturn(textfield: UITextField) -> Bool {
        textfield.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if(textfield.isFirstResponder()) {
            textfield.resignFirstResponder()
        }
    }

    @IBAction func login(sender: AnyObject) {
        login()
    }
    
    override func didReceiveMemoryWarning() {
        // Dispose of any resources that can be recreated.
        super.didReceiveMemoryWarning()
    }
    
}
