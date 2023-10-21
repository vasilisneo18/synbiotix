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
                    
                    Text("Select frosting")
                        .padding(.top, 20)
                    
                    LazyVStack(spacing: 10) {
                        ForEach(menuVM.frostings.indices, id: \.self) { index in
                            let frosting = menuVM.frostings[index]
                            DonutOptionItem(item: frosting.name,
                                            price: frosting.price,
                                            isSelected: $menuVM.frostingsSelection[index]) {
                                menuVM.frostingSelected(index: index)
                            }
                        }
                    }
                    
                    Text("Select filling (Optional)")
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
                        }
                    }
                    
                }
                .padding(.horizontal, 20)
                
                
                
            }
            .navigationTitle("Donut menu")
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
            }
        }
    }
}

#Preview {
    MenuView(menuVM: MenuVM())
}
