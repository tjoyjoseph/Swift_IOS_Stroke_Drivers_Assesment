//
//  ViewController.swift
//  AAD_SquareDirectionMatrices
//
//  Created by Toby Thaliaparampil 2014 (N0562762) on 26/01/2018.
//  Copyright © 2018 Toby Thaliaparampil 2014 (N0562762). All rights reserved.
//

import UIKit

class CompassViewController: UIViewController {
    
    
    @IBOutlet weak var imgSq0: UIImageView!
    @IBOutlet weak var imgSq1: UIImageView!
    @IBOutlet weak var imgSq2: UIImageView!
    @IBOutlet weak var imgSq3: UIImageView!
    @IBOutlet weak var imgSq4: UIImageView!
    @IBOutlet weak var imgSq5: UIImageView!
    @IBOutlet weak var imgSq6: UIImageView!
    @IBOutlet weak var imgSq7: UIImageView!
    @IBOutlet weak var imgSq8: UIImageView!
    @IBOutlet weak var imgSq9: UIImageView!
    @IBOutlet weak var imgSq10: UIImageView!
    @IBOutlet weak var imgSq11: UIImageView!
    @IBOutlet weak var imgSq12: UIImageView!
    @IBOutlet weak var imgSq13: UIImageView!
    @IBOutlet weak var imgSq14: UIImageView!
    @IBOutlet weak var imgSq15: UIImageView!
    @IBOutlet weak var imgSqCars: UIImageView!
    
    
    @IBOutlet var tapImgSq0: UITapGestureRecognizer!
    @IBOutlet var tapImgSq1: UITapGestureRecognizer!
    @IBOutlet var tapImgSq2: UITapGestureRecognizer!
    @IBOutlet var tapImgSq3: UITapGestureRecognizer!
    @IBOutlet var tapImgSq4: UITapGestureRecognizer!
    @IBOutlet var tapImgSq5: UITapGestureRecognizer!
    @IBOutlet var tapImgSq6: UITapGestureRecognizer!
    @IBOutlet var tapImgSq7: UITapGestureRecognizer!
    @IBOutlet var tapImgSq8: UITapGestureRecognizer!
    @IBOutlet var tapImgSq9: UITapGestureRecognizer!
    @IBOutlet var tapImgSq10: UITapGestureRecognizer!
    @IBOutlet var tapImgSq11: UITapGestureRecognizer!
    @IBOutlet var tapImgSq12: UITapGestureRecognizer!
    @IBOutlet var tapImgSq13: UITapGestureRecognizer!
    @IBOutlet var tapImgSq14: UITapGestureRecognizer!
    @IBOutlet var tapImgSq15: UITapGestureRecognizer!
   
    
    @IBOutlet weak var btnNotFit: UIButton!
    
    @IBOutlet weak var btnStart: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    
    var allSquares = [UIImageView]();
    
    var imageToSquare =  [URL](); ///////changed
    var imageNames = [String]()   ////changed
    var currentImageToSquare =  [URL]();  ////changed
    
    let MAXTIMEALLOWED = 900.0; ///CHANGE
    var HELPUSED = 0;
    var score = 0;
    var time = 0.0;
    var timer = Timer();
    var gameinPlay = false;
    //var imageIndex = 0;
    
    @objc func startTimer()
    {
        if (time < MAXTIMEALLOWED){
            time += 0.2;
            // print(time);
        }
//        } else if (time == MAXTIMEALLOWED){
//            showAlert(theTitle: "Time limit", theMessage: "Time limit reached")
//            LogClass.logThis(logData: "Game Ended")
//            gameinPlay = false
//            //timer.invalidate();
//
//        }
    }
    
    @IBAction func btnStart(_ sender: Any) {
        if gameinPlay == false{
            LogClass.logThis(logData: "Game Started")
            btnStart.isHidden = true;
            gameinPlay = true;
            timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(CompassViewController.startTimer), userInfo: nil, repeats: true)
        }
        
        
    }
    
    @IBAction func pressBtnNotFit(_ sender: Any) {
        LogClass.logThis(logData: "Not Fit Button Clicked")
        if gameinPlay == true {
        //currentImageToSquare.removeAll()
        imageNames.remove(at: 0)
        ///////////
        //allSquares[square!].image = imgSqCars.image;
        if imageToSquare.count > 0 {
            if let data = try? Data(contentsOf: (imageToSquare.first!))
            {
                imageNames.append(String(imageToSquare.first!.lastPathComponent.prefix(2)))
                let image: UIImage = UIImage(data: data)!
                imgSqCars.image = image
                //currentImageToSquare.append(imageToSquare.first!)
                imageToSquare.remove(at:0)
            }
        }else{
            LogClass.logThis(logData: "Game Ended")
            showAlert(theTitle: "Game Complete", theMessage: "The current game is complete. Press OK in order to move onto the next game")
            timer.invalidate();
            imgSqCars.image = nil;
            gameinPlay = false;
            btnNext.isHidden = false
            for element in allSquares
            {
                element.isUserInteractionEnabled = false;
            }
            btnNotFit.isHidden = true
        }
        }
        
    }
    
    
    
    @IBAction func touchSq(_ sender: UITapGestureRecognizer) {
        
        if (time >= MAXTIMEALLOWED){
            showAlert(theTitle: "Time limit", theMessage: "Time limit reached")
            timer.invalidate();
            LogClass.logThis(logData: "Game Ended")
            gameinPlay = false
            btnNext.isHidden = false
        }
        if gameinPlay == true {
            let square = Int(sender.accessibilityLabel!)
            LogClass.logThis(logData: "Square \(square) Clicked")
            
            
            //// point systen
            //            if (currentImageToSquare[(currentImageToSquare.first?.key)!] == square)
            //            {
            //                score = score + 1;
            //                print (score)
            //                currentImageToSquare.removeAll()
            //            }
            
            var squareLabel = "nn"
            squareLabel  = allSquares[square!].accessibilityLabel!
            
            if (squareLabel.utf8CString[0] == imageNames.first!.utf8CString[0])
            {
                score = score + 1;
            }
            if (squareLabel.utf8CString[1] == imageNames.first!.utf8CString[1])
            {
                score = score + 1;
            }
            print (score)
            //currentImageToSquare.removeAll()
            imageNames.remove(at: 0)
            ///////////
            allSquares[square!].image = imgSqCars.image;
            if imageToSquare.count > 0 {
                if let data = try? Data(contentsOf: (imageToSquare.first!))
                {
                    imageNames.append(String(imageToSquare.first!.lastPathComponent.prefix(2)))
                    let image: UIImage = UIImage(data: data)!
                    imgSqCars.image = image
                    //currentImageToSquare.append(imageToSquare.first!)
                    imageToSquare.remove(at:0)
                }
            }else{
                LogClass.logThis(logData: "Game Ended")
                showAlert(theTitle: "Game Complete", theMessage: "The current game is complete. Press OK in order to move onto the next game")
                timer.invalidate();
                imgSqCars.image = nil;
                gameinPlay = false;
                btnNext.isHidden = false
                for element in allSquares
                {
                    element.isUserInteractionEnabled = false;
                }
            }
        } else {
            showAlert(theTitle: "Game not Started!", theMessage: "Please start the game before playing")
            LogClass.logThis(logData: "Game attempted to play without starting")
        }
    }
    
    func showAlert(theTitle: String,theMessage: String)
    {
        let alert = UIAlertController(title: theTitle, message: theMessage, preferredStyle: .alert);
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: { (action) in alert.dismiss(animated: true, completion: nil)

        }))
        self.present(alert,animated: true,completion: nil)
    }
    
    @IBAction func btnNextGame(_ sender: UIButton) {
//        LogClass.logThis(logData: "Next Button Pressed")
//        var fileDirUrl = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("userScore.txt");
//        let contents = String(score)+","+String(time);
//        do{
//            try contents.write(to: fileDirUrl, atomically: true, encoding: String.Encoding.utf8);
//            print("Writen to file" + contents)
//        } catch let error as NSError{
//            print("Failed to write to file")
//            print (error)
//        }
        
        
        var patientID = InterfaceCommunication.patientID.capitalized
        var timeTaken = String(Int(time))
        var score = String(self.score)
        var game = "compass"
        
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
            let storyBoard: UIStoryboard = try UIStoryboard(name: "roadsignrecognition", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "RoadSignRecognitionView")
            self.present(newViewController, animated: true, completion: nil)
        } catch let error  {
            print(error.localizedDescription)
        }
        
    }
    
    @IBAction func btnHelp(_ sender: UIButton) {
        LogClass.logThis(logData: "Help Button Pressed")
        HELPUSED = HELPUSED + 1;
        if HELPUSED < 3 {
            let path = Bundle.main.path(forResource: "Instructions", ofType: "txt", inDirectory: "CompassResources")
            do {
                let content = try String(contentsOfFile:path!, encoding: String.Encoding.utf8)
                
                showAlert(theTitle: "Instructions", theMessage: content)
            } catch _ as NSError {}
        } else {
            showAlert(theTitle: "Instructions", theMessage: "You've used the maximum amount of help requests")
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        allSquares = [self.imgSq0,self.imgSq1,self.imgSq2,self.imgSq3,self.imgSq4,self.imgSq5,self.imgSq6,self.imgSq7,self.imgSq8,self.imgSq9,self.imgSq10,self.imgSq11,self.imgSq12,self.imgSq13,self.imgSq14,self.imgSq15];
        
        tapImgSq0.accessibilityLabel = "0";
        tapImgSq1.accessibilityLabel = "1";
        tapImgSq2.accessibilityLabel = "2";
        tapImgSq3.accessibilityLabel = "3";
        tapImgSq4.accessibilityLabel = "4";
        tapImgSq5.accessibilityLabel = "5";
        tapImgSq6.accessibilityLabel = "6";
        tapImgSq7.accessibilityLabel = "7";
        tapImgSq8.accessibilityLabel = "8";
        tapImgSq9.accessibilityLabel = "9";
        tapImgSq10.accessibilityLabel = "10";
        tapImgSq11.accessibilityLabel = "11";
        tapImgSq12.accessibilityLabel = "12";
        tapImgSq13.accessibilityLabel = "13";
        tapImgSq14.accessibilityLabel = "14";
        tapImgSq15.accessibilityLabel = "15";
        //tapImgSqCars.accessibilityLabel = "16";
        
        
        var imageUrls = [URL]();
        imageUrls = Bundle.main.urls(forResourcesWithExtension: "png", subdirectory: "CompassResources")!
        
        
        
        var i = 0;
        for  url in imageUrls {
            imageToSquare.append(url);
            i = i + 1;
        }
        
        //let resourcepath = Bundle.main.resourceURL;
        
        //print(imageUrls.count);
        
        if imageToSquare.count > 0 {
            if let data = try? Data(contentsOf: (imageToSquare.first!))
            {
            imageNames.append(String(imageToSquare.first!.lastPathComponent.prefix(2)))
                let image: UIImage = UIImage(data: data)!
                imgSqCars.image = image
               // currentImageToSquare.append(imageToSquare.first!)
                imageToSquare.remove(at:0)
            }
        }
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

