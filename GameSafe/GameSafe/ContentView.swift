//
//  ContentView.swift
//  GameSafe
//
//  Created by Alex Shillingford on 7/10/20.
//  Copyright © 2020 Shillwil. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var selected = 0
    @State var contacts: [Contact] = []
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), .white]), startPoint: .bottomLeading, endPoint: .topTrailing)
            .edgesIgnoringSafeArea(.all)
            .overlay(
                ZStack(alignment: .bottom) {
                    
                    VStack {
                        if self.selected == 0 {
                            Library()
                        } else if self.selected == 1 {
                            Home()
                        } else {
                            Settings(contacts: self.$contacts)
                                .padding(.top, 50)
                        }
                    }
                        //            .background(Color.white)
                        .edgesIgnoringSafeArea(.all)
                    
                    FloatingTabBar(selected: self.$selected)
                }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct FloatingTabBar: View {
    @Binding var selected: Int
    @State var expand = false
    
    var body: some View {
        
        HStack {
            Spacer(minLength: 0)
            
            HStack {
                
                if !self.expand {
                    Button(action: {
                        self.expand.toggle()
                    }) {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.black)
                            .padding()
                    }
                } else {
                    Button(action: {
                        self.selected = 0
                    }) {
                        Image(systemName: self.selected == 0 ? "book.fill" : "book")
                            .foregroundColor(self.selected == 0 ? .black : .gray)
                            .padding(.horizontal)
                    }
                    
                    Spacer(minLength: 15)
                    
                    Button(action: {
                        self.selected = 1
                    }) {
                        Image(systemName: self.selected == 1 ? "house.fill" : "house")
                            .foregroundColor(self.selected == 1 ? .black : .gray)
                            .padding(.horizontal)
                    }
                    
                    Spacer(minLength: 15)
                    
                    Button(action: {
                        self.selected = 2
                    }) {
                        Image(systemName: "gear")
                            .foregroundColor(self.selected == 2 ? .black : .gray)
                            .padding(.horizontal)
                    }
                }
            }
            .padding(.vertical, self.expand ? 20 : 10)
            .padding(.horizontal, self.expand ? 35 : 10)
            .background(Color.white)
            .clipShape(Capsule())
            .shadow(color: .gray, radius: 6, x: 0, y: 0)
            .padding(22)
            .onLongPressGesture {
                self.expand.toggle()
            }
            .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.6, blendDuration: 0.6))
        }
    }
}
