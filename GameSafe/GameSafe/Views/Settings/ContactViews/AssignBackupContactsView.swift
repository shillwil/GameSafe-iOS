//
//  AssignBackupContactsView.swift
//  GameSafe
//
//  Created by Alex Shillingford on 7/10/20.
//  Copyright © 2020 Shillwil. All rights reserved.
//

import SwiftUI

struct AssignBackupContactsView: View {
    @Binding var contacts: [Contact]
    @State private var contactListPresented = false
    @State private var isMainContact = false
    @State var backupContact: Contact?
    
    var body: some View {
        VStack {
            HStack {
                Text("Backup Contact")
                    .font(.largeTitle).bold()
                Spacer()
            }
            .padding()
            
            Text(self.backupContact?.name ?? "No Main Contact Assigned") // Contact given name
                .font(.headline).bold()
                .padding()
            
            Text(self.backupContact?.phoneNumber ?? "No phone number found") // Contact phone number
                .padding(.bottom, UIScreen.main.bounds.height / 4)
            
            Spacer()
            
            Button(action: {
                self.contactListPresented.toggle()
            }) {
                Text("Assign Backup Contacts")
                    .font(.system(size: 30, weight: .semibold, design: .default))
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width / 1.1, height: 50)
                    .background(Color(#colorLiteral(red: 0, green: 0.9803921569, blue: 0.5960784314, alpha: 1)))
                    .clipShape(Capsule())
            }
            
            Spacer()
        }
        .sheet(isPresented: self.$contactListPresented, onDismiss: {
            self.backupContactAssigner()
        }, content: {
            EmbeddedContactPicker(contacts: self.$contacts, isMainContact: self.$isMainContact, isPresented: self.$contactListPresented)
        })
            .onAppear {
                self.backupContactAssigner()
        }
    }
    
    func backupContactAssigner() {
        for contact in contacts {
            if !contact.isMainContact {
                self.backupContact = contact
            }
        }
    }
}

struct AssignBackupContactsView_Previews: PreviewProvider {
    static var previews: some View {
        AssignBackupContactsView(contacts: .constant([]))
    }
}
