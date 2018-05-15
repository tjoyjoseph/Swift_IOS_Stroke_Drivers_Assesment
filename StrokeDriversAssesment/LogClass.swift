//
//  SettingsFile.swift
//  TicTacToe
//
//  Created by Toby Thaliaparampil 2014 (N0562762) on 06/12/2017.
//  Copyright © 2017 Toby Thaliaparampil 2014 (N0562762). All rights reserved.
//

import UIKit

class LogClass {
    
    let fileName = "LogData.txt";
    var fileDirUrl:URL;
    
    var logInfo = "";
    
    
    init() {
        
        fileDirUrl = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent(fileName);
        
    }
    
    private static var log = LogClass()
    
    
    
    static func logThis(logData: String)
    {
        // get the current date and time
        let currentDateTime = Date()
        
        // initialize the date formatter and set the style
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .long
        
        // get the date time String from the date object
        let actualdate = formatter.string(from: currentDateTime) // October 8, 2016 at 10:48:53 PM
        
        log.logInfo = logData+" "+actualdate;
        saveToFile()
    }
    
    
    static func saveToFile()
    {
        let currentLogData = retrieveFromFile()
        let logdata = currentLogData + "\n" + log.logInfo
        do{
            try logdata.write(to: log.fileDirUrl, atomically: true, encoding: String.Encoding.utf8);
            print("Writen to file \n" + logdata)
        } catch let error as NSError{
            print("Failed to write to file")
            print (error)
        }
    }
    private static func retrieveFromFile() -> String
    {
        var fileContents: String = "";
        do{
            let fileExists = try log.fileDirUrl.checkResourceIsReachable();
            if fileExists
            {
                fileContents = try String(contentsOf:log.fileDirUrl);
                print("Reading File "+fileContents)
                
            }
        } catch let error as NSError {
            print("Failed to read from file")
            print (error)
        }
        
        return fileContents
    }
    
    
}

