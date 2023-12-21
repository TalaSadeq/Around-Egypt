//
//  getSearchItems.swift
//  Around Egypt
//
//  Created by Tala Sadeq on 12/20/23.
//


import Foundation
import UIKit

class GetSearchItemsAPI {
    
    func fetchSearchResults(searchItem : String ){
        let url = "https://aroundegypt.34ml.com/api/v2/experiences?filter[title]={\(searchItem)}"


        URLSession.shared.dataTask(with: URL(string:url)!, completionHandler: { data, response, error in
            guard let data = data , error == nil else {
                print("Something Went wrong")
                return
            }
            var result : Response?
            do {
                result = try JSONDecoder().decode(Response.self,from: data)
                DispatchQueue.main.async {
                    recommendations = result
                   
                }
            } catch {
                print(error)
            }
            guard let json = result else {
                return
            }
            print(json.meta?.code!)
        }).resume()
    }
    
}
