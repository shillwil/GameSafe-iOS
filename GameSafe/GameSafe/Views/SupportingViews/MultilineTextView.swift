//
//  MultilineTextView.swift
//  GameSafe
//
//  Created by Alex Shillingford on 7/21/20.
//  Copyright © 2020 Shillwil. All rights reserved.
//

import SwiftUI

struct MultilineTextView: UIViewRepresentable {
    @Binding var text: String

    func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
        view.isScrollEnabled = true
        view.isEditable = true
        view.isUserInteractionEnabled = true
        view.layer.cornerRadius = 12
        view.layer.borderColor = #colorLiteral(red: 0.1171975725, green: 0.7506059252, blue: 1, alpha: 1)
        view.layer.borderWidth = 1
        return view
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        text = uiView.text
    }
}
