//
//  ContactStore.swift
//  GameSafe
//
//  Created by Alex Shillingford on 10/29/20.
//  Copyright © 2020 Shillwil. All rights reserved.
//

import Foundation
import RealmSwift

final class ContactStore: ObservableObject {
	var contactResults: Results<RealmContact>
	private var mainContactResults: Results<RealmContact>
	
	init(realm: Realm) {
		contactResults = realm.objects(RealmContact.self)
			.filter("isMainContact = false")
		mainContactResults = realm.objects(RealmContact.self)
			.filter("isMainContact = true")
	}
	
	public var mainContacts: [Contact] {
		mainContactResults.map(Contact.init)
	}
	
	var contacts: [Contact] {
		contactResults.map(Contact.init)
	}
}

extension ContactStore {
	func create(name: String, number: String, isMain: Bool = false) {
		objectWillChange.send()
		
		do {
			let realm = try Realm()
			
			let realmContact = RealmContact()
			realmContact.id = UUID().hashValue
			realmContact.name = name
			realmContact.number = number
			realmContact.isMainContact = isMain
			
			try realm.write {
				realm.add(realmContact)
			}
		} catch let error {
			print(error.localizedDescription)
		}
	}
	
	func update(id: Int, name: String, number: String, isMain: Bool) {
		objectWillChange.send()
		
		do {
			let realm = try Realm()
			
			try realm.write {
				realm.create(
					RealmContact.self,
					value: [
						"id": id,
						"name": name,
						"number": number,
						"isMainContact": isMain
					],
					update: .modified)
			}
		} catch let error {
			print(error.localizedDescription)
		}
	}
	
	func delete(contactID: Int) {
		objectWillChange.send()
		
		guard let realmContact = contactResults.first(
				where: { $0.id == contactID })
		else { return }
		
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
