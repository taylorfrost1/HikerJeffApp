//
//  DateTableViewCell.swift
//  PracticeReservationScreen
//
//  Created by Taylor Frost on 7/28/16.
//  Copyright © 2016 Taylor Frost. All rights reserved.
//

import UIKit

class DateTableViewCell: UITableViewCell {

    @IBOutlet weak var tableViewDateLabel: UILabel!

    func yes() {
        
        self.tableViewDateLabel.layer.cornerRadius = 10
    }
    
    
}
