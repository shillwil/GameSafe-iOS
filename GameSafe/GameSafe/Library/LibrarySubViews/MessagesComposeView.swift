//
//  MessagesComposeView.swift
//  GameSafe
//
//  Created by Alex Shillingford on 7/10/20.
//  Copyright © 2020 Shillwil. All rights reserved.
//

import SwiftUI
import Messages
import MessageUI

struct MessagesComposeView: UIViewControllerRepresentable {
    @Binding var quickStartTapped: Bool
    let message: MSMessage
    let difficulty: String
    private let controller = MFMessageComposeViewController()
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<MessagesComposeView>) -> MFMessageComposeViewController {
        
        controller.message = message
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: MFMessageComposeViewController, context: UIViewControllerRepresentableContext<MessagesComposeView>) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(controller, self)
    }
    
    class Coordinator: NSObject, MFMessageComposeViewControllerDelegate, UINavigationControllerDelegate {
        let parent: MessagesComposeView
        
        init(_ controller: MFMessageComposeViewController, _ parent: MessagesComposeView) {
            self.parent = parent
            super.init()
            controller.messageComposeDelegate = self
        }
        
        func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
            switch result {
            case .cancelled:
                print("Message was canceled")
                self.parent.quickStartTapped = false
            case .failed:
                print("Message had failed")
                self.parent.quickStartTapped = false
            case .sent:
                print("Message was sent")
                self.parent.quickStartTapped = false
            default:
                break
            }
            
            controller.dismiss(animated: true)
        }
    }
}
