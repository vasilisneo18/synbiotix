//
//  Double+Extension.swift
//  synbiotix
//
//  Created by Vasilis Neophytou on 21/10/2023.
//

import Foundation

extension Double {
    
    func formattedByCurrency(_ currency: String) -> String {
          let currencyFormatter = NumberFormatter()
          currencyFormatter.usesGroupingSeparator = true
          currencyFormatter.numberStyle = .currency
          currencyFormatter.currencyCode = currency
          return currencyFormatter.string(from: NSNumber(value: self))!
      }
      
    
}
