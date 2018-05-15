//
//  AlertClass.swift
//  AADImplementation
//
//  Created by Toby Thaliaparampil 2014 (N0562762) on 15/02/2018.
//  Copyright © 2018 Toby Thaliaparampil 2014 (N0562762). All rights reserved.
//

import UIKit

class AlertClass {
    
    
    init() {
        
    }
    
    private static var alertclass = AlertClass()
    
    static func showAlert(theTitle: String,theMessage: String)
    {
        let alert = UIAlertController(title: theTitle, message: theMessage, preferredStyle: .alert);
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: { (action) in alert.dismiss(animated: true, completion: nil)
            
        }))
        //DispatchQueue.main.async {
        //present(alert,animated: true,completion: nil)
        //}
    }

}
