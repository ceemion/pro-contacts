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

    @State private var loading: Bool = false
    @State private var errorText: String = ""

    @State var showInputAlert: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("""
                Welcome,
                Great to see you again
                """)
                .font(Font.custom(Constants.Font.titleMed, size: 25))
                .foregroundColor(Color("text"))

            FormError(text: errorText)

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
                Group {
                    if loading {
                        HStack {
                            Spacer()
                            ActivityIndicator(shouldAnimate: $loading)
                            Spacer()
                        }
                    } else {
                        HStack {
                            Spacer()
                            Text("Login")
                                .tracking(0.5)
                            Spacer()
                        }
                    }
                }
                .font(Font.custom(Constants.Font.title, size: 16))
                .foregroundColor(loginDisabled() ? Color("gray") : Color("primary"))
                .padding()
                .background(loginDisabled() ? Color("gray").opacity(0.2) : Color("primary").opacity(0.2))
                .cornerRadius(10)
            }
            .disabled(loginDisabled())

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

    func loginDisabled() -> Bool {
        return email.isEmpty || password.isEmpty || loading
    }

    func initClick() {
        self.loading = true
        self.errorText = ""
    }

    func login() {
        initClick()

        if !email.isEmpty && !password.isEmpty {
            self.session.login(email: email, password: password) { (result, error) in
                self.loading = false

                if error != nil {
                    self.errorText = error!.localizedDescription
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
