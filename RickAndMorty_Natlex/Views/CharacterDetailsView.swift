//
//  CharacterDetailsView.swift
//  RickAndMorty_Natlex
//
//  Created by Khawar Shah on 19.10.2024.
//

import SwiftUI

struct CharacterDetailsView: View {
    @Binding var selectedCharacter: CharacterModel?
    
    var body: some View {
        VStack(alignment: .leading) {
            if let selectedCharacter {
                if let imageUrl = selectedCharacter.image, let url = URL(string: imageUrl)  {
                    AsyncImage(url: url){ image in
                        image
                            .resizable()
                    } placeholder: {
                        Color.gray
                    }
                    .frame(height: 265)
                    .frame(maxWidth: .infinity)
                }
                VStack (alignment: .leading, spacing: 16){
                    Text(selectedCharacter.species?.rawValue ?? "")
                        .font(.headline)
                    HStack {
                        Circle()
                            .frame(width: 8)
                            .foregroundStyle(selectedCharacter.status == .dead ? .red : .green)
                        Text(selectedCharacter.status?.rawValue ?? "")
                            .font(.headline)
                    }
                    VStack(alignment: .leading) {
                        Text("Last known location")
                            .font(.caption)
                        Text(selectedCharacter.location?.name ?? "")
                            .font(.headline)
                    }
                    VStack(alignment: .leading) {
                        Text("First seen in:")
                            .font(.caption)
                        Text(selectedCharacter.origin?.name ?? "")
                            .font(.headline)
                    }
                    
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus libero turpis, semper imperdiet pharetra vel, sagittis sit amet lorem. Ut tincidunt viverra enim ac pharetra. Vestibulum vitae aliquam mi, nec sagittis augue. Mauris vulputate vel nibh et posuere. Duis consequat est sed nunc blandit volutpat. Mauris sagittis mattis neque, at mattis orci scelerisque ac. Nulla hendrerit et mauris sit amet rutrum. Fusce auctor leo nec elit fringilla, in tristique odio sollicitudin. Nulla id nibh sed turpis consectetur sagittis.")
                        .font(.body)
                        .padding(.top, 8)
                    Spacer()
                }
                .padding()
            }
        }
        .navigationTitle(selectedCharacter?.name ?? "")
    }
}

#Preview {
    CharacterDetailsView(selectedCharacter: .constant(DeveloperPreview.instance.allCharacters.first!))
}
