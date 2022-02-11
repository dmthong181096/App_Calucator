//
//  CaluteLogic.swift
//  Calu
//
//  Created by Thong Doan on 26/11/2021.
//

import Foundation
struct CalucatorLogic {
   private var number: Double?
//    init(number: Double) {
//        self.number = number // number bên ngoài bằng number bent rong hàm khởi tạo
//    }
    private var interkedicateCalucation: (n1: Double , calMethod: String)?
   mutating func setName(_ number: Double) {
        self.number = number
    }
    mutating func calucate (symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "+/-":
    //            displayValue *= -1 // gán giá trị vào setter
                return n * -1
            case "AC":
    //            displayValue = 0 //gán giá trị vào setter
                return  0
            case "%":
    //            displayValue /= 100 //gán giá trị vào setter
                return n * 0.01
            case "<=":
    //            displayValue /= 100 //gán giá trị vào setter
                return n
            case "=":
                return performTwoNumberCalucation(n2: n) // gọi hàm để tính toán
            default:
                interkedicateCalucation = (n1: n, calMethod: symbol) //gán giá trị thứ 1 vào hàm tạm để tính
            }
        }

        return nil
    }
    private func performTwoNumberCalucation(n2: Double) -> Double? {
        if let n1 = interkedicateCalucation?.n1 , let operation =  interkedicateCalucation?.calMethod {
            
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "x":
                return n1 * n2
            case "/":
                return n1 / n2
            default:
                fatalError("Error when build performTwoNumberCalucation")
            }
        }
        return nil
    }
}
