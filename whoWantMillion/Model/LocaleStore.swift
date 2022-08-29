//
//  LocalStore.swift
//  whoWantMillion
//
//  Created by Георгий Матченко on 26.08.2022.
//

import Foundation

class LocaleStore {
    static let shared = LocaleStore()
    
    var resultData: [DataQuestions] = []
    
    var currentQuestion: DataQuestions? = nil
    var currentAnswer: String = ""
    
    var curentUser: User? = nil
}
