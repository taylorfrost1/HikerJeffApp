//
//  DetailHikeViewController.swift
//  FacebookFirebaseIntegrationTest2
//
//  Created by Taylor Frost on 8/3/16.
//  Copyright © 2016 Taylor Frost. All rights reserved.
//

import UIKit

class DetailHikeViewController: UIViewController {
    
    var detailVariable: Hike?

    @IBOutlet weak var detailImageView: UIImageView!
    
    @IBOutlet weak var detailNameLabel: UILabel!
    
    @IBOutlet weak var detailDifficultyLabel: UILabel!
    
    @IBOutlet weak var detailLocationLabel: UILabel!
    
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    @IBOutlet weak var detailMilageLabel: UILabel!
    
    @IBOutlet weak var detailElevationLabel: UILabel!
    
    @IBOutlet weak var detailReserveButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailReserveButton.layer.cornerRadius = 10
        self.detailImageView.image = UIImage(named:detailVariable!.picture)
        self.detailNameLabel.text = detailVariable?.hike_name
        self.detailDescriptionLabel.text = detailVariable?.info
        self.detailDifficultyLabel.text = detailVariable?.difficulty
        self.detailLocationLabel.text = detailVariable?.location
        self.detailMilageLabel.text = detailVariable?.milage
        self.detailElevationLabel.text = detailVariable?.elevation_change

    }
    
    @IBAction func reserveButtonTapped(sender: UIButton) {
        
        performSegueWithIdentifier("reservationScreenSegue", sender: self)
        
        
    }
    
    
    

}
