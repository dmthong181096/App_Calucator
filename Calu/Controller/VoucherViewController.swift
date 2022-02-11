//
//  VoucherViewController.swift
//  Calu
//
//  Created by Thong Doan on 28/11/2021.
//

import UIKit

class VoucherViewController: UIViewController {

    @IBOutlet weak var costPriceTextField: UITextField!
    @IBOutlet weak var discountTextField: UITextField!
 
    @IBOutlet weak var lastPriceLabel: UILabel!
    private var lastPrice: Double {
            get {
              return 0
            }
            set {
                lastPriceLabel.text = String(newValue)
        }
    }
    var voucher = VoucherLogic()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func valueChanged(_ sender: UITextField) {
        cal()
    }
    func cal() {
        let costPrice = Double(costPriceTextField.text!) ?? 0
        let discount = Double(discountTextField.text!) ?? 0
        voucher.setValue(costPrice, discount)
        lastPrice = voucher.calucatePrice()
    }
}
