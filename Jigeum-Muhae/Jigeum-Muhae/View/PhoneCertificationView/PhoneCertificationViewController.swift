//
//  PhoneCertificationViewController.swift
//  Jigeum-Muhae
//
//  Created by 김진우 on 2022/09/21.
//

import UIKit
import RxSwift
import RxCocoa

class PhoneCertificationViewController: UIViewController {
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        bindRx()
    }
    
    func bindRx() {
        // TODO: 전화번호 필드 로직 처리 필요
        // TODO: 조건 검사 로직 추가 필요
        // TODO: 인증번호 화면으로 넘기기 추가 필요 (전화번호를 넣어서 넘겨줘야함)
    }
    
    func setUpUI() {
        phoneTextField.layer.cornerRadius = 10
        submitButton.layer.cornerRadius = 10
    }
    
}
