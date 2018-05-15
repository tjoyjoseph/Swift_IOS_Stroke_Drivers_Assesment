//
//  Test2ViewController.swift
//  PathFormTest1
//
//  Created by Kasim Hussain 2013 (N0516302) on 09/02/2018.
//  Copyright © 2018 Kasim Hussain 2013 (N0516302). All rights reserved.
//

import UIKit

var counterB2 = 0.0
var counterA2 = 0.0

class PathFormingViewController2: UIViewController {
    
    var MAXTIMEALLOWEDPartA2 = 130.0
    var MAXTIMEALLOWEDPartB2 = 300.0
//    var counterB2 = 0.0
//    var counterA2 = 0.0
    var counterC2 = 0.0
    var gameState2 = true 
    var gameTimerA2 = Timer()
    var gameTimerB2 = Timer()
    var HELPUSED = 0;
    
    //labels
    @IBOutlet weak var beginLabel: UILabel!
    
    @IBOutlet weak var partAEndLabel: UILabel!
    
    @IBOutlet weak var btnNextGame: UIButton!
    
    @IBOutlet weak var partBEndLabel: UILabel!
    
    
    
    
    
    
    //squares numbers
    @IBOutlet weak var Square1: UIImageView!
    
    @IBOutlet weak var Square2: UIImageView!
    
    @IBOutlet weak var Square3: UIImageView!
    
    @IBOutlet weak var Square4: UIImageView!
    
    @IBOutlet weak var Square5: UIImageView!
    
    @IBOutlet weak var Square6: UIImageView!
    
    @IBOutlet weak var Square7: UIImageView!
    
    @IBOutlet weak var Square8: UIImageView!
    
    @IBOutlet weak var Square9: UIImageView!
    
    @IBOutlet weak var Square10: UIImageView!
    
    @IBOutlet weak var Square11: UIImageView!
    
    @IBOutlet weak var Square12: UIImageView!
    
    @IBOutlet weak var Square13: UIImageView!
    
    @IBOutlet weak var Square4b: UIImageView!
    
    
    //squares letters
    
    @IBOutlet weak var SquareA: UIImageView!
    
    @IBOutlet weak var SquareB: UIImageView!
    
    @IBOutlet weak var SquareC: UIImageView!
    
    @IBOutlet weak var SquareD: UIImageView!
    
    @IBOutlet weak var SquareE: UIImageView!
    
    @IBOutlet weak var SquareF: UIImageView!
    
    @IBOutlet weak var SquareG: UIImageView!
    
    @IBOutlet weak var SquareH: UIImageView!
    
    @IBOutlet weak var SquareI: UIImageView!
    
    @IBOutlet weak var SquareJ: UIImageView!
    
    @IBOutlet weak var SquareK: UIImageView!
    
    @IBOutlet weak var SquareL: UIImageView!
    
    @IBOutlet weak var SquareM: UIImageView!
    
    @IBOutlet weak var SquareDb: UIImageView!
    
    
    //tap gestures number squares outlets
    
    @IBOutlet var TapSq1: UITapGestureRecognizer!
    
    @IBOutlet var TapSq2: UITapGestureRecognizer!
    
    @IBOutlet var TapSq3: UITapGestureRecognizer!
    
    @IBOutlet var TapSq4: UITapGestureRecognizer!
    
   
    
    @IBOutlet var TapSq5: UITapGestureRecognizer!
    
    @IBOutlet var TapSq6: UITapGestureRecognizer!
    
    @IBOutlet var TapSq7: UITapGestureRecognizer!
    
    @IBOutlet var TapSq8: UITapGestureRecognizer!
    
    @IBOutlet var TapSq9: UITapGestureRecognizer!
    
    @IBOutlet var TapSq10: UITapGestureRecognizer!
    
    @IBOutlet var TapSq11: UITapGestureRecognizer!
    
    @IBOutlet var TapSq12: UITapGestureRecognizer!
    
    @IBOutlet var TapSq13: UITapGestureRecognizer!
    
    @IBOutlet var TapSq4b: UITapGestureRecognizer!
    
    
    //tap gestures for letters outlets
    
    @IBOutlet var TapSqA: UITapGestureRecognizer!
    
    @IBOutlet var TapSqB: UITapGestureRecognizer!
    
    @IBOutlet var TapSqC: UITapGestureRecognizer!
    
    @IBOutlet var TapSqD: UITapGestureRecognizer!
    
    

    
    @IBOutlet var TapSqE: UITapGestureRecognizer!
    
    @IBOutlet var TapSqF: UITapGestureRecognizer!
    
    @IBOutlet var TapSqG: UITapGestureRecognizer!
    
    @IBOutlet var TapSqH: UITapGestureRecognizer!
    
    @IBOutlet var TapSqI: UITapGestureRecognizer!
    
    @IBOutlet var TapSqJ: UITapGestureRecognizer!
    
    @IBOutlet var TapSqK: UITapGestureRecognizer!
    
    @IBOutlet var TapSqL: UITapGestureRecognizer!
    
    @IBOutlet var TapSqM: UITapGestureRecognizer!
    
    @IBOutlet var TapSqDb: UITapGestureRecognizer!
    
    
    @IBOutlet weak var startGameButton: UIButton!
    
    
    @IBAction func PressBtnNextGame(_ sender: Any) {
        let patientID = InterfaceCommunication.patientID.capitalized
        let avgOneThirtyTime = Int((counterA + counterA2)/2)
        let avgThreeHundredTime = Int((counterB + counterB2)/2)
        
        
        guard let url = URL(string: "http://192.168.43.126:8080/SDSARESTInterface/webresources/setPathform?patientID=\(patientID)&timeTaken150Limit=\(avgOneThirtyTime)&timeTaken300Limit=\(avgThreeHundredTime)") else {return}
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
        
        
        
        ////// View Results Page
        do {
            let storyBoard: UIStoryboard = try UIStoryboard(name: "viewresults", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "ViewResultsView")
            self.present(newViewController, animated: true, completion: nil)
        } catch let error  {
            print(error.localizedDescription)
        }
    }
    
    
    @IBAction func Sq1Tapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square 1 tapped")
        squareTapped(square: Square1, tap: TapSq1)
    }
    
    @IBAction func Sq2Tapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square 2 tapped")
        squareTapped(square: Square2, tap: TapSq2)
    }
    
    @IBAction func Sq3Tapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square 3 tapped")
        squareTapped(square: Square3, tap: TapSq3)
    }
    
    
    @IBAction func Sq4Tapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square 4 tapped")
        squareTapped(square: Square4, tap: TapSq4)
        partATestOver()
    }
    
    @IBAction func Sq4bTapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square 4b tapped")
        squareTapped(square: Square4b, tap: TapSq4b)
        
    }
    
    @IBAction func Sq5Tapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square 5 tapped")
        squareTapped(square: Square5, tap: TapSq5)
    }
    
    @IBAction func Sq6Tapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square 6 tapped")
        squareTapped(square: Square6, tap: TapSq6)
    }
    
    
    @IBAction func Sq7Tapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square 7 tapped")
        squareTapped(square: Square7, tap: TapSq7)
    }
    
    @IBAction func Sq8Tapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square 8 tapped")
        squareTapped(square: Square8, tap: TapSq8)
    }
    
    @IBAction func Sq9Tapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square 9 tapped")
        squareTapped(square: Square9, tap: TapSq9)
    }
    
    @IBAction func Sq10Tapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square 10 tapped")
        squareTapped(square: Square10, tap: TapSq10)
    }
    
    @IBAction func Sq11Tapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square 11 tapped")
        squareTapped(square: Square11, tap: TapSq11)
    }
    
    @IBAction func Sq12Tapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square 12 tapped")
        squareTapped(square: Square12, tap: TapSq12)
    }
    
    @IBAction func Sq13Tapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square 13 tapped")
        squareTapped(square: Square13, tap: TapSq13)
        gameTimerB2.invalidate()
        btnNextGame.isHidden = true
    }
    
    
    @IBAction func SqATapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square A tapped")
        squareTapped(square: SquareA, tap: TapSqA)
    }
    
    
    @IBAction func SqBTapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square B tapped")
        squareTapped(square: SquareB, tap: TapSqB)
    }
    
    @IBAction func SqCTapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square C tapped")
        squareTapped(square: SquareC, tap: TapSqC)
    }
    
    @IBAction func SqDTapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square D tapped")
        squareTapped(square: SquareD, tap: TapSqD)
        partATestOver()
    }
    
    @IBAction func SqDbTapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square Db tapped")
        squareTapped(square: SquareDb, tap: TapSqDb)
    }
    
    @IBAction func SqETapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square E tapped")
        squareTapped(square: SquareE, tap: TapSqE)
    }
    
    @IBAction func SqFTapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square F tapped")
        squareTapped(square: SquareF, tap: TapSqF)
    }
    
    @IBAction func SqGTapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square G tapped")
        squareTapped(square: SquareG, tap: TapSqG)
    }
    
    @IBAction func SqHTapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square H tapped")
        squareTapped(square: SquareH, tap: TapSqH)
    }
    
    @IBAction func SqITapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square I tapped")
        squareTapped(square: SquareI, tap: TapSqI)
    }
    
    @IBAction func SqJTapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square J tapped")
        squareTapped(square: SquareJ, tap: TapSqJ)
    }
    
    @IBAction func SqKTapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square K tapped")
        squareTapped(square: SquareK, tap: TapSqK)
    }
    
    @IBAction func SqLTapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square L tapped")
        squareTapped(square: SquareL, tap: TapSqL)
    }
    
    @IBAction func SqMTapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square M tapped")
        squareTapped(square: SquareM, tap: TapSqM)
    }
    
    @IBAction func startGameButtonPressed(_ sender: UIButton) {
        LogClass.logThis(logData: "Start Game")
        startTest()
        startPartA()
        btnNextGame.isHidden = true
        startGameButton.isHidden = true
    }
    
    
   
    
    
    //tapping a square func
    func squareTapped (square: UIImageView, tap: UITapGestureRecognizer) {
        
        square.tag = 1
        square.backgroundColor = UIColor.green
   
        
        
    }
    
    func partATestOver () {
        if Square1.tag == 1 && Square2.tag == 1 && Square3.tag == 1 && Square4.tag == 1 && SquareA.tag == 1 && SquareB.tag == 1 && SquareC.tag == 1 && SquareD.tag == 1 {
            
            endTest()
            gameState2 = false
            
        } else if (counterA2 == MAXTIMEALLOWEDPartA2)
        {
            endTest()
            gameState2 = false
        }
        
        
    }
    
    func startPartB () {
        
        
        Square1.backgroundColor = nil
        Square2.backgroundColor = nil
        Square3.backgroundColor = nil
        Square4.backgroundColor = nil
        SquareA.backgroundColor = nil
        SquareB.backgroundColor = nil
        SquareC.backgroundColor = nil
        SquareD.backgroundColor = nil
        
        Square4.isHidden = true
        SquareD.isHidden = true
        
        Square4b.isHidden = false
        Square5.isHidden = false
        Square6.isHidden = false
        Square7.isHidden = false
        Square8.isHidden = false
        Square9.isHidden = false
        Square10.isHidden = false
        Square11.isHidden = false
        Square12.isHidden = false
        Square13.isHidden = false
        
        SquareDb.isHidden = false
        SquareE.isHidden = false
        SquareF.isHidden = false
        SquareG.isHidden = false
        SquareH.isHidden = false
        SquareI.isHidden = false
        SquareJ.isHidden = false
        SquareK.isHidden = false
        SquareL.isHidden = false
        SquareM.isHidden = false
      
        partBEndLabel.isHidden = false
        partAEndLabel.isHidden = true
        
        
        startTest()
        gameTimerB2 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector (PathFormingViewController2.startTimerB2), userInfo: nil, repeats: true)
      
        
    }
    
    func startPartA () {
        
        
        Square4b.isHidden = true
        Square5.isHidden = true
        Square6.isHidden = true
        Square7.isHidden = true
        Square8.isHidden = true
        Square9.isHidden = true
        Square10.isHidden = true
        Square11.isHidden = true
        Square12.isHidden = true
        Square13.isHidden = true
        
        SquareDb.isHidden = true
        SquareE.isHidden = true
        SquareF.isHidden = true
        SquareG.isHidden = true
        SquareH.isHidden = true
        SquareI.isHidden = true
        SquareJ.isHidden = true
        SquareK.isHidden = true
        SquareL.isHidden = true
        SquareM.isHidden = true
        partBEndLabel.isHidden = true
        
        
        gameTimerA2 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector (PathFormingViewController2.startTimerA2), userInfo: nil, repeats: true)
        
        
    }
    
    
    
    func startTest () {
        
        
        TapSq1.isEnabled = true
        TapSq2.isEnabled = true
        TapSq3.isEnabled = true
        TapSq4.isEnabled = true
        TapSq5.isEnabled = true
        TapSq6.isEnabled = true
        TapSq7.isEnabled = true
        TapSq8.isEnabled = true
        TapSq9.isEnabled = true
        TapSq10.isEnabled = true
        TapSq11.isEnabled = true
        TapSq12.isEnabled = true
        TapSq13.isEnabled = true
        TapSqA.isEnabled = true
        TapSqB.isEnabled = true
        TapSqC.isEnabled = true
        TapSqD.isEnabled = true
        TapSqE.isEnabled = true
        TapSqF.isEnabled = true
        TapSqG.isEnabled = true
        TapSqH.isEnabled = true
        TapSqI.isEnabled = true
        gameState2 = true
 
        
        
    }
    
    func endTest() {
        
        TapSq1.isEnabled = false
        TapSq2.isEnabled = false
        TapSq3.isEnabled = false
        TapSq4.isEnabled = false
        TapSq5.isEnabled = false
        TapSq6.isEnabled = false
        TapSq7.isEnabled = false
        TapSq8.isEnabled = false
        TapSq9.isEnabled = false
        TapSq10.isEnabled = false
        TapSq11.isEnabled = false
        TapSq12.isEnabled = false
        TapSq13.isEnabled = false
        TapSqA.isEnabled = false
        TapSqB.isEnabled = false
        TapSqC.isEnabled = false
        TapSqD.isEnabled = false
        TapSqE.isEnabled = false
        TapSqF.isEnabled = false
        TapSqG.isEnabled = false
        TapSqH.isEnabled = false
        TapSqI.isEnabled = false
        
    }
    
//    @objc func startTimer2()
//    {
//
//        counterA2 += 1
//        counterB2 += 1
//
//        if (MAXTIMEALLOWEDPartA2 == counterA2)
//        {
//            gameTimer.invalidate()
//
//            let alertController = UIAlertController(title: "Time is up!", message: "The time limit for this test has now expired, select ok and then press start for next test", preferredStyle: .alert)
//
//            let okOption = UIAlertAction (title: "Ok", style: .default) {
//                (action) -> Void in self.startPartB()
//            }
//
//             alertController.addAction(okOption)
//
//            self.present(alertController, animated: true, completion: nil)
//
//
//
//
//        }
//
//        else if ( MAXTIMEALLOWEDPartB2 == counterB2)
//        {
//            gameTimer.invalidate()
//
//
//            let alertController = UIAlertController(title: "Time is up!", message: "The time limit for this test has now expired, please close this box your test has now finished", preferredStyle: .alert)
//
//            let closeBox = UIAlertAction (title: "close", style: .default) {
//                (action) -> Void in self.endTest()
//            }
//
//            alertController.addAction(closeBox)
//
//            self.present(alertController, animated: true, completion: nil)
//        }
//
//
//    }
    
    @objc func startTimerA2()
    {
        
        counterC2 += 1
        print(counterC2)
        if (counterC2 <= MAXTIMEALLOWEDPartA2 && gameState2 == false)
        {
            gameTimerA2.invalidate()
            
            counterA2 = counterC2
            counterC2 = 0.0
            print ("completed test in...")
            print(counterA2)
            let partAController = UIAlertController(title: "Test has finished", message: "The time limit for this test has now expired, select ok and then press start for next test", preferredStyle: .alert)

            let okOption = UIAlertAction (title: "Ok", style: .default) {
                (action) -> Void in self.startPartB()
            }

            partAController.addAction(okOption)

            self.present(partAController, animated: true, completion: nil)
            //showAlert(theTitle: "Test Complete", theMessage: "Press OK to start the next part of this test")
            
        }
        
        
    }
    
    func showAlert(theTitle: String,theMessage: String)
    {
        let alert = UIAlertController(title: theTitle, message: theMessage, preferredStyle: .alert);
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: { (action) in alert.dismiss(animated: true, completion: nil)
            
        }))
        //DispatchQueue.main.async {
        self.present(alert,animated: true,completion: nil)
        //}
    }
    
    @IBAction func PressBtnHelp(_ sender: Any) {
        
        LogClass.logThis(logData: "Help Button Pressed")
        HELPUSED = HELPUSED + 1;
        if HELPUSED < 3 {
            let path = Bundle.main.path(forResource: "InstructionsB", ofType: "txt", inDirectory: "PathFormingResources")
            do {
                let content = try String(contentsOfFile:path!, encoding: String.Encoding.utf8)
                
                showAlert(theTitle: "Instructions", theMessage: content)
            } catch _ as NSError {}
        } else {
            showAlert(theTitle: "Instructions", theMessage: "You've used the maximum amount of help requests")
        }
        
    }
    
    
    @objc func startTimerB2()
    {
        
        counterC2 += 1
        print(counterC2)
        
        if ( counterC2 <= MAXTIMEALLOWEDPartB2 && gameState2 == false)
        {
            gameTimerB2.invalidate()
            
            counterB2 = counterC2
            counterC2 = 0.0
            print ("completed test in...")
            print(counterB2)
            let partBController = UIAlertController(title: "Time is up!", message: "The time limit for this test has now expired, please close this box your test has now finished", preferredStyle: .alert)

            let closeBox = UIAlertAction (title: "close", style: .default) {
                            (action) -> Void in self.endTest()
                        }
            partBController.addAction(closeBox)

            self.present(partBController, animated: true, completion: nil)
            //showAlert(theTitle: "Test Complete", theMessage: "Press OK to close this box and terminate your test")
            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        endTest()
       
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
