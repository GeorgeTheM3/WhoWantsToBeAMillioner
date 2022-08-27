//
//  GameVC.swift
//  whoWantMillion
//
//  Created by Георгий Матченко on 26.08.2022.
//

import Foundation
import UIKit

class QuetionViewController: UIViewController {
    private var gameView: QuestionsView? {
        if let view = self.view as? QuestionsView {
            return view
        }
        return nil
    }
    
    override func loadView() {
        super.loadView()
        self.view = QuestionsView()
        self.view.backgroundColor = .white

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameView?.tableViewAnswers.dataSource = self
        gameView?.tableViewAnswers.delegate = self
        setQuestion()
    }
    
    func setQuestion() {
        gameView?.quationLabel.text = quetion1.question
    }
}

extension QuetionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            let a = quetion1.answers[indexPath.row]
            for data in a {
                cell.textLabel?.text = data.key
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
}

extension QuetionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
