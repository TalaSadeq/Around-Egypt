//
//

import Foundation
import UIKit

struct GetSingleItems {
    
    static func getSingleItems(id : String, completion: @escaping (Result<Response, Error>) -> Void) {
       let url="https://aroundegypt.34ml.com/api/v2/experiences/\(id)"

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

