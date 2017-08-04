//
//  ViewController.swift
//  DemoApp
//
//  Created by Subesh Pandey on 03/08/17.
//  Copyright © 2017 AppSierria. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var object1:NSDictionary = ["key1":10, "key2": "Hello","key3": ["I", "am"],"key4" :[
        "key5" : "Hi","key6" : 11]]//
    var object2:NSDictionary = ["key1":11,"key2" :"World","key3" : ["An", "Array"],
                                "key4" : ["key5" : "there","key6" : "y"]]
    
    var myDictionary: NSMutableDictionary = [:]
    let DictInner : NSMutableDictionary = [:]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if object1.count==object2.count {
            for (key, value) in object1
            {
                if (value is String)
                {
                    for (key1, value1) in object2
                    {
                        if ("\(key)" == "\(key1)") && value1 is String{
                            // print("\(value)\(value1)")
                            myDictionary[key1] = "\(value)\(value1)"
                        }
                    }
                }
                else if(value is NSNumber){
                    for (key1, value1) in object2
                    {
                        if ("\(key)" == "\(key1)") && value1 is NSNumber{
                            //print("\(value) + \(value1)")
                            let num = value as? Int
                            let num2 = value1 as? Int
                            myDictionary[key1] = (num! + num2!)
                            
                        }
                    }
                    
                    
                }
                    
                else if(value is NSArray){
                    for (key1, value1) in object2
                    {
                        if ("\(key)" == "\(key1)") && value1 is NSArray{
                            let array1:NSArray = value as! NSArray
                            let array2:NSArray = value1 as! NSArray
                            // print(array1.addingObjects(from: array2 as [AnyObject]))
                            myDictionary[key1] = array1.addingObjects(from: array2 as [AnyObject])
                        }
                    }
                    
                    
                }
                else if(value is NSDictionary){
                    for (key1, value1) in object2
                    {
                        if ("\(key)" == "\(key1)") && value1 is NSDictionary{
                            let Dict1:NSDictionary = value as! NSDictionary
                            let Dict2:NSDictionary = value1 as! NSDictionary
                            for (keyDict, valueDict) in Dict1
                            {
                                for (keyDict1, valueDict1) in Dict2
                                {
                                    //print(keyDict1)
                                    if ("\(keyDict)" == "\(keyDict1)"){
                                        if valueDict1 is NSString && valueDict is String {
                                            DictInner[keyDict1] = "\(valueDict)\(valueDict1)"
                                            // print(DictInner)
                                            myDictionary[key1] = DictInner
                                            
                                        }
                                        else if valueDict1 is NSNumber && valueDict is NSNumber {
                                            let num = valueDict as? Int
                                            let num2 = valueDict1 as? Int
                                            DictInner[keyDict1] = (num! + num2!)
                                            myDictionary[key1] = DictInner
                                        }
                                        else if valueDict1 is NSArray && valueDict is NSArray {
                                            DictInner[keyDict1] = "\(valueDict)\(valueDict1)"
                                            //  print(DictInner)
                                            myDictionary[key1] = DictInner
                                        }
                                        
                                    }
                                }
                            }
                            
                        }
                    }
                    
                }
            }
            print(myDictionary)
            
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

