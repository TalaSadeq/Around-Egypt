//
//  RecentViewModel.swift
//  Around Egypt
//
//  Created by Tala Sadeq on 12/20/23.
//

import Foundation
import UIKit
import Combine

class RecentViewModel : ObservableObject {
    @Published var sharedData : SharedData?
    var data : Response?
    func getSingleData(completion: @escaping (Error?) -> Void) {
        GetRecentItems.getRecentItems { result  in
            switch result {
            case .success(let receivedData):
            self.data = receivedData
            completion(nil) // No error, data fetched successfully
                self.sendData(data: receivedData)
            case .failure(let error):
            completion(error)
            }
        }
        
        
    }
    func sendData(data : Response){
        sharedData = SharedData(data : data)
        
    }
   
    
}


struct SharedData {
   var data : Response
    
}
