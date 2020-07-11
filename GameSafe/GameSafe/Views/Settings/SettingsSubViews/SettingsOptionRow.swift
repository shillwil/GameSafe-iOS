//
//  SettingsOptionRow.swift
//  GameSafe
//
//  Created by Alex Shillingford on 7/10/20.
//  Copyright © 2020 Shillwil. All rights reserved.
//

import SwiftUI

struct SettingsOptionRow: View {
    var setting: String
    
    var body: some View {
        HStack {
            Text(setting)
                .font(.headline)
                .foregroundColor(.black)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding(.horizontal)
        .frame(height: 50)
        .background(Color.white)
    }
}

struct SettingsOptionRow_Previews: PreviewProvider {
    static var previews: some View {
        SettingsOptionRow(setting: "First Setting")
    }
}
