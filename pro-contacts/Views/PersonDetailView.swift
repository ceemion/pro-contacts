//
//  PersonDetailView.swift
//  pro-contacts
//
//  Created by Fiyinfoluwa Adebayo on 15/01/2020.
//  Copyright © 2020 Kompilab Limited. All rights reserved.
//

import SwiftUI

private let dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .medium
    dateFormatter.timeStyle = .medium
    return dateFormatter
}()

struct PersonDetailView: View {
    var person: Person

    @State private var openMail: Bool = false
    @State private var openWhatsapp: Bool = false

    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(spacing: 20) {
                ZStack(alignment: .center) {
                    Circle()
                        .fill(Color("gray"))
                        .frame(width: 100, height: 100, alignment: .center)
                    HStack(spacing: 0) {
                        Text(person.firstName.prefix(1).uppercased())
                        Text(person.lastName.prefix(1).uppercased())
                    }
                    .font(Font.custom("HelveticaNeue-Medium", size: 40))
                    .foregroundColor(Color.white)
                }

                Text("\(person.suffix) \(person.firstName) \(person.lastName)")

                HStack(alignment: .center, spacing: 10) {
                    Image(systemName: "mappin")
                    Text(person.country)
                }

                HStack(alignment: .center, spacing: 30) {
                    Button(action: { Functions().phoneCallAction(self.person.phoneNumber) }) {
                        VStack(alignment: .center, spacing: 10) {
                            Image(systemName: "phone.circle.fill")
                                .imageScale(.large)
                                .accessibility(label: Text("Call"))
                            Text("call")
                                .font(Font.custom(Constants.Font.main, size: 12))
                        }
                    }
                    Button(action: { self.openMail.toggle() }) {
                        VStack(alignment: .center, spacing: 10) {
                            Image(systemName: "envelope.fill")
                                .imageScale(.large)
                                .accessibility(label: Text("Email"))
                            Text("mail")
                                .font(Font.custom(Constants.Font.main, size: 12))
                        }
                        .alert(isPresented: self.$openMail) {
                            Alert(
                                title: Text("Compose Mail"),
                                message: Text("Send an email to \(self.person.firstName) on \(self.person.email)?"),
                                primaryButton: .default(Text("Yes")) {
                                    Functions().openUrl("mailto:\(self.person.email)")
                                },
                                secondaryButton: .cancel())
                        }
                    }
                    VStack(alignment: .center, spacing: 5) {
                        Image("whatsapp")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .onTapGesture {
                                self.openWhatsapp.toggle()
                        }
                        Text("whatsapp")
                            .font(Font.custom(Constants.Font.main, size: 12))
                            .foregroundColor(Color("text"))
                    }
                    .alert(isPresented: self.$openWhatsapp) {
                        Alert(
                            title: Text("Open WhatsApp"),
                            message: Text("Message \(self.person.firstName) on \(self.person.phoneNumber)?"),
                            primaryButton: .default(Text("Open")) {
                                Functions().openUrl("https://api.whatsapp.com/send?phone=234\(self.person.phoneNumber)")
                            },
                            secondaryButton: .cancel())
                    }
                }
                .accentColor(Color("text"))
            }
        }
        .navigationBarItems(
            trailing: NavigationLink(destination: PersonFormView(), label: {
                Text("Edit")
            })
        )
    }
}

struct PersonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PersonDetailView(person: Person.init(firstName: "", lastName: "", email: "", phoneNumber: "", createdAt: 0, updatedAt: 0))
    }
}
