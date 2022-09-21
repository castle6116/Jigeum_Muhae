//
//  LoginViewController.swift
//  Jigeum-Muhae
//
//  Created by 김진우 on 2022/09/21.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {
    @IBOutlet weak var loginButton: UIButton!
    
    var disposBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        bindRx()
    }
    
    func bindRx() {
        // TODO: 로그인 로직 처리 필요
        loginButton.rx.tap.bind { _ in
            if let PhoneCertification = UIStoryboard.viewController(storyboardName: "PhoneCertificationViewController") as? PhoneCertificationViewController {
                self.navigationController?.pushViewController(PhoneCertification, animated: true)
            }
        }.disposed(by: disposBag)
    }
    
    func setUpUI() {
        
    }
}
