//
//  SearchBar.swift
//  pro-contacts
//
//  Created by Fiyinfoluwa Adebayo on 10/07/2020.
//  Copyright © 2020 Kompilab Limited. All rights reserved.
//

import Foundation
import SwiftUI

struct SearchBar: UIViewRepresentable {
    @Binding var text: String
    var placeholder: String
    
    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String
        
        init(text: Binding<String>) {
            _text = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
            searchBar.showsCancelButton = true
        }
        
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            text = ""
            searchBar.resignFirstResponder()
            searchBar.showsCancelButton = false
            searchBar.endEditing(true)
        }
    }
    
    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: $text)
    }
    
    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
//        searchBar.showsCancelButton = true
        searchBar.placeholder = placeholder
        searchBar.searchBarStyle = .minimal
        searchBar.autocapitalizationType = .none
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }
}





//func makeCoordinator() -> SearchBar.Coordinator {
//    return Coordinator(text: $text)
//}
//
//func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
//    let searchBar = UISearchBar(frame: .zero)
//    searchBar.delegate = context.coordinator
//    searchBar.searchBarStyle = .minimal
//    return searchBar
//}
//
//func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
//    uiView.text = text
//}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
