//
//  FirebaseSession.swift
//  pro-contacts
//
//  Created by Fiyinfoluwa Adebayo on 14/01/2020.
//  Copyright © 2020 Kompilab Limited. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

class FirebaseSession: ObservableObject {

    @Published var currentUser: User?
    @Published var isLoggedIn: Bool?

    @Published var contacts = [Person]()

    var uid: String = Auth.auth().currentUser?.uid ?? ""

    func databaseRef(_ type: String, _ uid: String) -> DatabaseReference {
        return Database.database().reference(withPath: "\(type)/\(String(describing: uid.isEmpty ? "Error" : uid))")
    }

    // MARK: - Auth functions
    func listen() {
        _ = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user {
                print("user still here.")
                self.currentUser = User(uid: user.uid, name: "", email: user.email, phone: "")
                self.uid = user.uid
                self.isLoggedIn = true
                self.getContacts()
            } else {
                print("user is gone")
                self.isLoggedIn = false
                self.currentUser = nil
                self.uid = ""
            }
        }
    }

    func register(name: String, email: String, phone: String, password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
    }

    func addUserToDb(name: String, email: String, phone: String) {
        databaseRef("users", self.uid).setValue([
            "name": name,
            "email": email,
            "phone": phone
        ])
    }

    func login(email: String, password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
    }

    func logout() {
        try! Auth.auth().signOut()
        self.isLoggedIn = false
        self.currentUser = nil
        self.uid = ""
    }

    // MARK: - Professional Contacts (Persons) functions
    func getContacts() {
        databaseRef("contacts", self.uid).observe(DataEventType.value) { (snapshot) in
            print(snapshot)

            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot {
                    self.contacts.append(Person.init(snapshot: snapshot)!)
                }
            }
            
            print("self ff: ", self.contacts)
        }
    }

    func postContact(payload: Dictionary<String, Any>, handler: @escaping (DatabaseReference, Error?) -> ()) {
        // Generates number going up as time goes on, sets order of contacts by how old they are.
        let date = Int(Date.timeIntervalSinceReferenceDate * 1000)
        databaseRef("contacts", self.uid).child(String(date)).setValue(payload) { (error: Error?, ref: DatabaseReference) in
            handler(ref, error)
        }
    }
}

//and For Decoding Unix Epoch time to Date().
//
//let myTimeInterval = TimeInterval(timestamp)
//let time = NSDate(timeIntervalSince1970: TimeInterval(myTimeInterval))
