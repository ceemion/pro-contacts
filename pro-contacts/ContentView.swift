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
