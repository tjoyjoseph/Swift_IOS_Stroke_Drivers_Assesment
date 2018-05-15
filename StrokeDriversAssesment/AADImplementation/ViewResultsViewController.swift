//
//  ViewResultsViewController.swift
//  AADImplementation
//
//  Created by Toby Thaliaparampil 2014 (N0562762) on 15/02/2018.
//  Copyright © 2018 Toby Thaliaparampil 2014 (N0562762). All rights reserved.
//

import UIKit

var currentPatient=Patient()

class ViewResultsViewController: UIViewController {
    
    @IBOutlet weak var txtPatientID: UITextView!
    
    @IBOutlet weak var txtGameState: UITextView!
    
    @IBOutlet weak var lblGamesToComplete: UITextView!
    @IBOutlet weak var txtGamesToComplete: UITextView!
    
    @IBOutlet weak var lblPass: UITextView!
    @IBOutlet weak var txtPass: UITextView!
    
    @IBOutlet weak var lblFail: UITextView!
    @IBOutlet weak var txtFail: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let patientID = InterfaceCommunication.patientID.capitalized
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
                    print(jsonResult["GameState"]!)
                    currentPatient.patientID = patientID
                    currentPatient.gameState =  jsonResult["GameState"]! as! String
                    //self.txtGameState.text = gameState
                    if currentPatient.gameState == "Complete"
                    {
                        var tempPass = String(describing: jsonResult["Pass"]!)
                        currentPatient.passValue = Double(tempPass)!
                        var tempFail = String(describing: jsonResult["Fail"]!)
                        currentPatient.failvalue = Double(tempFail)!
                    } else
                    {
                        currentPatient.gameToComplete = jsonResult["ToComplete"]! as! String
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
            
            DispatchQueue.main.async {
                self.txtPatientID.text = currentPatient.patientID
                self.txtGameState.text = currentPatient.gameState
                self.txtGamesToComplete.text = currentPatient.gameToComplete
                self.txtPass.text = String(currentPatient.passValue)
                self.txtFail.text = String(currentPatient.failvalue)
            }
            
            }.resume()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func PressBtnGoToGame(_ sender: Any) {
        if currentPatient.gameState == "ToStart"
        {
            let storyBoard: UIStoryboard = UIStoryboard(name: "dotcancellation", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "DotCancellationView")
            self.present(newViewController, animated: true, completion: nil)
            
        }else{
        
        let allGames = currentPatient.gameToComplete.characters.split{$0 == ","}.map(String.init)
        
        switch allGames[allGames.count-1] {
        case "pathform":
            
            let storyBoard: UIStoryboard = try UIStoryboard(name: "pathforming", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "PathFormingView1")
            self.present(newViewController, animated: true, completion: nil)
            
        case "roadSignRecognition":
            let storyBoard: UIStoryboard = try UIStoryboard(name: "roadsignrecognition", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "RoadSignRecognitionView")
            self.present(newViewController, animated: true, completion: nil)
        case "squareMatrices":
            let storyBoard: UIStoryboard = UIStoryboard(name: "direction", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "DirectionView")
            self.present(newViewController, animated: true, completion: nil)
        case "compass":
            let storyBoard: UIStoryboard = try UIStoryboard(name: "compass", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "CompassView")
            self.present(newViewController, animated: true, completion: nil)
        
        default:
            break;
        }
        }
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
