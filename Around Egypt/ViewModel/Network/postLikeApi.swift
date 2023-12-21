//
//  postLikeApi.swift
//  Around Egypt
//
//  Created by Tala Sadeq on 12/20/23.
//

import Foundation
import UIKit

class LikeAnExperience{
    
    func likeAnExperience(id : String){
        let url = URL(string: "https://aroundegypt.34ml.com/api/v2/experiences/\(id)/like")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            let statusCode = (response as! HTTPURLResponse).statusCode

            if statusCode == 200 {
                print("SUCCESS")
            } else {
                print("FAILURE")
            }
        }

        task.resume()
    }
    
    
}
