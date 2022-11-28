//
//  PhoneCertificationViewController.swift
//  Jigeum-Muhae
//
//  Created by 김진우 on 2022/09/21.
//

import UIKit
import Foundation
import RxSwift
import RxCocoa

class PhoneCertificationViewController: UIViewController {
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var phoneCheckLabel: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    
    var disposeBag = DisposeBag()
    let regex = "^01[0-1, 7][0-9]{8}$"
    var submitCheck: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        bindRx()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.phoneTextField.resignFirstResponder()
    }
    
    func bindRx() {
        // TODO: 전화번호 필드 로직 처리 필요
        // TODO: 조건 검사 로직 추가 필요
        // TODO: 인증번호 화면으로 넘기기 추가 필요 (전화번호를 넣어서 넘겨줘야함)
        
        phoneTextField.rx.text
            .subscribe({ [weak self] (newValue) in
                if newValue.element?.map({String($0)})?.range(of: self!.regex, options: .regularExpression) != nil {
                    self?.phoneTextField.layer.borderColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1).cgColor
                    self?.phoneCheckLabel.isHidden = true
                    self?.submitCheck = true
                } else {
                    self?.phoneTextField.layer.borderColor = UIColor(red: 255/255, green: 59/255, blue: 48/255, alpha: 1).cgColor
                    self?.phoneCheckLabel.isHidden = false
                    self?.submitCheck = false
                }
                self?.phoneTextField.layer.borderWidth = 1.0
            })
            .disposed(by: disposeBag)
        
        submitButton.rx.tap
            .bind { [weak self] _ in
                if self?.submitCheck == true {
                    if let CertificationNumberViewController = UIStoryboard.viewController(storyboardName: "CertificationNumberViewController") as? CertificationNumberViewController {
                        self?.navigationController?.pushViewController(CertificationNumberViewController, animated: true)
                    }
                }
            }.disposed(by: disposeBag)
    }
    
    func setUpUI() {
        let fontColor = UIColor.black
        let text = infoLabel.text!
        let attributedStr = NSMutableAttributedString(string: text)
        attributedStr.addAttribute(.foregroundColor, value: fontColor, range: (text as NSString).range(of: "전화번호"))
        infoLabel.attributedText = attributedStr
        
        phoneTextField.layer.cornerRadius = 10
        phoneTextField.clipsToBounds = true
        submitButton.layer.cornerRadius = 10
        submitButton.clipsToBounds = true
        phoneTextField.keyboardType = .numberPad
        view.setNeedsLayout()
    }
    
}
