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
    
    var classTimeVOList = [ClassTimeVO]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // config calendasr
        calendar.scrollDirection = .vertical
        
        //config classTimeTableview
        classTimeTableview.showsVerticalScrollIndicator = false
//        classTimeTableview.allowsSelection = false

//         주간 모드로 변경
//        calendar.scope = .week
//        calendar.allowsMultipleSelection = true;
        
        for i in 1 ... 9 {
            let classTimeVO = ClassTimeVO()
            classTimeVO.title = "헬게이트 오픈 PT\(i)"
            classTimeVOList.append(classTimeVO)
        }
        
        print("리스트 갯수는 \(classTimeVOList.count)")
    }
    
    @IBAction func didTabTodaysWork(_ sender: Any) {
    }
}

extension HomeController: FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print("didSelect: \(date)")
        self.classTimeTableview.reloadData()
    }
}

extension HomeController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "classCell", for: indexPath) as! ClassCell
        let row = indexPath.row
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        let selectedDate = dateFormatter.string(from: self.calendar.today ?? self.calendar.today!)
        
        cell.classCellDelegate = self
        cell.trainerName.text = "김이박"
        cell.classTitle.text = classTimeVOList[row].title
        cell.tag = indexPath.row

        cell.classTime.text = "PM 8:30 ~ 9:30"
        cell.trainerProfile.image = UIImage(named: "profile")
        
        if classTimeVOList[cell.tag].isReservation {
            cell.cancilReservationButton.isHidden = false
            cell.changeTimeButton.isHidden = false
            cell.reservationButton.isHidden = true
        } else {
            cell.cancilReservationButton.isHidden = true
            cell.changeTimeButton.isHidden = true
            cell.reservationButton.isHidden = false
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if classTimeVOList[indexPath.row].isReservation {
            print("\(indexPath.row) 번째 예약됨")
        } else {
            print("\(indexPath.row) 번째 예약안됨")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classTimeVOList.count
    }
}

extension HomeController: ClassCellDelegate {
    func didTabChangeTime(cell: ClassCell) {
        print("didTabChangeTime")
    }
    
    func didTabCancilReservation(cell: ClassCell) {
        let alert = UIAlertController(title: "예약을 취소할까요?", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "네", style: UIAlertAction.Style.default){ (action: UIAlertAction) -> Void in
            self.classTimeVOList[cell.tag].isReservation = false
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
            self.classTimeVOList[cell.tag].isReservation = true

            cell.isReservation = true
            cell.cancilReservationButton.isHidden = false
            cell.changeTimeButton.isHidden = false
            cell.reservationButton.isHidden = true
            
        })
        alert.addAction(UIAlertAction(title: "아니오", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
}
