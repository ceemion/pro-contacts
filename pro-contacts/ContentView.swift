//
//  ContentView.swift
//  pro-contacts
//
//  Created by Fiyinfoluwa Adebayo on 13/01/2020.
//  Copyright © 2020 Kompilab Limited. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var session: FirebaseSession

    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .font: UIFont(name: Constants.Font.nav, size: 30)!]
        UINavigationBar.appearance().titleTextAttributes = [
            .font: UIFont(name: Constants.Font.nav, size: 16)!]
    }

    var body: some View {
        Group {
            if session.currentUser != nil {
                MainView()
            } else {
                LandingView()
            }
        }
        .onAppear(perform: getUser)
    }

    func getUser() {
        session.listen()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
