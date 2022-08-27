//
//  PresentVC.swift
//  whoWantMillion
//
//  Created by Георгий Матченко on 26.08.2022.
//

import Foundation
import UIKit

class GreetingViewController: UIViewController {
    private var presentView: GreetingView? {
        if let view = self.view as? GreetingView {
            return view
        }
        return nil
    }
    
    override func loadView() {
        super.loadView()
        self.view = GreetingView()
        self.view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presentView?.startGameButton.addTarget(self, action: #selector(startGame), for: .touchUpInside)
    }
    
    @objc func startGame() {
        let controller = QuetionViewController()
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true)
    }
}
