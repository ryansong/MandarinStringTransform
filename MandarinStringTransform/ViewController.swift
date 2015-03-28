//
//  ViewController.swift
//  MandarinStringTransform
//
//  Created by Song Xiaoming on 3/29/15.
//  Copyright (c) 2015 Song Xiaoming. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet weak var field: UITextField!
    @IBOutlet weak var result: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        field.delegate = self
        result.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
// MARK:- UITextFieldDelegate
    
    func textFieldDidEndEditing(textField: UITextField) {
     
        var text = textField.text as CFString;
        var string = CFStringCreateMutableCopy(kCFAllocatorDefault, 0, text)
        
        CFStringTransform(string, nil, kCFStringTransformMandarinLatin, 0);

        CFStringTransform(string, nil, kCFStringTransformStripDiacritics, 0);
        
        result.text = string;
        
    }
    
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
}

