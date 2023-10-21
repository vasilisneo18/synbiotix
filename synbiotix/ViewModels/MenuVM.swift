//
//  MenuVM.swift
//  synbiotix
//
//  Created by Vasilis Neophytou on 21/10/2023.
//

import Foundation

class MenuVM: ObservableObject {
    
    @Published var frostings: [Frosting] = []
    @Published var fillings: [Filling] = []
    @Published var frostingsSelection: [Bool] = []
    @Published var fillingsSelection: [Bool] = []
    
    @Published var showError: Bool = false
    @Published var errorTitle: String = ""
    @Published var errorDescreption: String = ""
    
    var selectedFrosting: Frosting?
    var selectedFilling: Filling?
    
    init() {
        getFrostings()
        getFillings()
    }
    
    func getFrostings() {
        UserRequests.getFrostings(completion: { [weak self] (result) in
            guard let self else { return }
            switch result {
            case .success(let frostings):
                self.frostings = frostings
                for _ in self.frostings {
                    frostingsSelection.append(false)
                }
            case .failure(let error):
                handleError(error: error)
            }
        })
    }
    
    func getFillings() {
        UserRequests.getFillings(completion: { [weak self] (result) in
            guard let self else { return }
            switch result {
            case .success(let fillings):
                self.fillings = fillings
                for _ in self.fillings {
                    fillingsSelection.append(false)
                }
            case .failure(let error):
                handleError(error: error)
            }
        })
    }
    
    func frostingSelected(index: Int) {
        for i in frostingsSelection.indices {
            frostingsSelection[i] = false
        }
        selectedFrosting = frostings[index]
        frostingsSelection[index] = true
    }
    
    func fillingSelected(index: Int) {
        if fillingsSelection[index] == true {
            for i in fillingsSelection.indices {
                fillingsSelection[i] = false
            }
            selectedFilling = nil
        } else {
            for i in fillingsSelection.indices {
                fillingsSelection[i] = false
            }
            selectedFilling = fillings[index]
            fillingsSelection[index] = true
        }
    }
    
    var isOrderEnabled: Bool {
        get {
            return selectedFrosting != nil
        }
    }
    
    func reset() {
        selectedFrosting = nil
        selectedFilling = nil
        for i in frostingsSelection.indices {
            frostingsSelection[i] = false
        }
        for i in fillingsSelection.indices {
            fillingsSelection[i] = false
        }
    }
    
    func handleError(error: Error) {
        self.errorTitle = "Error"
        self.errorDescreption = error.localizedDescription
        self.showError = true
    }
}
