//
//  NetworkService.swift
//  otbor
//
//  Created by Jarae on 21/9/23.
//

import Foundation

class NetworkService {
    static let shared = NetworkService()
    
    let baseURL = URL(string: "https://rickandmortyapi.com/api/character")!
    
    func getCharacters(completion: @escaping([Result]) -> Void) {
        let request = URLRequest(url: baseURL)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {return}
            do {
                let model = try JSONDecoder().decode(Characters.self, from: data)
                completion(model.results)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func donwloadImage(url: String) -> Data{
        guard let data = try? Data(
            contentsOf: URL(string: url)!
        ) else {
            return Data()
        }
        return data
    }
}
