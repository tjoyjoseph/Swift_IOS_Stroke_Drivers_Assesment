//
//  ViewController.swift
//  DotCancellation
//
//  Created by Vahid Rostampour 2011 (N0372677) on 04/02/2018.
//  Copyright © 2018 Vahid Rostampour 2011 (N0372677). All rights reserved.
//

import UIKit

class DotCancellationViewController: UIViewController {
    
    var correctMove = 0
    var incorrectMove = 0
    
    var MAXTIMEALLOWED = 900.0
    var time = 0.0
    var timer = Timer();
    var gameInPlay = false
    
    //Practice View
    @IBOutlet weak var practiceView: UIView!
    
    @IBOutlet weak var btnStop: UIButton!
    
    @IBOutlet weak var btnNextGame: UIButton!
    @IBOutlet weak var btnStart: UIButton!
    
    var HELPUSED = 0;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        practiceView.isHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func PressBtnStop(_ sender: Any) {
        LogClass.logThis(logData: "Game Stopped")
        timer.invalidate()
        btnNextGame.isHidden = false
    }
    
    @IBAction func PressbtnNextGame(_ sender: Any) {
        var patientID = InterfaceCommunication.patientID.capitalized
        var timeTaken = String(Int(time))
        var foursCrossed = String(correctMove)
        var falsePositives = String(incorrectMove)
        
        guard let url = URL(string: "http://192.168.43.126:8080/SDSARESTInterface/webresources/setDotCancellation?patientID=\(patientID)&timeTaken=\(timeTaken)&foursCrossed=\(foursCrossed)&falsePositives=\(falsePositives)") else {return}
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
        
        
        
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "direction", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "DirectionView")
        self.present(newViewController, animated: true, completion: nil)  
    }
    
    @IBAction func PressBtnHelp(_ sender: Any) {
        LogClass.logThis(logData: "Help Button Pressed")
        HELPUSED = HELPUSED + 1;
        if HELPUSED < 3 {
            let path = Bundle.main.path(forResource: "Instructions", ofType: "txt", inDirectory: "DotCancellationResources")
            do {
                let content = try String(contentsOfFile:path!, encoding: String.Encoding.utf8)
                
                showAlert(theTitle: "Instructions", theMessage: content)
            } catch _ as NSError {}
        } else {
            showAlert(theTitle: "Instructions", theMessage: "You've used the maximum amount of help requests")
        }
        
    }
    
    
    
    
    //Timer Alert
    func showAlert(theTitle: String,theMessage: String)
    {
        let alert = UIAlertController(title: theTitle, message: theMessage, preferredStyle: .alert);
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: { (action) in alert.dismiss(animated: true, completion: nil)
            
        }))
        self.present(alert,animated: true,completion: nil)
    }
    
    //Timer itself
    @objc func startTimer()
    {
        if (time < MAXTIMEALLOWED){
            time += 0.2;
            print(time);
        } else if (time == MAXTIMEALLOWED){
            showAlert(theTitle: "Time limit", theMessage: "Time limit")
            timer.invalidate();
            //LogClass.logThis(logData: "Game Ended")
            gameInPlay = false
        }
    }
    
    
    @IBAction func btnStart(_ sender: Any) {
        //if gameinPlay == false{
            //LogClass.logThis(logData: "Game Started")
            btnStart.isHidden = true;
        btnNextGame.isHidden = true
        btnStop.isHidden = false
          practiceView.isHidden = true
            gameInPlay = true;
            timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(DotCancellationViewController.startTimer), userInfo: nil, repeats: true)
        }
        
        
    

    
    
    
    //Practice Row
    @IBAction func makeCrossActionPracticeRow(_ sender: AnyObject)
    {
        LogClass.logThis(logData: "Practise Row square tapped")
        sender.setImage(UIImage(named: "Red-x.png"), for: UIControlState())
    }

    @IBAction func makeCrossAction(_ sender: AnyObject)
    {
        LogClass.logThis(logData: "Element of dots \(sender.tag) tapped")
        if (gameInPlay == true)
        {
        sender.setImage(UIImage(named: "Red-x.png"), for: UIControlState())
        if (sender.tag == 4)
        {
            correctMove = correctMove + 1
        }
        else
        {
            incorrectMove = incorrectMove + 1
        }
        print("incorrect moves = ",  incorrectMove, "       correct moves = ",  correctMove)
        //set the button as disabled after pressed
        
//        if (sender.isEnabled)
//        {
//            print("button is still enabled")
//
//
////            sender.setEnabled(false, forSegmentAt: 1)
////            if (sender.isEnabled == false)
////            {
////                print("button is now disbaled")
////            }
////
//        }
        
        }
        else
        {
        showAlert(theTitle: "Game not Started!", theMessage: "Please start the game before playing")
        //LogClass.logThis(logData: "Game attempted to play without starting")
        }
        }
    
   
    @IBOutlet weak var DotPage2: UIView!
    
    @IBOutlet weak var NextPageButtonOutlet: UIButton!
    
    @IBAction func NextPageButton(_ sender: UIButton) {
        
        DotPage2.isHidden = false
        NextPageButtonOutlet.isHidden = true
        
    }
    
    
}

