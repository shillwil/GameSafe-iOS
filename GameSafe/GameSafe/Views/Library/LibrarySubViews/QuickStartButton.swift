//
//  QuickStartButton.swift
//  GameSafe
//
//  Created by Alex Shillingford on 7/10/20.
//  Copyright © 2020 Shillwil. All rights reserved.
//

import SwiftUI

struct QuickStartButton: View {
    var body: some View {
        Text("Quick Start")
            .font(.largeTitle).bold()
            .frame(width: 300, height: 300)
            .foregroundColor(.white)
            .background(Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)))
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(lineWidth: 2)
        )
    }
}

struct QuickStartButton_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone 11", "iPhone 11 Pro Max"], id: \.self) { deviceName in
            QuickStartButton()
                .previewDevice(PreviewDevice(rawValue: deviceName))
        }
    }
}
