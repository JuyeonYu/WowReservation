//
//  HomeController.swift
//  WowReservation
//
//  Created by 유씨웨어 on 05/05/2019.
//  Copyright © 2019 ucware. All rights reserved.
//

import UIKit
import FSCalendar

class HomeController: UIViewController {
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var timeTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        calendar.scrollDirection = .vertical
        
//         주간 모드로 변경
//        calendar.scope = .week
//        calendar.allowsMultipleSelection = true;
    }
}

extension HomeController: FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print("didSelect: \(date)")
    }
}
