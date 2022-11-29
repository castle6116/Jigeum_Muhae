//
//  PinCodeDigitSquareView.swift
//  PinCodeView
//
//  Created by Ariel Pollack on 02/04/2017.
//  Copyright © 2017 Dapulse. All rights reserved.
//
import UIKit
import SnapKit

public class PinCodeDigitSquareView: UILabel, PinCodeDigitView {
    
    public var state: PinCodeDigitViewState! = .empty {
        didSet {
            if state != oldValue {
                configure(withState: state)
            }
        }
    }
    
    public var digit: String? {
        didSet {
            guard digit != oldValue else { return }
            self.state = .empty
            self.text = digit
        }
    }
    
    convenience required public init() {
        self.init(frame: .zero)
        
        self.textAlignment = .center
        self.font = UIFont(name: "Pretendard-Medium", size: 16)
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 10
        self.textColor = UIColor(red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1)
        self.configure(withState: .empty)
        
        translatesAutoresizingMaskIntoConstraints = false
        self.view.snp.makeConstraints { make in
            make.width.equalTo(52)
        }
    }
    
    public func configure(withState state: PinCodeDigitViewState) {
        switch state {
        case .empty:
            layer.borderColor = UIColor(red: 151.0/255.0, green: 151.0/255.0, blue: 151.0/255.0, alpha: 1).cgColor
        case .hasDigit:
            layer.borderColor = UIColor(red: 0, green: 122/255.0, blue: 255/255.0, alpha: 1).cgColor
        case .failedVerification:
            layer.borderColor = UIColor(red: 255/255.0, green: 59/255.0, blue: 48/255.0, alpha: 1).cgColor
        }
    }
}
