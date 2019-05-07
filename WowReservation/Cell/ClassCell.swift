//
//  classCell.swift
//  WowReservation
//
//  Created by 유씨웨어 on 06/05/2019.
//  Copyright © 2019 ucware. All rights reserved.
//

import UIKit

class ClassCell: UITableViewCell {
    var isReservation: Bool = false

    @IBOutlet weak var trainerProfile: UIImageView!
    @IBOutlet weak var trainerName: UILabel!
    @IBOutlet weak var classTitle: UILabel!
    @IBOutlet weak var participatingNumber: UILabel!
    @IBOutlet weak var classTime: UILabel!
    
    @IBOutlet weak var changeTimeButton: UIButton!
    @IBOutlet weak var reservationButton: UIButton!
    @IBOutlet weak var cancilReservationButton: UIButton!
        
    weak var classCellDelegate: ClassCellDelegate?
    
    @IBAction func didTabChangeTime(_ sender: Any) {
        print("didTabChangeTime")
        classCellDelegate?.didTabChangeTime(cell: self)
    }
    @IBAction func didTabReservation(_ sender: Any) {
        classCellDelegate?.didTabReservation(cell: self)
    }
    @IBAction func didTabCancilReservation(_ sender: Any) {
        classCellDelegate?.didTabCancilReservation(cell: self)
    }
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//    }
//
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        trainerProfile = nil
//        trainerName = nil
//        classTime = nil
//        participatingNumber = nil
//        classTitle = nil
//        cancilReservationButton = nil
//        reservationButton = nil
//        changeTimeButton = nil
//    }
}

protocol ClassCellDelegate: class {
    func didTabReservation(cell: ClassCell)
    func didTabCancilReservation(cell: ClassCell)
    func didTabChangeTime(cell: ClassCell)
}
