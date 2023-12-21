//
//  RcommendedViewModel.swift
//  Around Egypt
//
//  Created by Tala Sadeq on 12/20/23.
//

import Foundation

class RecommendedViewModel {
    var data : Response?
    func fetchData(completion: @escaping (Error?) -> Void) {
        GetRecentItems.getRecentItems { result  in
            switch result {
            case .success(let data):
            self.data = data
            completion(nil) // No error, data fetched successfully
            case .failure(let error):
            completion(error)
            }
        }
        
        
    }
    
}
