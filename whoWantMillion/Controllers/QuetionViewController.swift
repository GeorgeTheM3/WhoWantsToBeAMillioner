//
//  GameVC.swift
//  whoWantMillion
//
//  Created by Георгий Матченко on 26.08.2022.
//

import Foundation
import UIKit

class QuetionViewController: UIViewController {
    private var questionsView: QuestionsView? {
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
        questionsView?.tableViewAnswers.dataSource = self
        questionsView?.tableViewAnswers.delegate = self
        setQuestionAndCurrentPoints()
    }
    
    private func setQuestionAndCurrentPoints() {
        LocaleStore.shared.curentQuestion = LocaleStore.shared.resultData.randomElement()
        LocaleStore.shared.resultData.removeAll(where: {$0.question == LocaleStore.shared.curentQuestion?.question})
        questionsView?.quationLabel.text = LocaleStore.shared.curentQuestion?.question
        if let points = LocaleStore.shared.curentUser?.points {
            questionsView?.userCurentPointsNumber.text = String(points)
        }
    }
    private func showResultGame() {
        let controller = ResultGameViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    private func checkAnswer(id: Int) -> Int {
        id == LocaleStore.shared.curentQuestion?.id ? 100 : 0
    }
}

extension QuetionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            cell.textLabel?.text = LocaleStore.shared.curentQuestion?.answers[indexPath.row]
            cell.textLabel?.textAlignment = .center
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let number = LocaleStore.shared.curentQuestion?.answers.count {
            return number
        }
        return 0
    }
}

extension QuetionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        LocaleStore.shared.curentUser?.points += checkAnswer(id: indexPath.row)
        guard !LocaleStore.shared.resultData.isEmpty else { return showResultGame()}
        setQuestionAndCurrentPoints()
        questionsView?.tableViewAnswers.reloadData()
    }
}
