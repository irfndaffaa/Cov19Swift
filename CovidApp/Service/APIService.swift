//
//  APIService.swift
//  CovidApp
//
//  Created by Irfandio Daffa on 17/10/20.
//

import Foundation
import Combine
import SwiftUI

/// <#Description#>
class apiService: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    
    @Published var dataTotal = [Total](){
        willSet{
            objectWillChange.send()
        }
    }
    
    init() {
        guard let url = URL(string: "https://data.covid19.go.id/public/api/update.json") else {
            fatalError("invalid url")
        }
        
        URLSession.shared.dataTask(with: url){ (data, response, error) in
            guard let data = data, error == nil else{
                return
            }
            
            let result = try? JSONDecoder().decode(CovidData.self, from: data)
            
//            print(result)
            
            if let result = result{
                DispatchQueue.main.async {
                    self.dataTotal = [result.update.total]
                    
                    print(self.dataTotal)
                }
            }
        }.resume()
    }
}
