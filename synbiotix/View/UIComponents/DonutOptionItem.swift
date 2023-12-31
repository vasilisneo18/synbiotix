//
//  DonutOptionItem.swift
//  synbiotix
//
//  Created by Vasilis Neophytou on 21/10/2023.
//

import SwiftUI

struct DonutOptionItem: View {
    
    let item: String
    let price: Double
    @Binding var isSelected: Bool
    var optional: Bool = false
    var action: () -> Void
    
    var body: some View {
        
        LazyVStack {
            HStack {
                VStack {
                    Text(item)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(itemPrice)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                
                if optional && isSelected {
                    Text("Tap to remove")
                        .font(.system(size: 12))
                        .foregroundStyle(Color.cyan)
                }
                
                Image(systemName: isSelected ? "circle.inset.filled" : "circle")
                    .foregroundStyle(Color.blue)
                
            }
            .padding(.horizontal, 20)
            .frame(height: 50)
            .background(
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .stroke(lineWidth: 2)
                    .foregroundColor(.gray)
            )
            .background(.white)
        }
        .onTapGesture {
            action()
        }
    }
    
    var itemPrice: String {
        get {
            return price.formattedByCurrency("EUR")
        }
    }
    
}

#Preview {
    DonutOptionItem(item: "Choco",
                    price: 5.2,
                    isSelected: .constant(true),
                    action: {})
}
