//
//  classTimeVO.swift
//  WowReservation
//
//  Created by 유씨웨어 on 07/05/2019.
//  Copyright © 2019 ucware. All rights reserved.
//

import Foundation

class ClassTimeVO {
    var title: String?
    var participatingMember: Int?
    var limitMember: Int?

    var trainerProfileURL: String?
    var trainerName: String?
    
    var date: String?
    var startTime: Double?
    var endTime: Double?

    var isReservation: Bool = false
}
