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
    
    @IBOutlet weak var textfield: UITextField!
    
    func login() {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let fitbitid = textfield.text
        userDefaults.setObject(fitbitid, forKey: "fitbitid")
        userDefaults.synchronize()
    }
    
    // Do any additional setup after loading the view, typically from a nib.
    override func viewDidLoad() {
        super.viewDidLoad()
        textfield.delegate = self
        }
    
    func textFieldShouldReturn(textfield: UITextField) -> Bool {
        textfield.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if(textfield.isFirstResponder()){
            textfield.resignFirstResponder()
        }
    }
    
    @IBAction func login(sender: AnyObject) {
        login()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
