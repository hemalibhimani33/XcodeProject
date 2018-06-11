//
//  Utility.swift
//  DatabaseSemo
//
//  Created by Hemali on 21/05/18.
//  Copyright © 2018 Hemali. All rights reserved.
//

import UIKit

class Utility: NSObject
{
    class func getPath(_ fileName: String) ->String {
        
        let documentURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        let fileURL = documentURL.appendingPathComponent(fileName)
        print(fileURL)
        return fileURL.path
        
    }
    class func copyFile(_ fileName: NSString) {
        
        let dbPath: String = getPath(fileName as String)
        let fileManager = FileManager.default
        if !fileManager.fileExists(atPath: dbPath){
            
            let documentsURL = Bundle.main.resourceURL
            let fromPath = documentsURL!.appendingPathComponent(fileName as String)
            print(fromPath)
            var error : NSError?
            do {
                try fileManager.copyItem(atPath: fromPath.path, toPath: dbPath)
            }
            catch let error1 as NSError{
                error = error1
            }
            if (error != nil){
                print("Error Occured")
                
            }
            else{
                print("Successfully Copy")
            }
        }
    }

}
