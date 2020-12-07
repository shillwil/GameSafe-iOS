//
//  EditDifficultyMessage.swift
//  GameSafe
//
//  Created by Alex Shillingford on 7/21/20.
//  Copyright © 2020 Shillwil. All rights reserved.
//

import SwiftUI

struct EditDifficultyMessage: View {
    @Binding var difficulty: Difficulty
    @Binding var isPresented: Bool
    @State var messagePlaceholder: String?
    
    var body: some View {
        VStack {
//            TextView(text: self.$difficulty.message, isEditing: self.$isPresented)
//                .frame(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.height / 3)
			TextEditor(text: self.$difficulty.message)
				.padding(.horizontal)
				.frame(height: UIScreen.main.bounds.height / 3)
				.disabled(isPresented)
            
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
                self.difficulty.message = self.resetToDefault()
                self.isPresented = false
            }) {
                Text("Reset to Default")
            }
            .padding(30)
            
            Button(action: {
                self.difficulty.message = self.messagePlaceholder ?? ""
                self.isPresented = false
            }) {
                Text("Cancel")
                    .foregroundColor(.red)
            }
            
            Spacer()
        }
        .onAppear {
            self.setPlaceholder()
        }
    }
    
    func setPlaceholder() {
        self.messagePlaceholder = self.difficulty.message
    }
    
    func resetToDefault() -> String {
        switch self.difficulty.level {
        case .easy:
            return "Alex has activated their LOW level GameSafe alert and is requesting that you contact him immediately"
        case .medium:
            return "Alex has activated their MEDIUM level GameSafe Alert and has asked you to come to their location as soon as possible"
        case .hard:
            return "Alex has activated their HIGH level GameSafe Alert. Please contact the authorities immediately and send them to this location: "
        }
    }
}

struct EditDifficultyMessage_Previews: PreviewProvider {
    static var previews: some View {
        EditDifficultyMessage(difficulty: .constant(Difficulty(level: .easy, message: "")), isPresented: .constant(true), messagePlaceholder: "")
    }
}
