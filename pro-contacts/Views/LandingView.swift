//
//  LandingView.swift
//  pro-contacts
//
//  Created by Fiyinfoluwa Adebayo on 14/01/2020.
//  Copyright © 2020 Kompilab Limited. All rights reserved.
//

import SwiftUI

struct LandingView: View {

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 5) {
//                Image("hoplon.logo.primary")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 100, height: 100)

                Text("Professional Contacts")
//                    .foregroundColor(Color("primary"))
//                    .font(Font.custom(Constants.Font.logo, size: 30))
//                    .tracking(3.0)
//                Text("Track Lenders and Borrowers")
//                    .foregroundColor(Color("gray"))
//                    .font(Font.custom(Constants.Font.title, size: 14))

                Spacer()
                HStack {
                    Spacer()
                }

                NavigationLink(destination: RegisterView()) {
                    HStack {
                        Spacer()
                        Text("Get Started")
                            .tracking(0.5)
                        Spacer()
                    }
//                    .font(Font.custom(Constants.Font.title, size: 16))
//                    .foregroundColor(Color("primary"))
                    .padding()
//                    .background(Color("primary").opacity(0.2))
//                    .cornerRadius(10)
                }

                NavigationLink(destination: LoginView()) {
                    HStack {
                        Spacer()
                        Text("Log in")
                            .tracking(0.5)
                        Spacer()
                    }
//                    .foregroundColor(Color("gray"))
//                    .font(Font.custom(Constants.Font.main, size: 16))
                    .padding()
                }
            }
            .padding(.horizontal, 16)
        }
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}
