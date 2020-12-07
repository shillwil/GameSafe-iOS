//
//  ContactStore.swift
//  GameSafe
//
//  Created by Alex Shillingford on 11/20/20.
//  Copyright © 2020 Shillwil. All rights reserved.
//

import Foundation
import RealmSwift

final class ContactStore: ObservableObject {
	private var contactResults: Results<RealmContact>
	
	init(realm: Realm) {
		contactResults = realm.objects(RealmContact.self)
	}
	
	var contacts: [Contact] {
		contactResults.map(Contact.init)
	}
}

extension ContactStore {
	func create(name: String, phoneNumber: String, isMainContact: Bool) {
		objectWillChange.send()
		
		do {
			let realm = try Realm()
			
			let realmContact = RealmContact()
			realmContact.id = UUID().hashValue
			realmContact.name = name
			realmContact.phoneNumber = phoneNumber
			realmContact.isMainContact = isMainContact
			
			try realm.write {
				realm.add(realmContact)
			}
		} catch let error {
			print(error.localizedDescription)
		}
	}
	
	func update(id: Int, name: String, phoneNumber: String, isMainContact: Bool) {
		objectWillChange.send()
		
		do {
			let realm = try Realm()
			try realm.write {
				realm.create(
					RealmContact.self,
					value: [
						"id": id,
						"name": name,
						"phoneNumber": phoneNumber,
						"isMainContact": isMainContact
					],
					update: .modified)
			}
		} catch let error {
			print(error.localizedDescription)
		}
	}
	
	func delete(id: Int) {
		objectWillChange.send()
		
		guard let realmContact = contactResults.first(where: { $0.id == id }) else { return }
		
		do {
			let realm = try Realm()
			try realm.write {
				realm.delete(realmContact)
			}
		} catch let error {
			print(error.localizedDescription)
		}
	}
}
