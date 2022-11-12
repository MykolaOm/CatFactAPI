//
//  Networking.swift
//  CatfactApiLesson
//
//  Created by Nikolas Omelianov on 13.11.2022.
//

import Foundation



class CatFactNetworking {
    private let catFactURL = URL(string: "https://catfact.ninja/fact")
   
    func getCatFact(with completion: @escaping((CatFact)->()?) ) {
        guard let url = catFactURL else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            //MARK: Response check
            if let catFactResponse = response {
                print(catFactResponse)
            }
            //MARK: Error check
            if let err = error {
                let errorLabelText = CatFact(fact: err.localizedDescription, length: 0)
                completion(errorLabelText)
            }
            //MARK: data check
            if let catData = data {
                do {
                    let decodedCatFact = try JSONDecoder().decode(CatFact.self, from: catData)
                    completion(decodedCatFact)
                } catch {
                    print("decode error")
                }
            }
        }
        dataTask.resume()
    }
    
}

struct CatFact: Decodable {
    let fact: String
    let length: Int
}
