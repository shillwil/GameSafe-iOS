//
//  SetDifficultyAlertView.swift
//  GameSafe
//
//  Created by Alex Shillingford on 7/14/20.
//  Copyright © 2020 Shillwil. All rights reserved.
//

import SwiftUI

struct SetDifficultyAlertView: View {
    @State var difficulty: Difficulty
    @State var editMessagePressed = false
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), .white]), startPoint: .bottomLeading, endPoint: .center)
            .edgesIgnoringSafeArea(.all)
            .overlay(
                VStack {
                    HStack {
                        Text("For Difficulty Level")
                            .font(.title)
                        
                        Spacer()
                        
                        Text(self.difficulty.level.rawValue)
                            .font(.title)
                            .bold()
                            .italic()
                    }
                    .padding()
                    
                    VStack(alignment: .leading) {
                        Text("Current Message")
                            .font(.title)
                            .bold()
                            .padding(.vertical)
                        
                        Text(difficulty.message)
                            .font(.system(size: 20))
                            .italic()
                            .padding()
                    }
                    .padding(.vertical)
                    
                    Button(action: {
                        self.editMessagePressed.toggle()
                    }) {
                        Text("Edit Message")
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.height / 16)
                            .background(Color(#colorLiteral(red: 0.1171975725, green: 0.7506059252, blue: 1, alpha: 1)))
                            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                    }
                    
                    Spacer()
                }
                .navigationBarTitle("Difficulty")
                    //            .padding(.top, 80)
                    .sheet(isPresented: self.$editMessagePressed) {
                        EditDifficultyMessage(difficulty: self.$difficulty, isPresented: self.$editMessagePressed, messagePlaceholder: self.difficulty.message)
                }
        )
    }
}

struct SetDifficultyAlertView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone 11", "iPhone 11 Pro Max"], id: \.self) { deviceName in
            SetDifficultyAlertView(difficulty: Difficulty(level: .easy, message: "Alex has activated their LOW level GameSafe alert and is requesting that you contact him immediately"))
                .previewDevice(PreviewDevice(rawValue: deviceName))
        }
    }
}
