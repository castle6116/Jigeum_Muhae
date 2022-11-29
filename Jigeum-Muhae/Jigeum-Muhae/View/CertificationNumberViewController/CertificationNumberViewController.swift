//
//  CertificationNumberViewController.swift
//  Jigeum-Muhae
//
//  Created by 김진우 on 2022/09/23.
//

import UIKit
import Foundation
import RxSwift
import RxCocoa
import SnapKit

class CertificationNumberViewController: UIViewController {
    @IBOutlet weak var infoLabel: UILabel!
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        bindRx()
    }
    
    func bindRx() {
        // ~~TODO: 인증 번호 PinCode 형식으로 입력 받기~~
        // TODO: 인증 번호 API로 통신하여 유효값 확인 후 처리 로직 추가 필요
        
    }
    
    func setUpUI() {
        let fontColor = UIColor.black
        let text = infoLabel.text!
        let attributedStr = NSMutableAttributedString(string: text)
        attributedStr.addAttribute(.foregroundColor, value: fontColor, range: (text as NSString).range(of: "전송된 인증번호"))
        infoLabel.attributedText = attributedStr
        
        let pinView = PinCodeView(numberOfDigits: 6, textType: .numbers, groupingSize: 0, itemSpacing: 0)
        pinView.delegate = self
        pinView.digitViewInit = PinCodeDigitSquareView.init
        pinView.distribution = .equalSpacing
        self.view.addSubview(pinView)
        
        pinView.snp.makeConstraints { make in
            make.top.equalTo(infoLabel.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(52)
        }
    }
    
}

extension CertificationNumberViewController: PinCodeViewDelegate {
    func pinCodeView(_ view: PinCodeView, didSubmitPinCode code: String, isValidCallback callback: @escaping (Bool) -> Void) {
        // TODO: 인증 번호 API로 통신하여 유효값 확인 후 처리 로직 추가 필요
        // TODO: 인증 실패 시 "인증번호를 확인해주세요!" 라벨 및 로직 추가 필요
    }
    
    func pinCodeView(_ view: PinCodeView, didInsertText text: String) {
    }
}
