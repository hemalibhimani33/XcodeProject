//
//  CustomTableViewCell.swift
//  MiniApplication
//
//  Created by Hemali on 22/05/18.
//  Copyright © 2018 Hemali. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblRollNo: UILabel!
    
    var Name : String = String()
    var RollNo : String = String()
    var ID : Int = Int()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
