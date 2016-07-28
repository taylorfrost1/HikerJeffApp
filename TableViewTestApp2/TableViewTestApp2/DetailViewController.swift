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
    
    @IBOutlet weak var detailDifficultyLevelLabel: UILabel!
    
    @IBOutlet weak var detailLocationLabel: UILabel!
    
    @IBOutlet weak var detailMilageLabel: UILabel!
    
    @IBOutlet weak var detailElevationChangeLabel: UILabel!
    
    @IBOutlet weak var detailReserveButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailReserveButtonOutlet.layer.cornerRadius = 10
        self.detailImageView.image = UIImage(named:detailVariable!.picture)
        self.detailNameLabel.text = detailVariable?.hike_name
        self.detailInfoLabel.text = detailVariable?.info
        self.detailDifficultyLevelLabel.text = detailVariable?.difficulty
        self.detailLocationLabel.text = detailVariable?.location
        self.detailMilageLabel.text = detailVariable?.milage
        self.detailElevationChangeLabel.text = detailVariable?.elevation_change

    }

}
