//
//  LocationsListView.swift
//  RickAndMorty_Natlex
//
//  Created by Khawar Ali on 20.10.2024.
//

import SwiftUI

struct LocationsListView: View {
    @EnvironmentObject private var vm: HomeViewModel
    @Binding var allLocations: [LocationModel]
    @State var selection: LocationModel?
    
    @State var showSelected: Bool = true
    var body: some View {
        LazyVStack {
            ForEach(allLocations) { location in
                Button {
                    selection = location
                    showSelected.toggle()
                } label: {
                    HStack {
                        Text(location.name ?? "")
                        if selection == location {
                            Spacer()
                            Image(systemName: "checkmark")
                        }
                    }
                }
            }
            .listRowBackground(Color.theme.searchBarColor)
            
            Button {
                vm.loadMoreLocations()
            } label: {
                Text("")
            }
            .onAppear {
                vm.loadMoreLocations()
            }
        }
        .padding(.horizontal, 0)
    }
}
