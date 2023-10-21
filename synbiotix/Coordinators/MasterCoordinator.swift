//
//  MasterCoordinator.swift
//  synbiotix
//
//  Created by Vasilis Neophytou on 21/10/2023.
//

import UIKit
import SwiftUI
import Combine

class MasterCoordinator: Coordinator {
    
    private var window: UIWindow
    
    internal var childCoordinators: [Constants.CoordinatorKeys : Coordinator]
    internal var navigationController: UINavigationController?
    
    public var rootViewController: UIViewController? {
        return navigationController
    }
    
    private var cancellables = Set<AnyCancellable>()
    
    init(in window: UIWindow) {
        self.childCoordinators = [:]
        self.navigationController = AppNC()
        self.window = window
        self.window.backgroundColor = .white
        self.window.rootViewController = rootViewController
        self.window.makeKeyAndVisible()
    }
    
    func start() {
        navigateToMainView()
    }
    
    func navigateToMainView() {
        let menuVM = MenuVM()
        menuVM.$showError.combineLatest(menuVM.$errorTitle, menuVM.$errorDescreption)
            .sink { showError, errorTitle, errorDescreption in
                if showError {
                    let okAction = AlertHelper.ModalAction(withTitle: "Ok", andAction: {})
                    AlertHelper.showAlertView(title: errorTitle, text: errorDescreption, action: okAction, dismiss: nil)
                }
            }.store(in: &cancellables)
        
        var menuView = MenuView(menuVM: menuVM)
        
        menuView.finishOrderAction = { [ weak self] frosting, filling in
            self?.navigateToReceiptView(with: frosting, and: filling)
            menuVM.reset()
        }
        
        let menuViewHC = UIHostingController(rootView: menuView)
        navigateUI(to: menuViewHC, with: .push, animated: false)
    }
    
    func navigateToReceiptView(with frosting: Frosting, and filling: Filling?) {
        var receiptView = ReceiptView(selectedFrosting: frosting, selectedFilling: filling)
        
        receiptView.orderAgain = { [weak self] in
            self?.navigationController?.popViewController(animated: false)
        }
        
        let receiptViewHC = UIHostingController(rootView: receiptView)
        navigateUI(to: receiptViewHC, with: .push)
        
    }
}
