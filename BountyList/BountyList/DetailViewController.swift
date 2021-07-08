//
//  DetailViewController.swift
//  BountyList
//
//  Created by 김현균 on 2021/07/08.
//

import UIKit

class DetailViewController: UIViewController {
    // MVVM
    
    // Model
    //  - BountyInfo
    
    // View
    //  - ImgView, nameLabel, bountyLabel - ListCell
    //  > view들은 viewModel을 통해서 구성되기?
    
    // ViewModel
    //  - DetailViewModel
    //  > 뷰레이어에서 필요한 메서드 만들기
    //  > 모델 가지고 있기...BountyInfo 등
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    let viewModel = DetailViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        if let bountyInfo = viewModel.bountyInfo {
            imgView.image = bountyInfo.image
            nameLabel.text = bountyInfo.name
            bountyLabel.text = String(bountyInfo.bounty)
        }
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}


class DetailViewModel {
    var bountyInfo: BountyInfo?
    
    func update(model: BountyInfo?) {
        bountyInfo = model
    }
}
