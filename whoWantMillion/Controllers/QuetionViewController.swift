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
        LocaleStore.shared.currentQuestion = LocaleStore.shared.resultData.randomElement()
        LocaleStore.shared.resultData.removeAll(where: {$0.question == LocaleStore.shared.currentQuestion?.question})
        if let answer = LocaleStore.shared.currentQuestion?.answers[0] {
            LocaleStore.shared.currentAnswer = answer
        }
        questionsView?.quationLabel.text = LocaleStore.shared.currentQuestion?.question
        if let points = LocaleStore.shared.curentUser?.points {
            questionsView?.userCurentPointsNumber.text = String(points)
        }
    }
    private func showResultGame() {
        let controller = ResultGameViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    private func checkAnswer(answer: String) -> Int {
        LocaleStore.shared.currentAnswer == answer ? 100 : 0
    }
}

extension QuetionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            let answer = LocaleStore.shared.currentQuestion?.answers.randomElement()
            LocaleStore.shared.currentQuestion?.answers.removeAll(where: {$0 == answer})
            cell.textLabel?.text = answer
            cell.textLabel?.textAlignment = .center
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let number = LocaleStore.shared.currentQuestion?.answers.count {
            return number
        }
        return 0
    }
}

extension QuetionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let answer = tableView.cellForRow(at: indexPath)?.textLabel?.text {
            LocaleStore.shared.curentUser?.points += checkAnswer(answer: answer)
        }
        if LocaleStore.shared.resultData.isEmpty { return showResultGame()}
        setQuestionAndCurrentPoints()
        questionsView?.tableViewAnswers.reloadData()
    }
}
