//
//  MainView.swift
//  synbiotix
//
//  Created by Vasilis Neophytou on 21/10/2023.
//

import SwiftUI

struct MenuView: View {
    
    @ObservedObject var menuVM: MenuVM
    
    var finishOrderAction: ((Frosting, Filling?)->())?
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {
                
                VStack(alignment: .leading) {
                    
                    Text("Choose Frosting")
                        .padding(.top, 20)
                    
                    LazyVStack(spacing: 10) {
                        ForEach(menuVM.frostings.indices, id: \.self) { index in
                            let frosting = menuVM.frostings[index]
                            DonutOptionItem(item: frosting.name,
                                            price: frosting.price,
                                            isSelected: $menuVM.frostingsSelection[index]) {
                                menuVM.frostingSelected(index: index)
                            }
                            .accessibilityIdentifier("\(ScreenIdentifier.MenuView.frostingOptionViewItem.rawValue)_\(index)")
                        }
                    }
                    .accessibilityIdentifier(ScreenIdentifier.MenuView.frostingOptionsView.rawValue)
                    
                    Text("Fillings (Optional)")
                        .padding(.top, 20)
                    
                    LazyVStack(spacing: 10) {
                        ForEach(menuVM.fillings.indices, id: \.self) { index in
                            let filling = menuVM.fillings[index]
                            DonutOptionItem(item: filling.name,
                                            price: filling.price,
                                            isSelected: $menuVM.fillingsSelection[index],
                                            optional: true) {
                                menuVM.fillingSelected(index: index)
                            }
                            .accessibilityIdentifier("\(ScreenIdentifier.MenuView.fillingOptionViewItem.rawValue)_\(index)")
                        }
                    }
                    .accessibilityIdentifier(ScreenIdentifier.MenuView.fillingOptionsView.rawValue)
                    
                }
                .padding(.horizontal, 20)
                
                
                
            }
            .navigationTitle("Make Your Donut ")
            .overlay(alignment: .bottom) {
                DonutButton(title: "Finish Ordering",
                            color: menuVM.isOrderEnabled ? .blue : .cyan,
                            textColor: .white,
                            height: 50) {
                    guard let frosting = menuVM.selectedFrosting else { return }
                    finishOrderAction?(frosting, menuVM.selectedFilling)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
                .disabled(!menuVM.isOrderEnabled)
                .accessibilityIdentifier(ScreenIdentifier.MenuView.finishOrderButton.rawValue)
            }
        }
    }
}

#Preview {
    MenuView(menuVM: MenuVM())
}
