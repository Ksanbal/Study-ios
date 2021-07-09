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
    @IBOutlet weak var nameLabelCenterX: NSLayoutConstraint!
    @IBOutlet weak var bountyLableCenterX: NSLayoutConstraint!
    
    let viewModel = DetailViewModel()

    // View가 메모리에 올라가고 나서
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        prepareAnimation()
    }
    
    // View가 그려지고 나서
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showAnimation()
    }
    
    private func prepareAnimation() {
        nameLabel.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).scaledBy(x: 3, y: 3).rotated(by: 180)
        bountyLabel.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).scaledBy(x: 3, y: 3).rotated(by: 180)
        
        nameLabel.alpha = 0
        bountyLabel.alpha = 0
    }
    
    private func showAnimation() {
        UIView.animate(
            withDuration: 1,
            delay: 0.0,
            usingSpringWithDamping: 0.6,    // 통통튀는 애니메이션
            initialSpringVelocity: 2.0,
            options: .allowUserInteraction,
            animations: {
                // 변형되기전의 모습
                self.nameLabel.transform = CGAffineTransform.identity
                self.nameLabel.alpha = 1
            },
            completion: nil
        )
        
        UIView.animate(
            withDuration: 1,
            delay: 0.2,
            usingSpringWithDamping: 0.6,    // 통통튀는 애니메이션
            initialSpringVelocity: 2.0,
            options: .allowUserInteraction,
            animations: {
                self.bountyLabel.transform = CGAffineTransform.identity
                self.bountyLabel.alpha = 1
            },
            completion: nil
        )
        
        UIView.transition(with: imgView, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
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
