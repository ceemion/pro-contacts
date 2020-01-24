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

    @State private var loading: Bool = false
    @State private var errorText: String = ""

    @State var showInputAlert: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("""
                Let's create
                your account
                """)
                .font(Font.custom(Constants.Font.titleMed, size: 25))
                .foregroundColor(Color("text"))

            FormError(text: errorText)

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
                            Text("Create Account")
                                .tracking(0.5)
                            Spacer()
                        }
                    }
                }
                .font(Font.custom(Constants.Font.title, size: 16))
                .foregroundColor(onCreateDisabled() ? Color("gray") : Color("primary"))
                .padding()
                .background(onCreateDisabled() ? Color("gray").opacity(0.2) : Color("primary").opacity(0.2))
                .cornerRadius(10)
            }
            .disabled(onCreateDisabled())

            Spacer()
        }
        .navigationBarTitle("", displayMode: .inline)
        .alert(isPresented: $showInputAlert) {
            Alert(
                title: Text("All fields are required!"),
                dismissButton: .default(Text("Ok"))
            )
        }
        .padding()
    }

    func onCreateDisabled() -> Bool {
        return loading || email.isEmpty || password.isEmpty || name.isEmpty || phone.isEmpty
    }

    func initClick() {
        self.loading = true
        self.errorText = ""
    }

    func register() {
        initClick()

        if !email.isEmpty && !password.isEmpty && !name.isEmpty && !phone.isEmpty {
            session.register(name: "", email: email, phone: "", password: password) { (result, error) in
                self.loading = false

                if error != nil {
                    self.errorText = error!.localizedDescription
                    print("Create User Error", error as Any)
                } else {
                    self.session.addUserToDb(name: self.name, email: self.email, phone: self.phone)
                    self.email = ""
                    self.password = ""
                    self.name = ""
                    self.phone = ""
                }
            }
        } else {
            self.showInputAlert.toggle()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
