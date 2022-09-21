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
        
    }
    
    func setUpUI() {
        phoneTextField.layer.cornerRadius = 10
        submitButton.layer.cornerRadius = 10
    }
    
}
