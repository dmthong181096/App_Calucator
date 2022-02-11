//
//  VoucherLogic.swift
//  Calu
//
//  Created by Thong Doan on 28/11/2021.
//

import Foundation
class VoucherLogic {
    private var costPrice: Double?
    private var voucher: Double?
//    private var interkedicateCalucation: (n1: Double , calMethod: String)?

    func setValue(_ costPrice: Double, _ voucher: Double) {
        self.costPrice = costPrice
        self.voucher = voucher
     }
    func calucatePrice() -> Double {
        return costPrice! - (costPrice! * voucher! * 0.01)
    }
}
