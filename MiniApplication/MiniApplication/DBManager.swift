//
//  DBManager.swift
//  DatabaseSemo
//
//  Created by Hemali on 21/05/18.
//  Copyright © 2018 Hemali. All rights reserved.
//

import UIKit

class DBManager: NSObject
{
    func add(Name : String,RollNo : String) -> Bool {
        let dbConn = FMDatabase(path:Utility.getPath("iHemali.db")as String)
        let addToDb = "INSERT INTO Student (Name,RollNo) VALUES ('\(Name)','\(RollNo)');"

        if (dbConn?.open())! {
            let result = dbConn?.executeUpdate(addToDb, withArgumentsIn: nil)
            if !result! {
                print("Error: \(dbConn?.lastErrorMessage())")
                dbConn?.close()
                return false
            }
            else
            {
                print("Record Add")
                dbConn?.close()
                return true
            }
        }
        else
        {
            print("Error: \(dbConn?.lastErrorMessage())")
            dbConn?.close()
            return false
        }
    }
    
    func update(Name : String,RollNo : String,ID : Int) -> Bool {
        let dbConn = FMDatabase(path:Utility.getPath("iHemali.db")as String)
        let addToDb = "UPDATE Student SET Name = '\(Name)' , RollNo = '\(RollNo)' where ID = '\(ID)'";

        if (dbConn?.open())! {
            let result = dbConn?.executeUpdate(addToDb, withArgumentsIn: nil)
            if !result! {
                print("Error: \(dbConn?.lastErrorMessage())")
                dbConn?.close()
                return false
            }
            else
            {
                print("Record updated")
                dbConn?.close()
                return true
            }
        }
        else
        {
            print("Error: \(dbConn?.lastErrorMessage())")
            dbConn?.close()
            return false
        }
    }
    
    func delete(Name : String,RollNo : String,ID : Int) -> Bool {
        let dbConn = FMDatabase(path:Utility.getPath("iHemali.db")as String)
        let addToDb = "DELETE FROM Student where ID = '\(ID)'";
        
        if (dbConn?.open())! {
            let result = dbConn?.executeUpdate(addToDb, withArgumentsIn: nil)
            if !result! {
                print("Error: \(dbConn?.lastErrorMessage())")
                dbConn?.close()
                return false
            }
            else
            {
                print("Record deleted")
                dbConn?.close()
                return true
            }
        }
        else
        {
            print("Error: \(dbConn?.lastErrorMessage())")
            dbConn?.close()
            return false
        }
    }
    
    func DisplayWatchList() -> NSMutableArray
    {
        let User : NSMutableArray = NSMutableArray()
        let dbConn = FMDatabase(path:Utility.getPath("iHemali.db")as String)
        if (dbConn?.open())!
        {
            let querySqL = "select * from  Student"
            let results : FMResultSet! = dbConn!.executeQuery(querySqL, withArgumentsIn: nil)
            print(querySqL)
            while results!.next() == true
            {
                let cd : Model = Model()
                cd.ID = Int(results.int(forColumn: "ID"))
                cd.Name = results.string(forColumn: "Name")
                cd.RollNo = results.string(forColumn: "RollNo")
                User.add(cd)
            }
            dbConn?.close()
        }
        else
        {
            print("Error:\(dbConn?.lastErrorMessage())")
            
        }
        return User
    }
    
    
    func UserName() -> NSMutableArray
    {
        let User : NSMutableArray = NSMutableArray()
        let dbConn = FMDatabase(path:Utility.getPath("iHemali.db")as String)
        if (dbConn?.open())!
        {
            let querySqL = "select * from Student"
            let results : FMResultSet! = dbConn!.executeQuery(querySqL, withArgumentsIn: nil)
            print(querySqL)
            while results!.next() == true
            {
                let Users : Model = Model()
                
                Users.ID = Int(results.int(forColumn: "ID"))
                Users.Name = results.string(forColumn: "Name")
                Users.RollNo = results.string(forColumn: "RollNo")
                
                User.add(Users)
            }
            dbConn?.close()
        }
        else
        {
            print("Error:\(dbConn?.lastErrorMessage())")
            
        }
        return User
    }

}
