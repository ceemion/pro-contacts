//
//  PersonFormView.swift
//  pro-contacts
//
//  Created by Fiyinfoluwa Adebayo on 15/01/2020.
//  Copyright © 2020 Kompilab Limited. All rights reserved.
//

import SwiftUI

struct PersonFormView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var session: FirebaseSession

    @State private var firstName: String = "Jill"
    @State private var lastName: String = "Jinx"
    @State private var email: String = "jilljinx@email.com"
    @State private var phoneNumber: String = "123456"

    @State private var loading: Bool = true

    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 8) {
                    VStack(alignment: .leading, spacing: 5) {
                        Label(text: "First Name")
                        HStack(alignment: .center, spacing: 0) {
                            TextField("", text: $firstName)
                                .textFieldStyle(ProTextFieldStyle())
                            //Image(systemName: "person.badge.plus.fill")
                                //.imageScale(.large)
                        }
                    }

                    VStack(alignment: .leading, spacing: 5) {
                        Label(text: "Last Name")
                        TextField("", text: $lastName)
                            .textFieldStyle(ProTextFieldStyle())
                    }

                    VStack(alignment: .leading, spacing: 5) {
                        Label(text: "Email")
                        TextField("", text: $email)
                            .keyboardType(.emailAddress)
                            .textFieldStyle(ProTextFieldStyle())
                            .autocapitalization(.none)
                    }

                    VStack(alignment: .leading, spacing: 5) {
                        Label(text: "Phone Number")
                        TextField("", text: $phoneNumber)
                            .keyboardType(.phonePad)
                            .textFieldStyle(ProTextFieldStyle())
                    }
                }
                .padding(10)
            }
            .navigationBarTitle("New Professional Contact", displayMode: .inline)
            .navigationBarItems(
                leading: Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                    }) { Text("Cancel") }
                    .accentColor(Color("primary")),
                trailing: Button(action: {
                    self.saveContact()
                }) { Text("Save") }
                    .accentColor(Color("primary"))
            )
        }
    }

    func buildPayload() -> Dictionary<String, Any> {
        let timestamp = Int(NSDate().timeIntervalSince1970)

        return [
            "firstName": firstName,
            "lastName": lastName,
            "email": email,
            "phoneNumber": phoneNumber,
            "createdAt": timestamp,
            "updatedAt": timestamp
        ]
    }

    func saveContact() {
        self.session.postContact(payload: buildPayload()) { (result, error) in
            print("REsult: ", result)
            print("ERRor: ", error ?? "no contact post Errors.")
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct PersonFormView_Previews: PreviewProvider {
    static var previews: some View {
        PersonFormView()
    }
}
