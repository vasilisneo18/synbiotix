//
//  DonutButton.swift
//  synbiotix
//
//  Created by Vasilis Neophytou on 21/10/2023.
//

import SwiftUI

struct DonutButton: View {
    
    var title: String
    var titleFont: Font? = .system(size: 24)
    var color: Color
    var textColor: Color
    var height: CGFloat
    var cornerRadius: CGFloat = 12
    var action: () -> Void
    
    var body: some View {
        filledButton
    }
}

extension DonutButton {
    
    private var filledButton: some View {
        
        @State var disabled: Bool = false
        
        return Button(action: action) {
            HStack {
                Text(title)
                    .font(titleFont)
                    .foregroundColor(textColor)
            }
            .frame(height: height)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(color)
            )
        }.disabled(disabled)
        
        func disabled(_ disabled: Bool) {
            if disabled {
                
            }
        }
    }
}

#Preview {
    DonutButton(title: "Title",
                titleFont: .system(size: 18),
                color: .blue,
                textColor: .white,
                height: 50, action: {}
    )
}
