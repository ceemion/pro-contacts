//
//  LoginView.swift
//  pro-contacts
//
//  Created by Fiyinfoluwa Adebayo on 14/01/2020.
//  Copyright © 2020 Kompilab Limited. All rights reserved.
//

import SwiftUI

struct LoginView: View {

    @EnvironmentObject var session: FirebaseSession

    @State var email: String = ""
    @State var password: String = ""

    @State var showInputAlert: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("""
                Welcome back.
                Great to see you again
                """)
                .font(Font.custom(Constants.Font.titleMed, size: 25))
                .foregroundColor(Color("text"))

//            Text(userAccount.error.error)
//                .font(.footnote)
//                .foregroundColor(Color("danger"))

            VStack(alignment: .leading, spacing: 5) {
                Label(text: "Email")
                TextField("", text: $email)
                    .textFieldStyle(ProTextFieldStyle())
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
            }

            VStack(alignment: .leading, spacing: 5) {
                Label(text: "Password")
                SecureField("", text: $password)
                    .textFieldStyle(ProTextFieldStyle())
            }

            Button(action: { self.login() }) {
                HStack {
                    Spacer()
                    Text("Login")
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
        .alert(isPresented: $showInputAlert) {
            Alert(
                title: Text("Email and Password are required!"),
                dismissButton: .default(Text("Ok"))
            )
        }
        .padding()
    }

    func login() {
        if !email.isEmpty && !password.isEmpty {
            self.session.login(email: email, password: password) { (result, error) in
                if error != nil {
                    print("Login Error: ", error as Any)
                } else {
                    self.email = ""
                    self.password = ""
                }
            }
        } else {
            self.showInputAlert.toggle()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
