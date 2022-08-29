//
//  ResultGameView.swift
//  whoWantMillion
//
//  Created by Георгий Матченко on 27.08.2022.
//

import Foundation
import UIKit

class ResultGameView: UIView {
    private(set) lazy var congratulationsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    private(set) lazy var resultPoints: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    private(set) lazy var restartGameButton: UIButton = {
        let button = UIButton()
        button.setTitle("Заново", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .orange
        button.clipsToBounds = true
        button.layer.cornerRadius = 15
        return button
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
        addSubview(congratulationsLabel)
        addSubview(resultPoints)
        addSubview(restartGameButton)
    }
    
    private func setConstraintsViews() {
        congratulationsLabel.snp.makeConstraints { make in
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.centerY.equalTo(safeAreaLayoutGuide.snp.centerY).offset(-100)
            make.width.equalTo(safeAreaLayoutGuide).inset(20)
            make.height.equalTo(50)
        }
        resultPoints.snp.makeConstraints { make in
            make.top.equalTo(congratulationsLabel.snp.bottom).offset(25)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.width.equalTo(congratulationsLabel.snp.width)
        }
        restartGameButton.snp.makeConstraints { make in
            make.top.equalTo(resultPoints.snp.bottom).offset(50)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
    }
}

