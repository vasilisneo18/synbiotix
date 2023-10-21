//
//  ReceiptVM.swift
//  synbiotix
//
//  Created by Vasilis Neophytou on 21/10/2023.
//

import Foundation

class ReceiptVM: ObservableObject {
    
    var selectedFrosting: Frosting
    var selectedFilling: Filling?
    
    init(with selectedFrosting: Frosting,
         and selectedFilling: Filling?) {
        self.selectedFrosting = selectedFrosting
        self.selectedFilling = selectedFilling
    }
    
    var order: String {
        get {
            if let filling = selectedFilling?.name {
                return "\(selectedFrosting.name) donut\nwith \(filling) filling"
            } else {
                return "\(selectedFrosting.name) donut"
            }
            
        }
    }
    
    var totalPrice: String {
        get {
            var total: Double = 0
            total += selectedFrosting.price
            if let fillingPrice = selectedFilling?.price {
                total += fillingPrice
            }
            return "Total price: \(total.formattedByCurrency("EUR"))"
        }
    }
    
}
