//
//  classCell.swift
//  WowReservation
//
//  Created by 유씨웨어 on 06/05/2019.
//  Copyright © 2019 ucware. All rights reserved.
//

import UIKit

class ClassCell: UITableViewCell {
    @IBOutlet weak var trainerProfile: UIImageView!
    @IBOutlet weak var trainerName: UILabel!
    @IBOutlet weak var classTitle: UILabel!
    @IBOutlet weak var participatingNumber: UILabel!
    @IBOutlet weak var classTime: UILabel!
    
    @IBOutlet weak var changeTimeButton: UIButton!
    @IBOutlet weak var reservationButton: UIButton!
    
    weak var classCellDelegate: ClassCellDelegate?
    
    @IBAction func didTabChangeTime(_ sender: Any) {
        print("didTabChangeTime")
    }
    @IBAction func didTabReservation(_ sender: Any) {
        classCellDelegate?.didTabReservation(cell: self)
    }
}

protocol ClassCellDelegate: class {
    func didTabReservation(cell: ClassCell)
}
