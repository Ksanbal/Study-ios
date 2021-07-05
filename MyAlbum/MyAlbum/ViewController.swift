//
//  ViewController.swift
//  MyAlbum
//
//  Created by 김현균 on 2021/07/05.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showAlert(_ sender: Any) {
        // 팝업될 내용 설정
        let alert = UIAlertController(
            title:"Hello",
            message: "My First App!!",
            preferredStyle: .alert
        )
        // 팝업에 추가될 버튼 기능 설정
        let action = UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil
        )
        // 버튼 기능을 팝업에 추가
        alert.addAction(action)

        // 팝업을 띄우는 코드
        present(alert, animated: true, completion: nil)
    }
    
}

