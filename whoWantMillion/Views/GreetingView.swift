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
        label.text = """
        Привет!
        \n Это игра - Кто хочет стать миллионером?
        \n Введите Ваше имя и нажимайте Старт!
        """
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private(set) lazy var startGameButton: UIButton = {
        let button = UIButton()
        button.setTitle("Старт", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .orange
        button.clipsToBounds = true
        button.layer.cornerRadius = 15
        return button
    }()
    
    private(set) lazy var enterYourNameTextFiled: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите имя"
        textField.layer.borderColor = CGColor(gray: 0, alpha: 1)
        textField.layer.borderWidth = 1
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 5
        textField.textAlignment = .center
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
        addSubview(enterYourNameTextFiled)
    }
    
    private func setConstraintsViews() {
        greetingLabel.snp.makeConstraints { make in
            make.bottom.equalTo(enterYourNameTextFiled.snp.top).offset(-20)
            make.width.equalTo(safeAreaLayoutGuide)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
        }
        enterYourNameTextFiled.snp.makeConstraints { make in
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
