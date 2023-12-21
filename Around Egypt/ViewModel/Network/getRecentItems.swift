//
//  getRecentItems.swift
//  Around Egypt
//
//  Created by Tala Sadeq on 12/20/23.
//

import Foundation
import UIKit



struct GetRecentItems {
    
   static func getRecentItems(completion: @escaping (Result<Response, Error>) -> Void) {
        let url = "https://aroundegypt.34ml.com/api/v2/experiences"

        URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
            guard let data = data, error == nil else {
                if let error = error {
                    completion(.failure(error))
                } else {
                    let unknownError = NSError(domain: "UnknownError", code: -1, userInfo: nil)
                    completion(.failure(unknownError))
                }
                return
            }

            do {
                let result = try JSONDecoder().decode(Response.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(result))
                    print("We are heerrreeee")
                    print(result.data.count)
                }
            } catch {
                completion(.failure(error))
                
            }
        }.resume()
    }
}

