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

    func databaseRef(uid: String) -> DatabaseReference {
        return Database.database().reference(withPath: "\(String(describing: uid.isEmpty ? "Error" : uid))")
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

    func logout() {
        try! Auth.auth().signOut()
        self.isLoggedIn = false
        self.currentUser = nil
        self.uid = ""
    }
}
