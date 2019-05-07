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
//    var isReservation: [String:Bool]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        cell.classCellDelegate = self
        cell.trainerName.text = "김이박"
        cell.classTitle.text = "지옥에서 온 다이어트 PT"
        cell.classTime.text = "PM 8:30 ~ 9:30"
        cell.trainerProfile.image = UIImage(named: "profile")
        cell.changeTimeButton.isHidden = true
        cell.cancilReservationButton.isHidden = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
}

extension HomeController: ClassCellDelegate {
    func didTabChangeTime(cell: ClassCell) {
        print("didTabChangeTime")
    }
    
    func didTabCancilReservation(cell: ClassCell) {
        let alert = UIAlertController(title: "예약을 취소할까요?", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "네", style: UIAlertAction.Style.default){ (action: UIAlertAction) -> Void in
            cell.isReservation = false
            cell.cancilReservationButton.isHidden = true
            cell.changeTimeButton.isHidden = true
            cell.reservationButton.isHidden = false
            
        })
        alert.addAction(UIAlertAction(title: "아니오", style: .cancel, handler: nil))
        self.present(alert, animated: true)

    }
    
    func didTabReservation(cell: ClassCell) {
        let alert = UIAlertController(title: "예약할까요?", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "네", style: UIAlertAction.Style.default){ (action: UIAlertAction) -> Void in
            print("yes")
            cell.isReservation = true
            cell.cancilReservationButton.isHidden = false
            cell.changeTimeButton.isHidden = false
            cell.reservationButton.isHidden = true
            
        })
        alert.addAction(UIAlertAction(title: "아니오", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
}
