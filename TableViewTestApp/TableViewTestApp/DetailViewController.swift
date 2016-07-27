//
//  DetailViewController.swift
//  TableViewTestApp
//
//  Created by Taylor Frost on 7/26/16.
//  Copyright © 2016 Taylor Frost. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var detailVariable : Hike?
    var recievedImage = UIImage()
    
    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailHikeName: UILabel!
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.detailImageView.image = UIImage(named:detailVariable!.picture)
        self.detailHikeName.text = detailVariable?.hike_name
        self.detailDescriptionLabel.text = detailVariable?.info

    }

}
