//
//  AssignMainContactView.swift
//  GameSafe
//
//  Created by Alex Shillingford on 7/10/20.
//  Copyright © 2020 Shillwil. All rights reserved.
//

import SwiftUI

struct AssignMainContactView: View {
    @Binding var contacts: [Contact]
    @State private var contactListPresented = false
    @State private var isMainContact = true
    @State var favoriteContact: Contact?
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Text("Main Contact")
                    .font(.largeTitle).bold()
                Spacer()
            }
            .padding()
            
            Text(self.favoriteContact?.name ?? "No Main Contact Assigned") // Contact given name
                .font(.headline).bold()
                .padding()
            
            Text(self.favoriteContact?.phoneNumber ?? "No phone number found") // Contact phone number
                .padding(.bottom, UIScreen.main.bounds.height / 4)
            
            Spacer()
            
            Button(action: {
                self.contactListPresented.toggle()
            }) {
                Text("Assign Main Contact")
                    .font(.system(size: 30, weight: .semibold, design: .default))
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width / 1.1, height: 50)
                    .background(Color(#colorLiteral(red: 0.1171975725, green: 0.7506059252, blue: 1, alpha: 1)))
                    .clipShape(Capsule())
					.padding()
            }
        }
        .sheet(isPresented: self.$contactListPresented, onDismiss: {
            self.favoriteContactAssigner()
        }, content: {
            EmbeddedContactPicker(contacts: self.$contacts, isMainContact: self.$isMainContact, isPresented: self.$contactListPresented)
        })
        .onAppear {
            self.favoriteContactAssigner()
        }
    }
    
    func favoriteContactAssigner() {
        for contact in contacts {
            if contact.isMainContact {
                self.favoriteContact = contact
            }
        }
    }
}

struct AssignMainContactView_Previews: PreviewProvider {
    static var previews: some View {
        AssignMainContactView(contacts: .constant([]))
    }
}

