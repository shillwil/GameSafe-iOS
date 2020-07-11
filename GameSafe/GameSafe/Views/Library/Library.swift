//
//  Library.swift
//  GameSafe
//
//  Created by Alex Shillingford on 7/10/20.
//  Copyright © 2020 Shillwil. All rights reserved.
//

import SwiftUI
import Messages

struct Library: View {
    @State var difficultySelection = 0
    @State var message = MSMessage()
    @State var quickStartTapped = false
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("High Score")
                        .font(.title).bold()
                    
                    Spacer()
                    
                    Text("0000000000")
                        .font(.title).bold()
                }
                .padding(.horizontal)
                
                HStack {
                    Picker(selection: $difficultySelection, label: Text("What is your favorite color?")) {
                        Text("Easy").tag(0)
                        Text("medium").tag(1)
                        Text("hard").tag(2)
                    }.pickerStyle(SegmentedPickerStyle())
                }
                .padding()
                
                Button(action: {
                    self.quickStartTapped.toggle()
                }) {
                    QuickStartButton()
                }
                
                
            }
            .padding(.top, UIScreen.main.bounds.height * 0.1)
        }
        .edgesIgnoringSafeArea(.all)
        .background(Color.white)
        .sheet(isPresented: self.$quickStartTapped) {
            MessagesComposeView(quickStartTapped: self.$quickStartTapped, message: self.composeMessage(), difficulty: self.difficulty())
        }
    }
    
    func difficulty() -> String {
        var returnedString = ""
        
        switch difficultySelection {
        case 0:
            returnedString = "Easy"
        case 1:
            returnedString = "Medium"
        case 2:
            returnedString = "Hard"
        default:
            break
        }
        
        return returnedString
    }
    
    func composeMessage() -> MSMessage {
        let message = MSMessage()
        let layout = MSMessageTemplateLayout()
        layout.image = UIImage(named: "GameSafe-Logo")
        layout.caption = "GameSafe Play Invite"
        message.layout = layout
        var text = ""
        
        switch difficultySelection {
        case 0:
            // TODO:
            text = "Easy"
        default:
            break
        }
        
        return message
    }
}

struct Library_Previews: PreviewProvider {
    static var previews: some View {
        Library()
    }
}
