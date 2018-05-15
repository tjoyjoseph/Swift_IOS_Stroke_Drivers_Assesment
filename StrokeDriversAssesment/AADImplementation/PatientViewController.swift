//
//  PatientViewController.swift
//  SDSAmainMenu
//
//  Created by Vahid Rostampour 2011 (N0372677) on 08/02/2018.
//  Copyright © 2018 Vahid Rostampour (N0372677). All rights reserved.
//

import UIKit

class PatientViewController: UIViewController, XMLParserDelegate, UITableViewDelegate, UITableViewDataSource {
    
    var tableViewDataSource = [Patient]()

    var element = "";
    var patientID = ""
    var patientCondition = "";
    var errorMessage = ""
    
    @IBOutlet weak var tblVwPatients: UITableView!
    @IBOutlet weak var EnterPatientID: UITextField!
    func showAlert(theTitle: String,theMessage: String)
    {
        let alert = UIAlertController(title: theTitle, message: theMessage, preferredStyle: .alert);
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: { (action) in alert.dismiss(animated: true, completion: nil)
            
        }))
        self.present(alert,animated: true,completion: nil)
    }
    
    @IBAction func PressBtnViewResults(_ sender: Any) {
        if (InterfaceCommunication.patientID != ""){
        ////// View Results Page
        do {
            let storyBoard: UIStoryboard = try UIStoryboard(name: "viewresults", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "ViewResultsView")
            self.present(newViewController, animated: true, completion: nil)
        } catch let error  {
            print(error.localizedDescription)
        }
        }else{
            showAlert(theTitle: "Choose Patient", theMessage: "Please Choose a patient ID")
        }
    }
    
    
    @IBAction func PressBtnCreatePatient(_ sender: Any) {
        
        let alert = UIAlertController(title: "Create Patient", message: "Please enter the patient ID and the condition (Stroke / Dementia)", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.text = ""
        }
        alert.addTextField { (textField) in
            textField.text = ""
        }
       
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let patientID = alert!.textFields![0].text
            let conditon = alert!.textFields![1].text

            //print(patientID!.capitalized)
            //print(conditon!)
            
            guard let url = URL(string: "http://192.168.43.126:8080/SDSARESTInterface/webresources/createNewPatient?patientID=\(patientID!.capitalized)&condition=\(conditon!.capitalized)") else {return}
            var request = URLRequest(url:url)
            request.httpMethod = "PUT"
            request.setValue("application/xml", forHTTPHeaderField: "Accept")

            
            let session = URLSession.shared
            session.dataTask(with: request) { (data, response, error) in
                var returnMessage = ""
                var output = "Patient has been successfully created, and have been selected"
                returnMessage = String(data: data!, encoding:String.Encoding(rawValue: String.Encoding.utf8.rawValue))!
                print (returnMessage)
                
                if returnMessage.range(of: "<Exception>") != nil {
                    output = "The patient id must not already exists. The condition must be either Stroke or Dementia"
                } else {
                    InterfaceCommunication.patientID = patientID!.capitalized
                    
                }

                self.showAlert(theTitle: "Message", theMessage: output)

            }.resume()

        }))
        
        self.present(alert, animated: true, completion: nil)
        self.refreshTable()
    }
    
    
    func refreshTable()
    {
        DispatchQueue.main.async {
            self.tblVwPatients.dataSource = self
            self.tblVwPatients.delegate = self
        
        
        
        let link = "http://192.168.43.126:8080/SDSARESTInterface/webresources/viewAllPatients?adminID=\(InterfaceCommunication.adminID)&password=\(InterfaceCommunication.adminPassword)"
        print (link)
        if let url = URL(string: link) {
            do {
                if let parser = XMLParser(contentsOf: url)
                {
                    parser.delegate = self
                    parser.parse()
                }
            } catch {
                print("contents could not be loaded")
            }
        } else {
            print("The URL was bad!")
        }
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshTable()
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    
    //Patient View Controller Start of Code
    
    

    
    
    
    
    @IBAction func SearchPatientButton(_ sender: UIButton) {
        
        var  patientID = ""
        patientID = String(EnterPatientID.text!).capitalized
        print (patientID)
        
        let adminID = InterfaceCommunication.adminID
        let adminPassword = InterfaceCommunication.adminPassword
        
    
        
        guard let url = URL(string: "http://192.168.43.126:8080/SDSARESTInterface/webresources/getPatientGameState?patientID=\(patientID)&adminID=\(adminID)&password=\(adminPassword)") else {return}
        var request = URLRequest(url:url)
        request.httpMethod = "GET"
        //request.setValue("application/xml", forHTTPHeaderField: "Accept")
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            var returnMessage = ""
            //var output = "Patient has been successfully created"
            returnMessage = String(data: data!, encoding:String.Encoding(rawValue: String.Encoding.utf8.rawValue))!
            //print (returnMessage)
            
            if let _data = data
            {
                do {
                    var jsonResult: NSDictionary
                    try jsonResult = JSONSerialization.jsonObject(with: _data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                    print(jsonResult["Message"])
                    
                    DispatchQueue.main.async {
                        if (jsonResult["Message"] == nil)
                        {
                            self.showAlert(theTitle: "", theMessage: "Patient ID \(patientID) exists in the system and have been selected for you")
                            InterfaceCommunication.patientID = patientID
                        } else {
                            self.showAlert(theTitle: "", theMessage: "Patient ID \(patientID) does not exists in the system")
                        }
                    }
                    
                }
                catch {
                    // handle error
                }
            }
            else
            {
                // print("Error: no data for request \(urlPath)")
            }
            
            
            }.resume()

        
    }
    
    
    
    
    @IBAction func StartButton(_ sender: UIButton) {
        if (InterfaceCommunication.patientID != ""){
        //SEAN HERE
        //Start button will either start from begining or start from a patients last completed test which has paused
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "dotcancellation", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "DotCancellationView")
        self.present(newViewController, animated: true, completion: nil)
        }else{
            showAlert(theTitle: "Choose Patient", theMessage: "Please Choose a patient ID")
        }
        
    }
    ///// Table View Delegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let patientCell = tblVwPatients.dequeueReusableCell(withIdentifier: "reuseCell", for: indexPath)
        let lblPatientID = patientCell.viewWithTag(11) as! UILabel
        let lblPatientCondition = patientCell.viewWithTag(12) as! UILabel
        
        
        lblPatientID.text = tableViewDataSource[indexPath.row].patientID
        lblPatientCondition.text = tableViewDataSource[indexPath.row].condition
        
        
        return patientCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let patientCell = tblVwPatients.cellForRow(at: indexPath)
        let lblPatientID = patientCell?.viewWithTag(11) as! UILabel
        
        print(lblPatientID.text!)
        InterfaceCommunication.patientID = lblPatientID.text!
        
        showAlert(theTitle: "Patient Selected", theMessage: "Patient ID: \(InterfaceCommunication.patientID)")
    }
    
    
    
    
    ////XML PARSER DELEGATE
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        element = elementName
        
        if elementName == "Patient"
        {
            var patientID = ""
            var patientCondition = "";
        } else if element == "Exception"
        {
            
        }
    }
    
    
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        let data = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        if data.count != 0
        {
            //print(data)
            
            //print (element)
            switch element{
            case "ID":
                patientID = data
                break;
            case "Condition":
                patientCondition = data
                break;
            default:
                errorMessage = data
                break;
            }
        }
    }
    
        func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
            if elementName == "Patient"
            {
                var thisPatient = Patient()
                thisPatient.patientID = patientID
                thisPatient.condition = patientCondition
                print(thisPatient)
                tableViewDataSource.append(thisPatient)
            }
        }
    
    

}
