//
//  ViewController.swift
//  AADImplementation
//
//  Created by Toby Thaliaparampil 2014 (N0562762) on 12/02/2018.
//  Copyright © 2018 Toby Thaliaparampil 2014 (N0562762). All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pressBtn(_ sender: Any) {

        
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "dotcancellation", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "DotCancellationView")
        self.present(newViewController, animated: true, completion: nil)
        
        
    }
    
}

