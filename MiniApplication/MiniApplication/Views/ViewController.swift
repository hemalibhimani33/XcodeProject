//
//  ViewController.swift
//  MiniApplication
//
//  Created by Hemali on 22/05/18.
//  Copyright © 2018 Hemali. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    let dh : DBManager = DBManager()
    var data : NSMutableArray = NSMutableArray()
    var ID : Int = Int()
    

    @IBOutlet weak var ivData: UITableView!
    
    @IBOutlet weak var btnPlus: UIBarButtonItem!
    @IBAction func btnPlus(_ sender: Any)
    {
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool)
    {
        data = dh.UserName()
        ivData.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! CustomTableViewCell
        let q: Model = data.object(at: indexPath.row) as! Model
        
        cell.lblName.text = String(q.Name)
        print(cell.lblName)
        cell.lblRollNo.text = String(q.RollNo)
        print(cell.lblRollNo)

        let backItem = UIBarButtonItem()
        
        backItem.title = "Data"
        navigationItem.backBarButtonItem = backItem
        return cell
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
//        let q: Model = data.object(at: indexPath.row) as! Model
//        ID = (indexPath.row + 1)
//        dh.delete(Name: q.Name, RollNo: q.RollNo, ID: ID)
        
        
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            let q: Model = data.object(at: indexPath.row) as! Model
           
            if dh.delete(Name: q.Name, RollNo: q.RollNo, ID: q.ID) {
                
                let alert = UIAlertController(title: "Alert", message: "records deleted", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
                data = NSMutableArray()
                
                data = dh.UserName()
                ivData.reloadData()
            }
        }

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let cd : UpdateViewController = self.storyboard?.instantiateViewController(withIdentifier: "UpdateViewController") as! UpdateViewController
        self.navigationController?.pushViewController(cd, animated: true)
        let q: Model = data.object(at: indexPath.row) as! Model
        cd.Name = q.Name
        cd.RollNo = q.RollNo
        cd.ID = (indexPath.row + 1)
        print(cd.ID)
        let backItem = UIBarButtonItem()
        backItem.title = "Data"
        navigationItem.backBarButtonItem = backItem
        
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

}
