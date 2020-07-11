//
//  EmbeddedContactPicker.swift
//  GameSafe
//
//  Created by Alex Shillingford on 7/10/20.
//  Copyright © 2020 Shillwil. All rights reserved.
//

import SwiftUI
import Contacts
import Combine

struct EmbeddedContactPicker: UIViewControllerRepresentable {
    typealias UIViewControllerType = EmbeddedContactPickerViewController
    @Binding var contacts: [Contact]
    @Binding var isMainContact: Bool
    @Binding var isPresented: Bool

    func makeUIViewController(context: UIViewControllerRepresentableContext<EmbeddedContactPicker>) -> EmbeddedContactPicker.UIViewControllerType {
        let result = EmbeddedContactPicker.UIViewControllerType()
        result.delegate = context.coordinator
        return result
    }

    func updateUIViewController(_ uiViewController: EmbeddedContactPicker.UIViewControllerType, context: UIViewControllerRepresentableContext<EmbeddedContactPicker>) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    final class Coordinator: NSObject, EmbeddedContactPickerViewControllerDelegate {
        let parent: EmbeddedContactPicker
        
        init(_ parent: EmbeddedContactPicker) {
            self.parent = parent
        }
        
        func embeddedContactPickerViewController(_ viewController: EmbeddedContactPickerViewController, didSelect contact: CNContact) {
            self.parent.contacts.append(Contact(name: contact.givenName, phoneNumber: contact.phoneNumbers.first?.value.stringValue ?? "", isMainContact: self.parent.isMainContact))
            self.parent.isPresented = false
        }

        func embeddedContactPickerViewControllerDidCancel(_ viewController: EmbeddedContactPickerViewController) {
            // do nothing
        }
    }
}
