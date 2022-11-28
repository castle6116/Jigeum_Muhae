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

class CertificationNumberViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var infoLabel: UILabel!
    var disposeBag = DisposeBag()
    
    @IBOutlet weak var oneTextField: UITextField!
    @IBOutlet weak var twoTextField: UITextField!
    @IBOutlet weak var threeTextField: UITextField!
    @IBOutlet weak var fourTextField: UITextField!
    @IBOutlet weak var fiveTextField: UITextField!
    @IBOutlet weak var sixTextField: UITextField!
    var textfieldList: [UITextField] = []
    var indexNum: Int = 0
    var firstResponderIsLocked: Bool = false
    var text: String = ""
    
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
        textfieldList = [oneTextField, twoTextField, threeTextField, fourTextField, fiveTextField, sixTextField]
        let fontColor = UIColor.black
        let text = infoLabel.text!
        let attributedStr = NSMutableAttributedString(string: text)
        attributedStr.addAttribute(.foregroundColor, value: fontColor, range: (text as NSString).range(of: "전송된 인증번호"))
        infoLabel.attributedText = attributedStr
        textfieldList.forEach {
            $0.delegate = self
            $0.keyboardType = .numberPad
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        
        guard let stringRange = Range(range, in: currentText) else { return false }
        
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        indexNum = updatedText.count - 1
        return updatedText.count <= 6
    }
    
    func textCheck(_ text: String) {
        var textList = self.text.map{String($0)}
        print(textList)
        if textList.count > 0 {
            for i in indexNum..<textfieldList.count {
                textfieldList[i].text = ""
            }
            textfieldList[indexNum].text = textList[indexNum]
        }
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        DispatchQueue.main.async {
            self.text = textField.text ?? ""
            self.textCheck(self.text)
            print("text:  ",self.text)
            print("field: ",textField.text)
        }
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return !firstResponderIsLocked
    }
    
}
