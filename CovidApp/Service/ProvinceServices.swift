//
//  ProvinceServices.swift
//  CovidApp
//
//  Created by Irfandio Daffa on 12/11/20.
//

import Foundation
import SwiftyJSON
import Combine
import SwiftUI

class getDataProvince: ObservableObject{
    
    @Published var data = [ProvinceCase]()
    
    init(){
        let url = "https://data.covid19.go.id/public/api/prov.json"
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url)!) { (data, _, err) in
            
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            
            let json = try! JSON(data: data!)
            
            let list_data = json["list_data"].array!
            
            for i in list_data{
                let province = i["key"].stringValue
                let jumlah_kasus = i["jumlah_kasus"].stringValue
                let jumlah_meninggal = i["jumlah_meninggal"].stringValue
                let jumlah_sembuh = i["jumlah_sembuh"].stringValue
                
                let jenis_kelamin = i["jenis_kelamin"].array!
                
                var kelamin = ""
                
                for j in jenis_kelamin{
                    kelamin += "\(j["key"].stringValue)\n"
                }
                
                
                DispatchQueue.main.async {
                    self.data.append(ProvinceCase(id: UUID(), province: province, jumlah_kasus: jumlah_kasus, jumlah_meninggal: jumlah_meninggal, jumlah_sembuh: jumlah_sembuh, jenis_kelamin: kelamin, jumlah: ""))
                }
            }
        }.resume()
    }
    
}

struct ProvinceCase: Codable, Identifiable {
    var id = UUID()
    var province: String
    var jumlah_kasus: String
    var jumlah_meninggal: String
    var jumlah_sembuh: String
    var jenis_kelamin: String
    var jumlah: String
}
