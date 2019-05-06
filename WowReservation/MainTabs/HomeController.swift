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
    @IBOutlet weak var classTimeTableview: UITableView!
    @IBOutlet weak var weekOrMonth: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        
        // config calendasr
        calendar.scrollDirection = .vertical

//         주간 모드로 변경
//        calendar.scope = .week
//        calendar.allowsMultipleSelection = true;
            }
    
    @IBAction func didTabTodaysWork(_ sender: Any) {
    }
}

extension HomeController: FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print("didSelect: \(date)")
    }
}

extension HomeController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "classCell", for: indexPath) as! ClassCell
        cell.trainerName.text = "김이박"
        cell.classTitle.text = "지옥에서 온 다이어트 PT"
        cell.classTime.text = "PM 8:30 ~ 9:30"
        cell.trainerProfile.image = UIImage(named: "profile")

        return cell

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
        
    }
    
}
