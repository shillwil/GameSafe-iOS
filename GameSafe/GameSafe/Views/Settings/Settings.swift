//
//  Settings.swift
//  GameSafe
//
//  Created by Alex Shillingford on 7/10/20.
//  Copyright © 2020 Shillwil. All rights reserved.
//

import SwiftUI

struct Settings: View {
    @Binding var contacts: [Contact]
    let defaultDifficulties = [
        Difficulty(level: .easy, message: "Alex has activated their LOW level GameSafe alert and is requesting that you contact him immediately"),
        Difficulty(level: .medium, message: "Alex has activated their MEDIUM level GameSafe Alert and has asked you to come to their location as soon as possible"),
        Difficulty(level: .hard, message: "Alex has activated their HIGH level GameSafe Alert. Please contact the authorities immediately and send them to this location: ")
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    VStack(spacing: 1) {
                        NavigationLink(destination: AssignMainContactView(contacts: self.$contacts)) {
                            SettingsOptionRow(setting: "Main Contact")
                        }
                        
                        NavigationLink(destination: AssignBackupContactsView(contacts: self.$contacts)) {
                            SettingsOptionRow(setting: "Backup Contact")
                        }
                    }
                    .padding(.top, 1)
                    .padding(.bottom, 30)
                    
                    VStack(spacing: 1) {
                        HStack {
                            Text("Difficulty")
                                .font(.title).bold()
                            Spacer()
                        }
                        .frame(height: 50)
                        .padding(.horizontal)
                        
                        ForEach(defaultDifficulties, id: \.self) { (difficulty) in
                            NavigationLink(destination: SetDifficultyAlertView(difficulty: difficulty)) {
                                SettingsOptionRow(setting: difficulty.level.rawValue)
                            }
                        }
                    }
                    .padding(.bottom, 30)
                    
                    VStack(spacing: 1) {
                        HStack {
                            Text("Resources")
                                .font(.title).bold()
                            Spacer()
                        }
                        .frame(height: 50)
                        .padding(.horizontal)
                        
                        SettingsOptionRow(setting: "Review Instructions")
                    }
                }
                .background(Color(#colorLiteral(red: 0.955273211, green: 0.955273211, blue: 0.955273211, alpha: 0.9880136986)))
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarTitle("Settings", displayMode: .automatic)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings(contacts: .constant([]))
    }
}
