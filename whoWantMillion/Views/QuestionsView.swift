//
//  GameView.swift
//  whoWantMillion
//
//  Created by Георгий Матченко on 26.08.2022.
//

import Foundation
import UIKit
import SnapKit

class QuestionsView: UIView {
    private(set) lazy var quationLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    private(set) lazy var tableViewAnswers: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.isScrollEnabled = false
        return tableView
    }()
    private(set) lazy var userCurentPointsLabel: UILabel = {
        let label = UILabel()
        label.text = "Ваши очки:"
        return label
    }()
    private(set) lazy var userCurentPointsNumber: UILabel = {
        let label = UILabel()
        label.text = "0"
        return label
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
        addSubview(quationLabel)
        addSubview(tableViewAnswers)
        addSubview(userCurentPointsLabel)
        addSubview(userCurentPointsNumber)
    }
    
    private func setConstraintsViews() {
        userCurentPointsLabel.snp.makeConstraints { make in
            make.leading.equalTo(safeAreaLayoutGuide).offset(30)
            make.top.equalTo(safeAreaLayoutGuide).offset(0)
            make.height.equalTo(20)
            make.width.equalTo(90)
        }
        userCurentPointsNumber.snp.makeConstraints { make in
            make.leading.equalTo(userCurentPointsLabel.snp.trailing).offset(10)
            make.top.equalTo(safeAreaLayoutGuide).offset(0)
            make.width.equalTo(100)
            make.height.equalTo(userCurentPointsLabel.snp.height)
        }
        quationLabel.snp.makeConstraints { make in
            make.centerY.equalTo(safeAreaLayoutGuide.snp.centerY).offset(-150)
            make.width.equalTo(safeAreaLayoutGuide).offset(-50)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.height.equalTo(200)
        }
        tableViewAnswers.snp.makeConstraints { make in
            make.width.equalTo(safeAreaLayoutGuide).offset(-100)
            make.height.equalTo(200) 
            make.top.equalTo(quationLabel.snp.bottom).offset(30)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
        }
    }
}
