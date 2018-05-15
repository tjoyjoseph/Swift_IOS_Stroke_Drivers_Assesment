//
//  ViewController.swift
//  PathFormTest1
//
//  Created by Kasim Hussain 2013 (N0516302) on 07/02/2018.
//  Copyright © 2018 Kasim Hussain 2013 (N0516302). All rights reserved.
//

import UIKit

var counterB = 0.0
var counterA = 0.0

class PathFormViewController1: UIViewController {
    
    var MAXTIMEALLOWEDPartA = 130.0
    var MAXTIMEALLOWEDPartB = 300.0
//    var counterB = 0.0
//    var counterA = 0.0
    var counterC = 0.0
    var gameTimerA = Timer()
    var gameTimerB = Timer()
    var gameState = true
    var HELPUSED = 0;
    
    @IBOutlet weak var Tlabel: UILabel!
    
    
    //squares with imageviews
    @IBOutlet weak var Square1: UIImageView!
    @IBOutlet weak var Square2: UIImageView!
    @IBOutlet weak var Square3: UIImageView!
    @IBOutlet weak var Square5: UIImageView!
    @IBOutlet weak var Square4: UIImageView!
    @IBOutlet weak var Square6: UIImageView!
    @IBOutlet weak var Square7: UIImageView!
    @IBOutlet weak var Square8: UIImageView!
    @IBOutlet weak var Square9: UIImageView!
    @IBOutlet weak var Square10: UIImageView!
    
    @IBOutlet weak var Square11: UIImageView!
    @IBOutlet weak var Square12: UIImageView!
    @IBOutlet weak var Square13: UIImageView!
    @IBOutlet weak var Square14: UIImageView!
    @IBOutlet weak var Square15: UIImageView!
    
    @IBOutlet weak var Square16: UIImageView!
    
    @IBOutlet weak var Square17: UIImageView!
    @IBOutlet weak var Square18: UIImageView!
    
    @IBOutlet weak var Square19: UIImageView!
    @IBOutlet weak var Square20: UIImageView!
    @IBOutlet weak var Square21: UIImageView!
    
    @IBOutlet weak var Square22: UIImageView!
    
    @IBOutlet weak var Square23: UIImageView!
    
    @IBOutlet weak var Square24: UIImageView!
    
    @IBOutlet weak var Square25: UIImageView!
    
    
    @IBOutlet weak var Square8b: UIImageView!
    
    //labels
    @IBOutlet weak var startGameLabel: UILabel!
    
    @IBOutlet weak var PartBEndLabel: UILabel!
    
    @IBOutlet weak var PartAEndLabel: UILabel!
    
    @IBOutlet weak var partABBeginLabel: UILabel!
    
    @IBOutlet weak var pressStartLabel: UILabel!
    
    
    //Tap gestures
    @IBOutlet var Tap1: UITapGestureRecognizer!
    @IBOutlet var Tap2: UITapGestureRecognizer!
    @IBOutlet var Tap3: UITapGestureRecognizer!
    @IBOutlet var Tap4: UITapGestureRecognizer!
    @IBOutlet var Tap5: UITapGestureRecognizer!
    @IBOutlet var Tap6: UITapGestureRecognizer!
    @IBOutlet var Tap7: UITapGestureRecognizer!
    @IBOutlet var Tap8: UITapGestureRecognizer!
    
    @IBOutlet var Tap8b: UITapGestureRecognizer!
    
    
    
    @IBOutlet var Tap9: UITapGestureRecognizer!
    @IBOutlet var Tap10: UITapGestureRecognizer!
    @IBOutlet var Tap11: UITapGestureRecognizer!
    @IBOutlet var Tap12: UITapGestureRecognizer!
    
    @IBOutlet var Tap13: UITapGestureRecognizer!
    @IBOutlet var Tap14: UITapGestureRecognizer!
    @IBOutlet var Tap15: UITapGestureRecognizer!
    @IBOutlet var Tap16: UITapGestureRecognizer!
    
    @IBOutlet var Tap17: UITapGestureRecognizer!
    
    @IBOutlet var Tap18: UITapGestureRecognizer!
    
    @IBOutlet var Tap19: UITapGestureRecognizer!
    
    @IBOutlet var Tap20: UITapGestureRecognizer!
    @IBOutlet var Tap21: UITapGestureRecognizer!
    
    @IBOutlet var Tap22: UITapGestureRecognizer!
    
    @IBOutlet var Tap23: UITapGestureRecognizer!
    
    @IBOutlet var Tap24: UITapGestureRecognizer!
    
    @IBOutlet var Tap25: UITapGestureRecognizer!
    
    
    
    //buttons
    
    @IBOutlet weak var StartButton: UIButton!
    
    
    @IBOutlet weak var nextPageButton: UIButton!
    @IBAction func StartButtonPressed(_ sender: UIButton) {
        LogClass.logThis(logData: "Start Button Clicked")
        pressStartLabel.isHidden = true
        StartButton.isHidden = true
        startGameLabel.text = "game started"
        startTest()
        startPartA()
        
        
        
    }
    
    
    @IBAction func nextPageButtonPressed(_ sender: UIButton) {

        
        performSegue(withIdentifier: "segue1", sender: self)
        StartButton.isHidden = false;
        
        
    }
    
    @IBAction func Sq1Tapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square 1 tapped")
        squareTapped(square: Square1, tap: Tap1)
        
        
    }
    
    @IBAction func Sq2Tapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square 2 tapped")
        squareTapped(square: Square2, tap: Tap2)
    }
    
    @IBAction func Sq3Tapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square 3 tapped")
        squareTapped(square: Square3, tap: Tap3)
    }
    
    @IBAction func Sq4Tapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square 4 tapped")
        squareTapped(square: Square4, tap: Tap4)
    }
    
    @IBAction func Sq5Tapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square 5 tapped")
        squareTapped(square: Square5, tap: Tap5)
    }
    
    @IBAction func Sq6Tapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square 6 tapped")
        squareTapped(square: Square6, tap: Tap6)
    }
    
    @IBAction func Sq7Tapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square 7 tapped")
        squareTapped(square: Square7, tap: Tap7)
    }
    
    @IBAction func Sq8Tapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square 8 tapped")
        squareTapped(square: Square8, tap: Tap8)
        partATestOver()
        
        
    }

    @IBAction func Sq8bTapped(_ sender: UITapGestureRecognizer) {
        squareTapped(square: Square8b, tap: Tap8b)
        LogClass.logThis(logData: "Square 8b tapped")
    }
    
    
    @IBAction func Sq9Tapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square 9 tapped")
        squareTapped(square: Square9, tap: Tap9)
    }
    
    @IBAction func Sq10Tapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square 10 tapped")
        squareTapped(square: Square10, tap: Tap10)
    }
    
    @IBAction func Sq11Tapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square 11 tapped")
        squareTapped(square: Square11, tap: Tap11)
    }
    
    @IBAction func Sq12Tapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square 12 tapped")
        squareTapped(square: Square12, tap: Tap12)
    }
    
    @IBAction func Sq13Tapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square 13 tapped")
        squareTapped(square: Square13, tap: Tap13)
    }
    
    @IBAction func Sq14Tapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square 14 tapped")
        squareTapped(square: Square14, tap: Tap14)
    }
    
    @IBAction func Sq15Tapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square 15 tapped")
        squareTapped(square: Square15, tap: Tap15)
    }
    
    @IBAction func Sq16Tapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square 16 tapped")
        squareTapped(square: Square16, tap: Tap16)
    }
    
    @IBAction func Sq17Tapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square 17 tapped")
        squareTapped(square: Square17, tap: Tap17)
    }
    
    @IBAction func Sq18Tapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square 18 tapped")
        squareTapped(square: Square18, tap: Tap18)
    }
    
    @IBAction func Sq19Tapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square 19 tapped")
        squareTapped(square: Square19, tap: Tap19)
    }
    
    @IBAction func Sq20Tapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square 20 tapped")
        squareTapped(square: Square20, tap: Tap20)
    }
    
    @IBAction func Sq21Tapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square 21 tapped")
        squareTapped(square: Square21, tap: Tap21)
    }
    
    @IBAction func Sq22Tapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square 22 tapped")
        squareTapped(square: Square22, tap: Tap22)
    }
    
    @IBAction func Sq23Tapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square 23 tapped")
        squareTapped(square: Square23, tap: Tap23)
    }
    
    
    @IBAction func Sq24Tapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square 24 tapped")
        squareTapped(square: Square24, tap: Tap24)
    }
    
    @IBAction func Sq25Tapped(_ sender: UITapGestureRecognizer) {
        LogClass.logThis(logData: "Square 25 tapped")
        squareTapped(square: Square25, tap: Tap25)
        partBTestOver()
    }
    
    
    
    //tapping a square func
    func squareTapped (square: UIImageView, tap: UITapGestureRecognizer) {
        
        square.tag = 1
        square.backgroundColor = UIColor.green
       
        
        
    }
    
    func partATestOver() {
        if Square1.tag == 1 && Square2.tag == 1 && Square3.tag == 1 && Square4.tag == 1 && Square5.tag == 1 && Square6.tag == 1 && Square7.tag == 1 && Square8.tag == 1 {
            
            
            endTest()
            gameState = false
        }
    }
        
        func partBTestOver() {
            if Square1.tag == 1 && Square2.tag == 1 && Square3.tag == 1 && Square4.tag == 1 && Square5.tag == 1 && Square6.tag == 1 && Square7.tag == 1 && Square8.tag == 1 && Square9.tag == 1 && Square10.tag == 1 && Square11.tag == 1 && Square12.tag == 1 && Square13.tag == 1 && Square14.tag == 1 && Square15.tag == 1 && Square16.tag == 1 && Square17.tag == 1 && Square18.tag == 1 && Square19.tag == 1 && Square20.tag == 1 && Square21.tag == 1 && Square22.tag == 1 && Square23.tag == 1 && Square24.tag == 1 && Square25.tag == 1 {
            
                endTest()
                gameState = false
                
                let alertController = UIAlertController(title: "Time is up!", message: "The time limit for this test has now expired, please close this box your test has now finished, you will now move on to Part 2", preferredStyle: .alert)
                
                let closeBox = UIAlertAction (title: "Part 2", style: .default) {
                    (action) -> Void in self.nextPageButtonPressed(self.nextPageButton) }
                
                alertController.addAction(closeBox)
                
                self.present(alertController, animated: true, completion: nil)
                
            }
        
//        else if Square1.tag == 1 || Square2.tag == 1 || Square3.tag == 1 || Square4.tag == 1 || Square5.tag == 1 || Square6.tag == 1 || Square7.tag == 1 || Square8.tag == 1 {
//
//
//            gameState = false
//
//
//
//
//        }
        
       
       
    }
    
    func startPartA () {

        Square1.isHidden = false
        Square2.isHidden = false
        Square3.isHidden = false
        Square4.isHidden = false
        Square5.isHidden = false
        Square6.isHidden = false
        Square7.isHidden = false
        Square8.isHidden = false
        PartAEndLabel.isHidden = false
        partABBeginLabel.isHidden = false
        
        Square9.isHidden = true
        Square10.isHidden = true
        Square11.isHidden = true
        Square12.isHidden = true
        Square13.isHidden = true
        Square14.isHidden = true
        Square15.isHidden = true
        Square16.isHidden = true
        Square17.isHidden = true
        Square18.isHidden = true
        Square19.isHidden = true
        Square20.isHidden = true
        Square21.isHidden = true
        Square22.isHidden = true
        Square23.isHidden = true
        Square24.isHidden = true
        Square25.isHidden = true
        Square8b.isHidden = true

        PartBEndLabel.isHidden = true
        
        gameTimerA = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector (PathFormViewController1.startTimerA), userInfo: nil, repeats: true)
        
    }
    
    func startPartB () {
    
        
        Square1.backgroundColor = nil
        Square2.backgroundColor = nil
        Square3.backgroundColor = nil
        Square4.backgroundColor = nil
        Square5.backgroundColor = nil
        Square6.backgroundColor = nil
        Square7.backgroundColor = nil
        Square8.backgroundColor = nil
        
        Square8.isHidden = true
        Square8b.isHidden = false
        Square9.isHidden = false
        Square10.isHidden = false
        Square11.isHidden = false
        Square12.isHidden = false
        Square13.isHidden = false
        Square14.isHidden = false
        Square15.isHidden = false
        Square16.isHidden = false
        Square17.isHidden = false
        Square18.isHidden = false
        Square19.isHidden = false
        Square20.isHidden = false
        Square21.isHidden = false
        Square22.isHidden = false
        Square23.isHidden = false
        Square24.isHidden = false
        Square25.isHidden = false
        PartBEndLabel.isHidden = false
        
        PartAEndLabel.isHidden = true
        
        
        startTest()
        gameTimerB = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector (PathFormViewController1.startTimerB), userInfo: nil, repeats: true)
      
        
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
            let path = Bundle.main.path(forResource: "InstructionsA", ofType: "txt", inDirectory: "PathFormingResources")
            do {
                let content = try String(contentsOfFile:path!, encoding: String.Encoding.utf8)
                
                showAlert(theTitle: "Instructions", theMessage: content)
            } catch _ as NSError {}
        } else {
            showAlert(theTitle: "Instructions", theMessage: "You've used the maximum amount of help requests")
        }
        
    }
    
    
    func startTest () {
        

        
        Tap1.isEnabled = true
        Tap2.isEnabled = true
        Tap3.isEnabled = true
        Tap4.isEnabled = true
        Tap5.isEnabled = true
        Tap6.isEnabled = true
        Tap7.isEnabled = true
        Tap8.isEnabled = true
        Tap9.isEnabled = true
        Tap10.isEnabled = true
        Tap11.isEnabled = true
        Tap12.isEnabled = true
        Tap13.isEnabled = true
        Tap14.isEnabled = true
        Tap15.isEnabled = true
        Tap16.isEnabled = true
        Tap17.isEnabled = true
        Tap18.isEnabled = true
        Tap19.isEnabled = true
        Tap20.isEnabled = true
        Tap21.isEnabled = true
        Tap22.isEnabled = true
        Tap23.isEnabled = true
        Tap24.isEnabled = true
        Tap25.isEnabled = true
        gameState = true
       
        
        
    }
    
    func endTest() {
        
        Tap1.isEnabled = false
        Tap2.isEnabled = false
        Tap3.isEnabled = false
        Tap4.isEnabled = false
        Tap5.isEnabled = false
        Tap6.isEnabled = false
        Tap7.isEnabled = false
        Tap8.isEnabled = false
        Tap9.isEnabled = false
        Tap10.isEnabled = false
        Tap11.isEnabled = false
        Tap12.isEnabled = false
        Tap13.isEnabled = false
        Tap14.isEnabled = false
        Tap15.isEnabled = false
        Tap16.isEnabled = false
        Tap17.isEnabled = false
        Tap18.isEnabled = false
        Tap19.isEnabled = false
        Tap20.isEnabled = false
        Tap21.isEnabled = false
        Tap22.isEnabled = false
        Tap23.isEnabled = false
        Tap24.isEnabled = false
        Tap25.isEnabled = false
        
        
        
    }
    
//    @objc func startTimerA()
//    {
//        var counterName = ""
//        counterC += 0.2
//        print(counterC)
//       
//        if (counterName == "A") {
//        if (MAXTIMEALLOWEDPartA == counterC)
//        {
//            gameTimer.invalidate()
//  
//            counterA = counterC
//            counterC = 0.0
//            print(counterA)
//            let alertController = UIAlertController(title: "Time is up!", message: "The time limit for this test has now expired, select ok and then press start for next test", preferredStyle: .alert)
//            
//            let okOption = UIAlertAction (title: "Ok", style: .default) {
//                (action) -> Void in self.startPartB()
//            }
//            
//            alertController.addAction(okOption)
//            
//            self.present(alertController, animated: true, completion: nil)
//        
//            }
//        }
//        
//        else if (counterName == "B") {
//            if ( MAXTIMEALLOWEDPartB == counterC)
//        {
//            gameTimer.invalidate()
//       
//            counterB = counterC
//            counterC = 0.0
//            print(counterB)
//            let alertController = UIAlertController(title: "Time is up!", message: "The time limit for this test has now expired, please close this box your test has now finished, you will now move on to Part 2", preferredStyle: .alert)
//            
//            let closeBox = UIAlertAction (title: "Part 2", style: .default) {
//                (action) -> Void in self.nextPageButtonPressed(self.nextPageButton) }
//            
//            alertController.addAction(closeBox)
//            
//            self.present(alertController, animated: true, completion: nil)
//            
//            }
//        }
//        
//        
//    }

    
    @objc func startTimerA()
    {
       
       
        counterC += 0.2
        print(counterC)
  
        if (counterC <= MAXTIMEALLOWEDPartA && gameState == false)
            {
                
                
                counterA = counterC
                counterC = 0.0
                print ("completed test in...")
                print(counterA)
                let timeUpAlertController = UIAlertController(title: "Test is finished", message: "The time limit for this test has now expired, select ok and then press start for next test", preferredStyle: .alert)

                let okOption = UIAlertAction (title: "Ok", style: .default) {
                    (action) -> Void in self.startPartB()
                }
                timeUpAlertController.addAction(okOption)
                
                self.present(timeUpAlertController, animated: true, completion: nil)
                
                //showAlert(theTitle: "Test Complete", theMessage: "Press OK to start the next part of this test")
                
                
                
                gameTimerA.invalidate()
                
            }
        
      
        }
    
    func cleanStart ()
    {
        
        Square1.isHidden = true
        Square2.isHidden = true
        Square3.isHidden = true
        Square4.isHidden = true
        Square5.isHidden = true
        Square6.isHidden = true
        Square7.isHidden = true
        Square8.isHidden = true
        
        partABBeginLabel.isHidden = true
        Square9.isHidden = true
        Square10.isHidden = true
        Square11.isHidden = true
        Square12.isHidden = true
        Square13.isHidden = true
        Square14.isHidden = true
        Square15.isHidden = true
        Square16.isHidden = true
        Square17.isHidden = true
        Square18.isHidden = true
        Square19.isHidden = true
        Square20.isHidden = true
        Square21.isHidden = true
        Square22.isHidden = true
        Square23.isHidden = true
        Square24.isHidden = true
        Square25.isHidden = true
        Square8b.isHidden = true
        
        PartBEndLabel.isHidden = true
        PartAEndLabel.isHidden = true
        
        
        
    }
        
        
//        if (counterC < MAXTIMEALLOWEDPartA && gameState == true ) {
//
//                gameTimer.invalidate()
//
//                counterA = counterC
//                counterC = 0.0
//                print ("completed test in...")
//                print(counterA)
//                gameTimer.invalidate()
//                let continueAlertController = UIAlertController(title: "Test complete", message: "select ok and then press start for next test", preferredStyle: .alert)
//
//                let COption = UIAlertAction (title: "Ok", style: .default) {
//                    (action) -> Void in self.startPartB()
//                }
//
//                continueAlertController.addAction(COption)
//
//                self.present(continueAlertController, animated: true, completion: nil)
//
//        }
//
        
        
    
    @objc func startTimerB()
    {
        
        counterC += 1
        print(counterC)
        
            if ( counterC <= MAXTIMEALLOWEDPartB && gameState == false)
            {
                
                
                counterB = counterC
                counterC = 0.0
                print ("completed test in...")
                print(counterB)
                let alertController = UIAlertController(title: "Time is up!", message: "The time limit for this test has now expired, please close this box your test has now finished, you will now move on to Part 2", preferredStyle: .alert)

                let closeBox = UIAlertAction (title: "Part 2", style: .default) {
                    (action) -> Void in self.nextPageButtonPressed(self.nextPageButton) }

                alertController.addAction(closeBox)

                self.present(alertController, animated: true, completion: nil)
                
                //showAlert(theTitle: "Test Complete", theMessage: "Press OK to start the next part of this test")
                gameTimerB.invalidate()
                
            }
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        cleanStart()
        endTest()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

