//
//  CreateClassController.swift
//  WowReservation
//
//  Created by 주연  유 on 02/06/2019.
//  Copyright © 2019 ucware. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class CreateClassController: UIViewController {
    
    @IBOutlet weak var trainerNameTextField: UITextField!
    @IBOutlet weak var classTitleTextField: UITextField!
    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var endDatePickter: UIDatePicker!
    @IBAction func didTapCreateButton(_ sender: Any) {
        let classTitle = classTitleTextField.text
        let startDate = startDatePicker.date.millisecondsSince1970
        let endDate = endDatePickter.date.millisecondsSince1970
        
        let parameters : [String : Any] = [
                "userId":"remake111", // 작성자 아이디
                "title":classTitle ?? "헬파티", // 제목
                "body":"", // (Optional) 본문 내용
                "startAt":startDate, // 시작시각 (UTC)
                "endAt":endDate, // 종료시각 (UTC)
                "maxMember":10 // (Optional) 최대 참여인원 (default 0 : 무제한)
            ]
        
        // create class
        Alamofire.request(
//            "http://ucband.ucwaremobile.com:8899/center/1/class",
            "http://10.66.114.34:8899/center/1/class",
            method: .post,
            parameters: parameters,
            encoding: JSONEncoding.default,
            headers: ["Content-Type":"application/json", "Accept":"application/json"])
            .validate(statusCode: 200..<300)
            .responseJSON {
                (response) in
                if let JSON = response.result.value {
                    print(JSON)
                }
        }
        
    }
}

extension Date {
    var millisecondsSince1970:Int {
        return Int((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    
    init(milliseconds:Int) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }
}
