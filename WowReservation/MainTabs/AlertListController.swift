//
//  AlertListController.swift
//  WowReservation
//
//  Created by 유씨웨어 on 11/05/2019.
//  Copyright © 2019 ucware. All rights reserved.
//

import UIKit

class AlertListController: UIViewController {
    @IBOutlet weak var alertListTableView: UITableView!
    var AlertVOList = [AlertVO]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1 ... 9 {
            let alertVO = AlertVO()
            alertVO.isRead = false
            alertVO.content = "Danny님이 프로젝트에 참여합니다\(i)"
            AlertVOList.append(alertVO)
        }
    }
}

extension AlertListController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AlertVOList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "alertCell", for: indexPath) as! AlertCell
        let row = indexPath.row
        
        cell.content.text = AlertVOList[row].content
        
        cell.profileImage.image = UIImage(named: "danny")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)번째 탭")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}
