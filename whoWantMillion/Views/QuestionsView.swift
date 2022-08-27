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
        label.text = "Quation"
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
    private(set) lazy var userCurentPoints: UILabel = {
        let label = UILabel()
        label.text = "Your points:"
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
        addSubview(userCurentPoints)
    }
    
    private func setConstraintsViews() {
        userCurentPoints.snp.makeConstraints { make in
            make.leading.equalTo(safeAreaLayoutGuide).offset(30)
            make.top.equalTo(safeAreaLayoutGuide).offset(30)
        }
        quationLabel.snp.makeConstraints { make in
            make.centerY.equalTo(safeAreaLayoutGuide.snp.centerY).offset(-100)
            make.width.equalTo(safeAreaLayoutGuide).offset(-50)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
        }
        tableViewAnswers.snp.makeConstraints { make in
            make.width.equalTo(safeAreaLayoutGuide).offset(-100)
            make.height.equalTo(200) 
            make.top.equalTo(quationLabel.snp.bottom).offset(30)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
        }
    }
}