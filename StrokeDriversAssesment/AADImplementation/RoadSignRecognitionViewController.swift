//
//  RoadSignRecognitionViewController.swift
//  AADImplementation
//
//  Created by Toby Thaliaparampil 2014 (N0562762) on 18/02/2018.
//  Copyright © 2018 Toby Thaliaparampil 2014 (N0562762). All rights reserved.
//

import UIKit

class RoadSignRecognitionViewController: UIViewController {
    
    @IBOutlet weak var btnCreateResults: UIButton!
    @IBOutlet weak var btnNextGame: UIButton!
    
    var score = 0;
    var time = 0.0;
    
    
    @IBAction func PressBtnCreateResults(_ sender: Any) {
        
        time = 17.0;
        score = 11
        btnNextGame.isHidden = false
    }
    
    @IBAction func PressBtnNextGame(_ sender: Any) {
        
        var patientID = InterfaceCommunication.patientID.capitalized
        var timeTaken = String(Int(time))
        var score = String(self.score)
        var game = "roadSignRecognition"
        
        guard let url = URL(string: "http://192.168.43.126:8080/SDSARESTInterface/webresources/setGameWithTimeAndScore?patientID=\(patientID)&game=\(game)&timeTaken=\(timeTaken)&score=\(score)") else {return}
        var request = URLRequest(url:url)
        request.httpMethod = "PUT"
        request.setValue("application/xml", forHTTPHeaderField: "Accept")
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            var returnMessage = ""
            //var output = "Patient has been successfully created"
            returnMessage = String(data: data!, encoding:String.Encoding(rawValue: String.Encoding.utf8.rawValue))!
            print (returnMessage)
            
            
            }.resume()
        
        
        ////code for next game
        do {
            let storyBoard: UIStoryboard = try UIStoryboard(name: "pathforming", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "PathFormingView1")
            self.present(newViewController, animated: true, completion: nil)
        } catch let error  {
            print(error.localizedDescription)
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
