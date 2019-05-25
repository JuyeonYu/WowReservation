//
//  classTimeVO.swift
//  WowReservation
//
//  Created by 유씨웨어 on 07/05/2019.
//  Copyright © 2019 ucware. All rights reserved.
//

import Foundation

class ClassModel {
    
    var classKind: classKind?

    var title: String?
    var participatingMember: Int?
    var limitMember: Int?

    var trainerProfileURL: String?
    var trainerName: String?
    
    var date: String? // yy/nn/dd
    var startTime: Int? // hh/mm 시간은 24시간을 쓰고 am, pm 계산
    var endTime: Int? // hh/mm

    var isReservation: Bool = false
}
