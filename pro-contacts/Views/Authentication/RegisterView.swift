//
//  RegisterView.swift
//  pro-contacts
//
//  Created by Fiyinfoluwa Adebayo on 14/01/2020.
//  Copyright © 2020 Kompilab Limited. All rights reserved.
//

import SwiftUI

struct RegisterView: View {

    @EnvironmentObject var session: FirebaseSession

    @State var name: String = ""
    @State var email: String = ""
    @State var phone: String = ""
    @State var password: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("""
                Let's create
                your account
                """)
                .font(Font.custom(Constants.Font.titleMed, size: 25))
                .foregroundColor(Color("text"))

//            Text(userAccount.error.error)
//                .font(.footnote)
//                .foregroundColor(Color("danger"))

            VStack(alignment: .leading, spacing: 5) {
                Label(text: "Name")
                TextField("", text: $name)
                    .textFieldStyle(ProTextFieldStyle())
                    .autocapitalization(.words)
            }

            VStack(alignment: .leading, spacing: 5) {
                Label(text: "Email")
                TextField("", text: $email)
                    .textFieldStyle(ProTextFieldStyle())
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
            }

            VStack(alignment: .leading, spacing: 5) {
                Label(text: "Phone Number")
                TextField("", text: $phone)
                    .textFieldStyle(ProTextFieldStyle())
                    .keyboardType(.phonePad)
            }

            VStack(alignment: .leading, spacing: 5) {
                Label(text: "Password")
                SecureField("", text: $password)
                    .textFieldStyle(ProTextFieldStyle())
            }

            Button(action: { self.register() }) {
                HStack {
                    Spacer()
                    Text("Register")
                        .tracking(0.5)
                    Spacer()
                }
                .font(Font.custom(Constants.Font.title, size: 16))
                .foregroundColor(Color("primary"))
                .padding()
                .background(Color("primary").opacity(0.2))
                .cornerRadius(10)
            }
            Spacer()
        }
        .padding()
    }

    func register() {
        if !email.isEmpty && !password.isEmpty {
            session.register(name: "", email: email, phone: "", password: password) { (result, error) in
                if error != nil {
                    print("Create User Error", error as Any)
                } else {
                    self.session.addUserToDb(name: self.name, email: self.email, phone: self.phone)
                    self.email = ""
                    self.password = ""
                    self.name = ""
                    self.phone = ""
                }
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
