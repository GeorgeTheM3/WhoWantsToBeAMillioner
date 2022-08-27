//
//  PresentView.swift
//  whoWantMillion
//
//  Created by Георгий Матченко on 26.08.2022.
//

import Foundation
import UIKit
import SnapKit

class GreetingView: UIView {
    private lazy var greetingLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello, man! This is game Who want a million? \n Do you want a play?"
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private(set) lazy var startGameButton: UIButton = {
        let button = UIButton()
        button.setTitle("Start", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .cyan
        return button
    }()
    
    private(set) lazy var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your name"
        textField.layer.borderColor = CGColor(gray: 0, alpha: 1)
        textField.layer.borderWidth = 1
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        setConstraintsViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addViews()
        setConstraintsViews()
    }
    
    private func addViews() {
        addSubview(greetingLabel)
        addSubview(startGameButton)
        addSubview(textField)
    }
    
    private func setConstraintsViews() {
        greetingLabel.snp.makeConstraints { make in
            make.bottom.equalTo(textField.snp.top).offset(-20)
            make.width.equalTo(safeAreaLayoutGuide)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
        }
        textField.snp.makeConstraints { make in
            make.bottom.equalTo(startGameButton.snp.top).offset(-20)
            make.width.equalTo(250)
            make.height.equalTo(50)
            make.centerX.equalTo(startGameButton.snp.centerX)
        }
        startGameButton.snp.makeConstraints { make in
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.centerY.equalTo(safeAreaLayoutGuide.snp.centerY)
            make.width.equalTo(100)
        }
    }
}
