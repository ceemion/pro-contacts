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

    var uid: String = Auth.auth().currentUser?.uid ?? ""

    func databaseRef(_ uid: String, _ type: String) -> DatabaseReference {
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
        Database.database().reference().child("users").child(self.uid).setValue([
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
    func postContact(payload: Dictionary<String, Any>, handler: @escaping (DatabaseReference, Error?) -> ()) {
        // Generates number going up as time goes on, sets order of contacts by how old they are.
        let date = Int(Date.timeIntervalSinceReferenceDate * 1000)
        databaseRef(self.uid, "contacts").child(String(date)).setValue(payload) { (error: Error?, ref: DatabaseReference) in
            handler(ref, error)
        }
    }
}

//and For Decoding Unix Epoch time to Date().
//
//let myTimeInterval = TimeInterval(timestamp)
//let time = NSDate(timeIntervalSince1970: TimeInterval(myTimeInterval))
