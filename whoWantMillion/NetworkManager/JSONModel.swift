//
//  JSONModel.swift
//  whoWantMillion
//
//  Created by Георгий Матченко on 27.08.2022.
//

import Foundation

struct MillionerData: Decodable {
    let data: [DataQuestions]
}

struct DataQuestions: Decodable {
    let question: String
    var answers: [String]
    let id: Int
}
