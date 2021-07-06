//
//  ViewController.swift
//  MyAlbum
//
//  Created by 김현균 on 2021/07/06.
//

import UIKit

class ViewController: UIViewController {
    var cureentValue: Int = 0
    
    @IBOutlet weak var priceLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        refresh()
    }


    @IBAction func showAlert(_ sender: Any) {
        let message = "가격은 ₩\(cureentValue) 입니다."
        
        // 팝업될 내용 설정
        let alert = UIAlertController(
            title:"Hello",
            message: message,
            preferredStyle: .alert
        )
        // 팝업에 추가될 버튼 기능 설정
        let action = UIAlertAction(
            title: "OK",
            style: .default,
            handler: {
                action in self.refresh()
            }
        )
        // 버튼 기능을 팝업에 추가
        alert.addAction(action)
        // 팝업을 띄우는 코드
        present(alert, animated: true, completion: nil)
    }
    
    func refresh(){
        let randomPrice = arc4random_uniform(10000) + 1
        cureentValue = Int(randomPrice)
        priceLabel.text = "₩ \(cureentValue)"
    }
}

