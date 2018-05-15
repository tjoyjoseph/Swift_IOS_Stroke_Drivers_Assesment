//
//  ViewController.swift
//  SDSAmainMenu
//
//  Created by Vahid Rostampour 2011 (N0372677) on 07/02/2018.
//  Copyright © 2018 Vahid Rostampour (N0372677). All rights reserved.
//

import UIKit

class ViewController: UIViewController, XMLParserDelegate {
    
    var thisName = "";
    var loginMessage = "";

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    ///////// Start of code
    
    @IBOutlet weak var EnterAdministratorID: UITextField!
    
    @IBOutlet weak var EnterAdministratorPassword: UITextField!
    
    func showAlert(theTitle: String,theMessage: String)
    {
        let alert = UIAlertController(title: theTitle, message: theMessage, preferredStyle: .alert);
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: { (action) in alert.dismiss(animated: true, completion: nil)
            
        }))
        self.present(alert,animated: true,completion: nil)
    }
    
    @IBAction func LogInButton(_ sender: UIButton) {
        
        var adminid = ""
        var password = ""
        adminid=EnterAdministratorID.text!
        password=EnterAdministratorPassword.text!
        let link = "http://192.168.43.126:8080/SDSARESTInterface/webresources/validateAdministrator?adminID=\(adminid)&password=\(password)"
        print (link)
        if let url = URL(string: link) {
            do {
                //let contents = try String(contentsOf: url)
                //showAlert(theTitle: "Message", theMessage: contents)
                if let parser = XMLParser(contentsOf: url)
                {
                    parser.delegate = self
                    parser.parse()
                }
            } catch {
                // contents could not be loaded
                //showAlert(theTitle: "Message", theMessage: "contents could not be loaded")
                loginMessage = "contents could not be loaded"
            }
        } else {
            // the URL was bad!
            //showAlert(theTitle: "Message", theMessage: "The URL was bad!")
            loginMessage = "The URL was bad!"
        }
        if loginMessage == "Valid"
        {
            InterfaceCommunication.adminID = adminid
            InterfaceCommunication.adminPassword = password
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "DisplayPatientsView")
        self.present(newViewController, animated: true, completion: nil)
        } else
        {
            showAlert(theTitle: "Login Invalid", theMessage: loginMessage)
        }
        
    
    }
    
    ////XML PARSER DELEGATE
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        thisName = elementName
        
        if thisName == "Message"
        {
            loginMessage = ""
        }
    }
    
    
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        let data = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        if data.count != 0
        {
            print(data)
            loginMessage = data
//            switch thisName
//            {
//                case
//            }
        }
    }
    
//    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
//        if thisName == "Message"
//        {
//
//        }
//    }
    
    
    
    
    
}

