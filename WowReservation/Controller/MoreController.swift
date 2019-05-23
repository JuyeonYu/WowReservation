//
//  MoreController.swift
//  WowReservation
//
//  Created by 유씨웨어 on 11/05/2019.
//  Copyright © 2019 ucware. All rights reserved.
//

import UIKit

class MoreController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImage.image = UIImage(named: "danny")
    }
}
