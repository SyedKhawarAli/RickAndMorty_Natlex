//
//  CharacterCardView.swift
//  RickAndMorty_Natlex
//
//  Created by Khawar Shah on 17.10.2024.
//

import SwiftUI

struct CharacterCardView: View {
    @EnvironmentObject private var vm: HomeViewModel
    @Binding var allCharacter: [CharacterModel]
    @State private var selectedCharacter: CharacterModel?
    @State private var isShowingCardDetails: Bool = false
    
    var body: some View {
        LazyVStack {
            ForEach(allCharacter) { character in
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.theme.searchBarColor)
                    VStack {
                        AsyncImage(url: URL(string: character.image ?? "")) { image in
                            image.resizable()
                            
                        } placeholder: {
                            Color.gray
                        }
                        .frame(height: 150)
                        .frame(maxWidth: .infinity)
                        .roundedCorner(16, corners: [.topLeft, .topRight])
                        
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Text(character.name)
                                    .font(.title)
                                    .fontWeight(.bold)
                                Spacer()
                                Image(systemName: "chevron.down")
                            }
                            HStack {
                                Circle()
                                    .frame(width: 8)
                                    .foregroundStyle(character.status == .dead ? .red : .green)
                                Text(character.status?.rawValue ?? "")
                            }
                            VStack(alignment: .leading) {
                                Text("Last known location")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                                Text(character.location?.name ?? "")
                            }
                            VStack(alignment: .leading) {
                                Text("First seen in:")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                                Text(character.origin?.name ?? "")
                            }
                            
                        }
                        .padding(.horizontal)
                        .padding(.bottom)
                    }
                }
                .padding(.vertical, 8)
                .onTapGesture {
                    isShowingCardDetails.toggle()
                    selectedCharacter = character
                }
            }
            Button {
                loadaMore()
            } label: {
                Text("loading more...")
                    .onAppear {
                        DispatchQueue.global(qos: .background).asyncAfter(deadline: DispatchTime(uptimeNanoseconds: 10)) {
                            self.loadaMore()
                        }
                    }
            }
        }
        .navigationDestination(isPresented: $isShowingCardDetails) {
            CharacterDetailsView(selectedCharacter:$selectedCharacter)
        }
    }
    
    func loadaMore() {
        vm.loadMoreCharacters()
    }
}

#Preview {
    CharacterCardView(allCharacter: .constant(DeveloperPreview.instance.allCharacters))
        .environmentObject(HomeViewModel())
}
