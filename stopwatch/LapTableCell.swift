//
//  LapTableCell.swift
//  stopwatch
//
//  Created by Nency on 2021-01-19.
//  Copyright © 2021 Nency. All rights reserved.
//

import UIKit

class LapTableCell : UITableViewCell {
    
    @IBOutlet weak var lapTime: UITextField!
    @IBOutlet weak var lapCount: UITextField!
    
    func initCell(time: String, count: String){
        lapTime.text = time
        lapCount.text = count
    }
}
