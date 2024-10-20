//
//  HomeView.swift
//  RickAndMorty_Natlex
//
//  Created by Khawar Ali on 14.10.2024.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var vm: HomeViewModel

    var body: some View {
        ZStack {
            // background layer
            Color.theme.background
                .ignoresSafeArea()
            
            // content
            VStack(spacing: 16) {
                SearchBarView(searchText: $vm.searchText)
                    .padding(.horizontal)
                ScrollView {
                    ImageSliderView()
                    DeadAliveStatusView()
                        .padding(.horizontal)
                    CharacterSpecieView()
                        .padding(.horizontal)
                    LastKnownLocationView(allLocations: $vm.allLocations)
                        .padding(.horizontal)
                    FirstSeenInView(allLocations: $vm.allLocations)
                        .padding(.horizontal)
                    CharacterCardView(allCharacter: $vm.filteredCharacters)
                        .padding(.horizontal)
                    Spacer(minLength: 0)
                }
            }
        }
        .onAppear{
            vm.filterCharacters()
        }
    }
}

#Preview {
    NavigationView {
        HomeView()
            .navigationBarHidden(true)
    }
    .environmentObject(HomeViewModel())
}
