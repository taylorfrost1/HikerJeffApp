//
//  DetailViewController.swift
//  TableViewTestApp2
//
//  Created by Taylor Frost on 7/26/16.
//  Copyright © 2016 Taylor Frost. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var detailVariable : Hike?
    
    @IBOutlet weak var detailImageView: UIImageView!
    
    @IBOutlet weak var detailNameLabel: UILabel!
    
    @IBOutlet weak var detailInfoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.detailImageView.image = UIImage(named:detailVariable!.picture)
        self.detailNameLabel.text = detailVariable?.hike_name
        self.detailInfoLabel.text = detailVariable?.info

    }

}
