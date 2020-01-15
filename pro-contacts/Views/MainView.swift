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

    @State var dates = [Date]()
    @State private var showPersonForm: Bool = false

    var body: some View {
        NavigationView {
            PersonsView(dates: $dates)
                .navigationBarTitle(Text("ProContacts"))
                .navigationBarItems(
                    leading: EditButton(),
                    trailing: HStack {
//                        Button(action: { withAnimation { self.session.logout() } }) {
//                            Image(systemName: "power")
//                                .padding()
//                        }
                        Button(action: { self.showPersonForm.toggle() }) {
                            Image(systemName: "plus")
                                .padding(.vertical)
                        }
                    }
                )
            PersonDetailView()
        }
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
