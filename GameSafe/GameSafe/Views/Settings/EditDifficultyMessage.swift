//
//  EditDifficultyMessage.swift
//  GameSafe
//
//  Created by Alex Shillingford on 7/21/20.
//  Copyright © 2020 Shillwil. All rights reserved.
//

import SwiftUI

enum DifficultyDefault: String {
    case easy = " has activated their LOW level GameSafe alert and is requesting that you contact him immediately"
}

struct EditDifficultyMessage: View {
    @Binding var difficulty: Difficulty
    @Binding var isPresented: Bool
    let messagePlaceholder: String
    
    var body: some View {
        VStack {
            MultilineTextView(text: self.$difficulty.message)
                .frame(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.height / 3)
            
            Button(action: {
                self.isPresented = false
            }) {
                Text("Save")
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.height / 16)
                    .background(Color(#colorLiteral(red: 0.1171975725, green: 0.7506059252, blue: 1, alpha: 1)))
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            }
            
            Button(action: {
                self.difficulty.message = self.messagePlaceholder
                self.isPresented = false
            }) {
                Text("Cancel")
            }
            .padding(30)
            
            Spacer()
        }
    }
}

struct EditDifficultyMessage_Previews: PreviewProvider {
    static var previews: some View {
        EditDifficultyMessage(difficulty: .constant(Difficulty(level: .easy, message: "")), isPresented: .constant(true), messagePlaceholder: "")
    }
}
