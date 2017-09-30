//
//  ViewController.swift
//  jsonStructure
//
//  Created by Aminjoni Abdullozoda on 9/30/17.
//  Copyright © 2017 Aminjoni Abdullozoda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string:"http://api.fixer.io/latest")
        
        let task  = URLSession.shared.dataTask(with: url!) { (data, respoce, error ) in
            
            if error != nil
            {
                print("Something ERROR!")
            }
            else
            {
                if let info = data
                {
                    do
                    {
                        let myJSON = try JSONSerialization.jsonObject(with: info, options: JSONSerialization.ReadingOptions.mutableLeaves) as AnyObject
                        
                       if let values = myJSON["rates"] as? NSDictionary
                       {
                       // print(values);
                        
                        print(values["USD"]!);
                       }
                    }
                    catch {}
                }
            }
            
        }; task.resume()
        
    }


}

