//
//  PresentVC.swift
//  whoWantMillion
//
//  Created by Георгий Матченко on 26.08.2022.
//

import Foundation
import UIKit

class GreetingViewController: UIViewController {
    private var greetingView: GreetingView? {
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
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.global().async {
            NetworkManager.shared.fetchData(url: "https://engine.lifeis.porn/api/millionaire.php?qType=1&count=5") { (data: MillionerData) in
                LocaleStore.shared.resultData = data.data 
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greetingView?.startGameButton.addTarget(self, action: #selector(startGame), for: .touchUpInside)
    }
    
    @objc func startGame() {
        if let user = greetingView?.enterYourNameTextFiled.text {
            LocaleStore.shared.curentUser = User(name: user)
        }
        let controller = QuetionViewController()
        controller.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(controller, animated: true)
    }
}
