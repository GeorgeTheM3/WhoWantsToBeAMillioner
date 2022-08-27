//
//  ResultGameViewController.swift
//  whoWantMillion
//
//  Created by Георгий Матченко on 27.08.2022.
//

import Foundation
import UIKit

class ResultGameViewController: UIViewController {
    private var resultGameView: ResultGameView? {
        if let view = self.view as? ResultGameView {
            return view
        }
        return nil
    }
    
    override func loadView() {
        super.loadView()
        self.view = ResultGameView()
        resultGameView?.restartGameButton.addTarget(self, action: #selector(restartGame), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultGameView?.backgroundColor = .white
        showUserAndPoints()
    }
    // как правильно реализовать рестарт игры
    @objc private func restartGame() {
        let controller = GreetingViewController()
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true)
    }
    
    private func showUserAndPoints() {
        if let user = LocaleStore.shared.curentUser?.name, let points = LocaleStore.shared.curentUser?.points {
            resultGameView?.congratulationsLabel.text = "Поздравляем, \(user)!"
            resultGameView?.resultPoints.text = "Вы набрали \(points) очков"
        }
    }
}
