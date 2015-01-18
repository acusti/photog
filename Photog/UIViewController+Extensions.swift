//
//  UIViewController+Extensions.swift
//  Photog
//
//  Created by Andrew Patton on 2015-01-17.
//  Copyright (c) 2015 acusti.ca. All rights reserved.
//

import Foundation

extension UIViewController: UIPopoverPresentationControllerDelegate {
    
    // Modal text alert
    // ----------------
    func presentAlertModal(message: String) {
        self.presentAlertModal("Uh Oh!", message: message)
    }
    
    func presentAlertModal(title: String, message: String) {
        var alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        alertController.addAction(UIAlertAction(title: "Okay", style: .Default, handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    // Popover text alert
    // ------------------
    func presentAlertPopover(message: String, barButtonItem: UIBarButtonItem) {
        let viewController = GenericAlertViewController(nibName: "GenericAlertViewController", bundle: nil)
        self.presentViewControllerAsPopover(viewController, barButtonItem: barButtonItem)
        if let labelAlert = viewController.labelAlertText {
            labelAlert.text = message
        }
    }

    func presentAlertPopover(message: String, sourceView: UIView, sourceRect: CGRect) {
        let viewController = GenericAlertViewController(nibName: "GenericAlertViewController", bundle: nil)
        self.presentViewControllerAsPopover(viewController, sourceView: sourceView, sourceRect: sourceRect)
        if let labelAlert = viewController.labelAlertText {
            labelAlert.text = message
        }
    }
    
    // Popover presentation helpers
    // ----------------------------
    func presentViewControllerAsPopover(viewController: UIViewController, barButtonItem: UIBarButtonItem) {
        if let presentedVC = self.presentedViewController {
            if presentedVC.nibName == viewController.nibName {
                // The view is already being presented
                return
            }
        }
        // Specify presentation style first (makes the popoverPresentationController property available)
        viewController.modalPresentationStyle = .Popover
        let viewPresentationController = viewController.popoverPresentationController?
        if let presentationController = viewPresentationController {
            presentationController.delegate                 = self
            presentationController.barButtonItem            = barButtonItem
            presentationController.permittedArrowDirections = .Up
        }
        viewController.preferredContentSize = CGSize(width: 230, height: 110)
        
        self.presentViewController(viewController, animated: true, completion: nil)
    }
    
    // TODO: Add optional final parameter to specify preferredContentSize
    func presentViewControllerAsPopover(viewController: UIViewController, sourceView: UIView, sourceRect: CGRect) {
        if let presentedVC = self.presentedViewController {
            if presentedVC.nibName == viewController.nibName {
                // The view is already being presented
                return
            }
        }
        // Specify presentation style first (makes the popoverPresentationController property available)
        viewController.modalPresentationStyle = .Popover
        let viewPresentationController = viewController.popoverPresentationController?
        if let presentationController = viewPresentationController {
            presentationController.delegate                 = self
            presentationController.sourceView               = sourceView
            presentationController.sourceRect               = sourceRect
            presentationController.permittedArrowDirections = .Up
        }
        viewController.preferredContentSize = CGSize(width: 230, height: 110)
        
        self.presentViewController(viewController, animated: true, completion: nil)
    }
    
    // Delegate method to allow popovers to be presented in narrow horizontal contexts not fullscreen
    public func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }
}