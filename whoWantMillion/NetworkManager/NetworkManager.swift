//
//  NetworkManager.swift
//  whoWantMillion
//
//  Created by Георгий Матченко on 27.08.2022.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    func fetchData<T: Decodable>(url: String, completion: @escaping (T) -> Void) {
        guard let request = URL(string: url) else { return }
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                print(error)
            }
            guard let data = data else { return }
            do {
                let json = try JSONDecoder().decode(T.self, from: data)
                completion(json)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
