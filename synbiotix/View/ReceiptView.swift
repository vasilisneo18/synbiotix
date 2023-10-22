//
//  ReceiptView.swift
//  synbiotix
//
//  Created by Vasilis Neophytou on 21/10/2023.
//

import SwiftUI

struct ReceiptView: View {
    
    @ObservedObject var receiptVm: ReceiptVM
    
    init(selectedFrosting: Frosting,
         selectedFilling: Filling?) {
        receiptVm = ReceiptVM(with: selectedFrosting, and: selectedFilling)
    }
    
    var orderAgain: (()->())?
    
    var body: some View {
        
        VStack {
            
            Text("Order Successful")
                .font(.title)
                .padding(.top, 20)
            
            Image("donut_delivery")
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
            
            
            Text("Your donut is on its way!!")
                .font(.title2)
            
            Text("Order")
                .font(.title2)
                .padding(.top, 30)
            
            Divider()
                .frame(height: 2)
                .padding(.horizontal, 50)
            
            Text(receiptVm.order)
                .multilineTextAlignment(.center)
                .padding(.top, 10)
                .accessibilityIdentifier(ScreenIdentifier.ReceiptView.orderSummaryLabel.rawValue)
            
            Text(receiptVm.totalPrice)
                .font(.system(size: 22, weight: .semibold))
                .padding(.top, 10)
                .accessibilityIdentifier(ScreenIdentifier.ReceiptView.totalPriceLabel.rawValue)
            Spacer()
            
            DonutButton(title: "Order again",
                        color: .blue,
                        textColor: .white,
                        height: 50) {
                orderAgain?()
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
            .accessibilityIdentifier(ScreenIdentifier.ReceiptView.orderAgainButton.rawValue)
            
        }
    }
}

#Preview {
    ReceiptView(selectedFrosting: Frosting(name: "Strawbbery", price: 5.20),
                selectedFilling: Filling(name: "Jelly", price: 3.1))
}
