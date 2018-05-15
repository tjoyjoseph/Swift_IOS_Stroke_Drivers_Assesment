//
//  AuthenticationDetails.swift
//  AADImplementation
//
//  Created by Toby Thaliaparampil 2014 (N0562762) on 19/02/2018.
//  Copyright © 2018 Toby Thaliaparampil 2014 (N0562762). All rights reserved.
//

import UIKit

class InterfaceCommunication{
    
    static var patientID = ""
    static var adminID = ""
    static var adminPassword = ""
    
    static var link = ""
    
    init(){
        
    }
    
    private static var interfaceCommunication = InterfaceCommunication()
    
//    static func validateLogin(username:String, password:String)->String{
//        var message = ""
//        link = "http://192.168.43.126:8080/SDSARESTInterface/webresources/validateAdministrator?adminID=\(username)&password=\(password)"
//        var loginMessage = "";
//
//        if let url = URL(string: link) {
//                do {
//                    let loginMessage = try String(contentsOf: url)
//                    //showAlert(theTitle: "Message", theMessage: contents)
//                    if let parser = XMLParser(contentsOf: url)
//                    {
//                        parser.delegate = self
//                        parser.parse()
//                    }
//                } catch {
//                    // contents could not be loaded
//                    //showAlert(theTitle: "Message", theMessage: "contents could not be loaded")
//
//                }
//
//        } else
//        {
//            loginMessage = "error"
//        }
//        return loginMessage
//
//
//}
}
