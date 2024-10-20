//
//  CharacterSpecieView.swift
//  RickAndMorty_Natlex
//
//  Created by Khawar Shah on 15.10.2024.
//

import SwiftUI

struct CharacterSpecieView: View {
    @EnvironmentObject private var vm: HomeViewModel

    var body: some View {
        HStack {
            ForEach(Species.allCases, id: \.rawValue) { item in
                if item != .humanoid {
                    Button {
                        vm.characterSpecie = item
                    } label: {
                        Text(item.rawValue)
                            .font(.headline)
                            .foregroundColor(vm.characterSpecie == item ? .black : .white)
                    }
                    .padding()
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(vm.characterSpecie == item ? Color.theme.accent : Color.theme.searchBarColor)
                    )
                }
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    CharacterSpecieView()
        .environmentObject(HomeViewModel())
}
