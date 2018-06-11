//
//  DataViewController.swift
//  MiniApplication
//
//  Created by Hemali on 22/05/18.
//  Copyright © 2018 Hemali. All rights reserved.
//

import UIKit

class DataViewController: UIViewController, UITextFieldDelegate
{
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var lblRollNo: UILabel!
    @IBOutlet weak var txtRollNo: UITextField!
    
    var Name : String = String()
    var RollNo : String = String()
    let dh : DBManager = DBManager()
    var marrDataDisplay: NSMutableArray = NSMutableArray()
    
    override func viewDidLoad()
    {
        txtName.delegate = self
        txtRollNo.delegate = self
        super.viewDidLoad()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }

    @IBAction func btnInsert(_ sender: Any)
    {
        if (txtName.text != "") && (txtRollNo.text != "")
        {
            let alert = UIAlertController(title: "Alert", message: "inserted successfully ", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (act) in
            self.navigationController?.popToRootViewController(animated: true)
            }))
            self.present(alert, animated: true, completion: nil)
            dh.add(Name: txtName.text!, RollNo: txtRollNo.text!)
           // dh.update(Name: txtName.text!, RollNo: txtRollNo.text!)
        }
        else{
            if Name == ""
            {
                self.alert(msg: "enter name")
            }
            if RollNo == ""
            {
                self.alert(msg: "enter roll no")
            }
        }
        self.txtName.text = ""
        self.txtRollNo.text = ""

    }
    func alert(msg: String){
        let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    

}
