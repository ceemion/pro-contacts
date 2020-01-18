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

    @State private var keyboardHeight: CGFloat = 0

    @State private var suffix: String = ""
    @State private var firstName: String = "John"
    @State private var lastName: String = "Travolta"
    @State private var email: String = "jt@email.com"
    @State private var phoneNumber: String = "1234567"
    @State private var website: String = ""

    @State private var industry: String = ""
    @State private var company: String = "Tesla"
    @State private var department: String = ""
    @State private var jobTitle: String = "designer"
    @State private var workEmail: String = ""
    @State private var workPhoneNumber: String = ""

    @State private var skype: String = "@skype"
    @State private var linkedin: String = "linked"
    @State private var github: String = "gith"
    @State private var medium: String = "lamedium"
    @State private var twitter: String = "tweetus"
    @State private var facebook: String = "faceme"
    @State private var instagram: String = "haw.las_okay"

    @State private var notes: String = ""

    @State private var loading: Bool = false

    @State private var suffixSelect: Bool = false
    @State private var industrySelect: Bool = false

    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                Section(text: "Personal Information")
                VStack(spacing: 8) {
                    VStack(alignment: .leading, spacing: 5) {
                        Label(text: "Suffix")
                        TextField("Select", text: $suffix)
                            .textFieldStyle(ProTextFieldStyle())
                            .disabled(true)
                            .onTapGesture {
                                self.suffixSelect.toggle()
                        }
                    }
                    .sheet(isPresented: $suffixSelect) {
                        SuffixOptionsView(suffix: self.$suffix)
                    }

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

                    VStack(alignment: .leading, spacing: 5) {
                        Label(text: "Website")
                        TextField("", text: $website)
                            .textFieldStyle(ProTextFieldStyle())
                            .autocapitalization(.none)
                    }
                }
                .padding(.horizontal, 10)

                Section(text: "Work Information")
                VStack(spacing: 8) {
                    VStack(alignment: .leading, spacing: 5) {
                        Label(text: "Industry")
                        TextField("Select", text: $industry)
                            .textFieldStyle(ProTextFieldStyle())
                            .disabled(true)
                            .onTapGesture {
                                self.industrySelect.toggle()
                        }
                    }
                    .sheet(isPresented: $industrySelect) {
                        IndustryOptionsView(industry: self.$industry)
                    }

                    VStack(alignment: .leading, spacing: 5) {
                        Label(text: "Company")
                        TextField("", text: $company)
                            .textFieldStyle(ProTextFieldStyle())
                    }

                    VStack(alignment: .leading, spacing: 5) {
                        Label(text: "Department")
                        TextField("", text: $department)
                            .textFieldStyle(ProTextFieldStyle())
                    }

                    VStack(alignment: .leading, spacing: 5) {
                        Label(text: "Job Title")
                        TextField("", text: $jobTitle)
                            .textFieldStyle(ProTextFieldStyle())
                    }

                    VStack(alignment: .leading, spacing: 5) {
                        Label(text: "Work Email")
                        TextField("", text: $workEmail)
                            .keyboardType(.emailAddress)
                            .textFieldStyle(ProTextFieldStyle())
                            .autocapitalization(.none)
                    }

                    VStack(alignment: .leading, spacing: 5) {
                        Label(text: "Work Phone Number")
                        TextField("", text: $workPhoneNumber)
                            .keyboardType(.phonePad)
                            .textFieldStyle(ProTextFieldStyle())
                    }
                }
                .padding(.horizontal, 10)

                Section(text: "Social Profiles")
                VStack(spacing: 8) {
                    HStack {
                        Image("skype")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                        TextField("Skype", text: $skype)
                            .textFieldStyle(ProTextFieldStyle())
                            .autocapitalization(.none)
                    }

                    HStack {
                        Image("linkedin")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                        TextField("LinkedIn", text: $linkedin)
                            .textFieldStyle(ProTextFieldStyle())
                            .autocapitalization(.none)
                    }

                    HStack {
                        Image("github")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                        TextField("GitHub", text: $github)
                            .textFieldStyle(ProTextFieldStyle())
                            .autocapitalization(.none)
                    }

                    HStack {
                        Image("medium-monogram")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                        TextField("Medium blog", text: $medium)
                            .textFieldStyle(ProTextFieldStyle())
                            .autocapitalization(.none)
                    }

                    HStack {
                        Image("twitter")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                        TextField("Twitter", text: $twitter)
                            .textFieldStyle(ProTextFieldStyle())
                            .autocapitalization(.none)
                    }

                    HStack {
                        Image("facebook-old")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                        TextField("Facebook", text: $facebook)
                            .textFieldStyle(ProTextFieldStyle())
                            .autocapitalization(.none)
                    }

                    HStack {
                        Image("instagram")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                        TextField("Instagram", text: $instagram)
                            .textFieldStyle(ProTextFieldStyle())
                            .autocapitalization(.none)
                    }
                }
                .padding(.horizontal, 10)

                Section(text: "Others")
                VStack(spacing: 8) {
                    VStack(alignment: .leading, spacing: 5) {
                        Label(text: "Notes")
                        TextField("", text: $notes)
                            .textFieldStyle(ProTextFieldStyle())
                    }
                }
                .padding(.horizontal, 10)
            }
            .navigationBarTitle("New Professional Contact", displayMode: .inline)
            .navigationBarItems(
                leading: Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                    }) { Text("Cancel") }
                    .accentColor(Color("primary")),
                trailing: Button(action: {
                    self.saveContact()
                }) {
                    if loading {
                        ActivityIndicator(shouldAnimate: self.$loading)
                    } else {
                        Text("Save")
                    }
                }
                    .disabled(self.isFormInvalid())
                    .accentColor(Color("primary"))
                )
        }
        .offset(y: -self.keyboardHeight)
        .animation(.spring())
        .onAppear() {
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (notification) in
                let value = notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
                let height = value.height

                self.keyboardHeight = (height/2) // - 50
            }

            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (notification) in
               self.keyboardHeight = 0
           }
        }
    }

    func isFormInvalid() -> Bool {
        return loading || firstName.isEmpty || lastName.isEmpty || email.isEmpty || phoneNumber.isEmpty || industry.isEmpty || jobTitle.isEmpty || notes.isEmpty
    }

    func buildPayload() -> Dictionary<String, Any> {
        let timestamp = Int(NSDate().timeIntervalSince1970)

        return [
            "suffix": suffix,
            "firstName": firstName,
            "lastName": lastName,
            "email": email,
            "phoneNumber": phoneNumber,
            "website": website,
            "industry": industry,
            "company": company,
            "department": department,
            "jobTitle": jobTitle,
            "workEmail": workEmail,
            "workPhoneNumber": workPhoneNumber,
            "skype": skype,
            "linkedin": linkedin,
            "github": github,
            "medium": medium,
            "twitter": twitter,
            "facebook": facebook,
            "instagram": instagram,
            "notes": notes,
            "createdAt": timestamp,
            "updatedAt": timestamp
        ]
    }

    func saveContact() {
        self.loading = true

        self.session.postContact(payload: buildPayload()) { (result, error) in
            print("REsult: ", result)
            print("ERRor: ", error ?? "no contact post Errors.")
            self.loading = false
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct PersonFormView_Previews: PreviewProvider {
    static var previews: some View {
        PersonFormView()
    }
}
