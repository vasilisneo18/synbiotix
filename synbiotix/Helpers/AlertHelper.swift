//
//  AlertHelper.swift
//  synbiotix
//
//  Created by Vasilis Neophytou on 21/10/2023.
//

import UIKit

class AlertHelper {
    
    static func showAlertView(title: String, text: String?, action: ModalAction?, dismiss: ModalAction?){
        
        let alertController = UIAlertController(title: title, message: text, preferredStyle: .alert)
        if let dismissTitle = dismiss?.title{
            let action = UIAlertAction(title: dismissTitle, style: .destructive) { (_) in
                let action = dismiss?.action
                action?()
            }
            alertController.addAction(action)
        }
        if let actionTitle = action?.title{
            let action = UIAlertAction(title: actionTitle, style: .default) { (_) in
                let action = action?.action
                action?()
            }
            alertController.addAction(action)
        }
        present(alertController)
    }
    
    struct ModalAction {
        let title: String
        let action: (() -> ())?
        
        init(withTitle title: String, andAction action: (() -> ())?  = nil){
            self.title = title
            self.action = action
        }
    }
    
    static func present(_ modalViewController: UIViewController?, from viewController: UIViewController? = UIApplication.getTopViewController()) {
        guard let modalViewController = modalViewController else { return }
        modalViewController.modalTransitionStyle = .crossDissolve
        modalViewController.modalPresentationStyle = .overFullScreen
        viewController?.present(modalViewController, animated: true, completion: nil)
    }

}
