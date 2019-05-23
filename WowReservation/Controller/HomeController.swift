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
    let dateFormatter = DateFormatter()

    var classModelList = [ClassModel]()
    var classListEachDay = [String : [ClassModel]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        let cal = Calendar.current

/*
         날짜별로 각기 다른 클래스를 테이블뷰로 조회해야함
         
         테이블뷰 생성 로직
         1. view 생성
         2. 모델 생성
         3. 모델 리스트 생성
         4. 모델 리스트에 값 세팅
         5. 날짜 별 모델 리스트 생성 [string(날짜):[model]] 형식으로 만듦
*/
        // config calendasr
        calendar.scrollDirection = .vertical
        dateFormatter.dateStyle = .short
        
        //config classTimeTableview
        classTimeTableview.showsVerticalScrollIndicator = false
//        classTimeTableview.allowsSelection = false

//         주간 모드로 변경
//        calendar.scope = .week
//        calendar.allowsMultipleSelection = true;
        
        
        // 더미 삽입
        for i in 1 ... 9 {
            let classModel = ClassModel()
            classModel.title = "헬게이트 오픈 PT\(i)"
            classModel.trainerName = "김종국"
            classModel.trainerProfileURL = "profile"
            classModelList.append(classModel)
        }
        
        classListEachDay["23/05/2019"] = classModelList
        classModelList.removeAll()

        for i in 1 ... 9 {
            let classModel = ClassModel()
            classModel.title = "군대식 다이어트\(i)"
            classModel.trainerName = "대니강"
            classModel.trainerProfileURL = "danny"

            classModelList.append(classModel)
        }
        classListEachDay["22/05/2019"] = classModelList
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
        
        let selectedDate = dateFormatter.string(from: self.calendar.selectedDate ?? self.calendar.today!)
        
        cell.classCellDelegate = self
        cell.tag = indexPath.row

//        cell.classTitle.text = classModelList[row].title ?? "기본"
        cell.trainerName.text = classListEachDay[selectedDate]?[row].trainerName ?? "김종구"
        cell.classTitle.text = classListEachDay[selectedDate]?[row].title ?? "피티가 다 똑같지 뭐"
        cell.trainerProfile.image = UIImage(named:classListEachDay[selectedDate]?[row].trainerProfileURL ?? "defaultProfile")
        cell.classTime.text = "PM 8:30 ~ 9:30"
        
        if classModelList[cell.tag].isReservation {
            cell.cancilReservationButton.isHidden = false
            cell.reservationButton.isHidden = true
        } else {
            cell.cancilReservationButton.isHidden = true
            cell.reservationButton.isHidden = false
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if classModelList[indexPath.row].isReservation {
            print("\(indexPath.row) 번째 예약됨")
        } else {
            print("\(indexPath.row) 번째 예약안됨")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classModelList.count
    }
}

extension HomeController: ClassCellDelegate {

    
    func didTabCancilReservation(cell: ClassCell) {
        let alert = UIAlertController(title: "예약을 취소할까요?", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "네", style: UIAlertAction.Style.default){ (action: UIAlertAction) -> Void in
            self.classModelList[cell.tag].isReservation = false
            cell.isReservation = false
            cell.cancilReservationButton.isHidden = true
            cell.reservationButton.isHidden = false
        })
        alert.addAction(UIAlertAction(title: "아니오", style: .cancel, handler: nil))
        self.present(alert, animated: true)

    }
    
    func didTabReservation(cell: ClassCell) {
        let alert = UIAlertController(title: "예약할까요?", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "네", style: UIAlertAction.Style.default){ (action: UIAlertAction) -> Void in
            print("yes")
            self.classModelList[cell.tag].isReservation = true

            cell.isReservation = true
            cell.cancilReservationButton.isHidden = false
            cell.reservationButton.isHidden = true
            
        })
        alert.addAction(UIAlertAction(title: "아니오", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
}
