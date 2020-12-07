//
//  BackupContactRow.swift
//  GameSafe
//
//  Created by Alex Shillingford on 7/10/20.
//  Copyright © 2020 Shillwil. All rights reserved.
//

import SwiftUI

struct BackupContactRow: View {
    @State var contact: Contact
    
    var body: some View {
        HStack {
            Text(contact.name)
                .font(.headline)
                .foregroundColor(.black)
            
            Spacer()
            
            Text(contact.phoneNumber)
                .foregroundColor(.gray)
        }
        .padding(.horizontal)
        .frame(height: 50)
        .background(Color.white)
    }
}

struct BackupContactRow_Previews: PreviewProvider {
    static var previews: some View {
		BackupContactRow(contact: Contact(id: 0, name: "Name", phoneNumber: "8015550123", isMainContact: false))
    }
}
