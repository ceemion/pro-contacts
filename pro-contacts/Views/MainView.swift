//
//  MainView.swift
//  pro-contacts
//
//  Created by Fiyinfoluwa Adebayo on 15/01/2020.
//  Copyright © 2020 Kompilab Limited. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var session: FirebaseSession

    @State private var showPersonForm: Bool = false

    var body: some View {
        NavigationView {
            Group {
                if self.session.fetchingContacts {
                    ActivityIndicator(shouldAnimate: self.$session.fetchingContacts)
                } else {
                    if self.session.contacts.isEmpty {
                        VStack {
                            Text("You have no contacts.")
                                .font(.footnote)
                                .foregroundColor(Color("gray"))
                                .padding(.vertical)
                            Spacer()
                        }
                    } else {
                        PersonsView(data: self.session.contacts)
                    }
                }
            }
            .navigationBarTitle(Text("ProContacts"))
            .navigationBarItems(
                leading: Button(action: { withAnimation { self.session.logout() } }) {
                    Image(systemName: "power")
                        .imageScale(.large)
                        .padding(.vertical)
                        .foregroundColor(Color("danger"))
                },
                trailing: Button(action: { self.showPersonForm.toggle() }) {
                    Image(systemName: "plus")
                        .imageScale(.large)
                        .padding(.vertical)
                }
            )
        }
        .accentColor(Color("primary"))
        .navigationViewStyle(DoubleColumnNavigationViewStyle())
        .sheet(isPresented: $showPersonForm) {
            PersonFormView()
                .environmentObject(FirebaseSession())
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
