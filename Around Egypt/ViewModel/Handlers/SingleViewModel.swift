//
//  SingleViewModel.swift
//  Around Egypt
//
//  Created by Tala Sadeq on 12/20/23.
//

import Foundation

class SingleViewModel : ObservableObject {
    var data : Response?
    func getSingleData(completion: @escaping (Error?) -> Void) {
        GetSingleItems.getSingleItems(id: " ") {  result  in
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
