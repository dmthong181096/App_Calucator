//
//  Unit.swift
//  Calu
//
//  Created by Thong Doan on 12/12/2021.
//

import Foundation
class Units {
     var unitName: String
    var unitSymbol: String
    var unit: UnitLength
    init(unitName: String , unitSymbol: String, unit: UnitLength) {
        self.unitName = unitName
        self.unitSymbol = unitSymbol
        self.unit = unit
    }
}
