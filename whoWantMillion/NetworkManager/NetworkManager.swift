//
//  NetworkManager.swift
//  whoWantMillion
//
//  Created by Георгий Матченко on 27.08.2022.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    func fetchData(url: String, completion: @escaping (MillionerData) -> Void) {
        guard let request = URL(string: url) else { return }
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                print(error)
            }
            guard let data = data else { return }
            do {
                let millionerData = try JSONDecoder().decode(MillionerData.self, from: data)
                completion(millionerData)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
