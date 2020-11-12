//
//  CovidDataModel.swift
//  CovidApp
//
//  Created by Irfandio Daffa on 17/10/20.
//

import Foundation
import SwiftUI


struct Total: Codable, Identifiable {
    let id = UUID()
    let jumlah_positif: Int
    let jumlah_meninggal: Int
    let jumlah_sembuh: Int
    let jumlah_dirawat: Int
}

struct Update: Codable {
    
    let total: Total
}

struct CovidData: Codable {
    var update: Update
}
