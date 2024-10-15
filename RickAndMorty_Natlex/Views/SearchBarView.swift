//
//  SearchBarView.swift
//  RickAndMorty_Natlex
//
//  Created by Khawar Ali on 14.10.2024.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            
            TextField("Search by name", text: $searchText)
                .foregroundColor(.theme.accent.opacity(0.7))
                .disableAutocorrection(true)
            
            Image(systemName: searchText.isEmpty ? "magnifyingglass" : "xmark.circle.fill")
                .foregroundColor(
                    searchText.isEmpty ? .theme.secondaryText : .theme.accent
                )
                .onTapGesture {
                    UIApplication.shared.endEditing()
                    searchText = ""
                }
        }
        .font(.headline)
        .padding()
        .background(
        RoundedRectangle(cornerRadius: 16)
            .fill(Color.theme.searchBarColor)
        )
        .padding()
    }
}


#Preview(traits: .sizeThatFitsLayout) {
    SearchBarView(searchText: .constant(""))
        .preferredColorScheme(.dark)
}

//#Preview(traits: .sizeThatFitsLayout) {
//    SearchBarView(searchText: .constant(""))
//        .preferredColorScheme(.dark)
//}
