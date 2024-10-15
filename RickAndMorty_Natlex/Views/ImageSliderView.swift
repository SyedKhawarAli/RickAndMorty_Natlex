//
//  ImageSliderView.swift
//  RickAndMorty_Natlex
//
//  Created by Khawar Ali on 14.10.2024.
//

import SwiftUI

struct ImageSliderView: View {
 
    @Binding var allCharacter: [CharacterModel]
    @State var currentIndex: Int = 0
    
    var body: some View {
        ZStack {
            HStack {
                if allCharacter.count > 0 {
                    AsyncImage(url: URL(string: allCharacter[currentIndex].image ?? "")) { image in
                        image.resizable()
                    } placeholder: {
                        Color.gray
                    }
                    .frame(height: 150)
                    .frame(maxWidth: .infinity)
                }
            }
            HStack {
                if allCharacter.count > 0 {
                    Button(action: {
                        currentIndex = currentIndex == 0 ? allCharacter.count - 1 : currentIndex - 1
                    }) {
                        Image(systemName: "chevron.left")
                            .renderingMode(.template)
                            .fontWeight(.bold)
                            .tint(.white)
                    }
                    .padding()
                    .background(
                        Circle()
                            .fill(Color.theme.accent)
                            .frame(width: 36)
                    )
                    Spacer()
                    
                    Button(action: {
                        currentIndex = currentIndex == allCharacter.count - 1 ? 0 : currentIndex + 1
                    }) {
                        Image(systemName: "chevron.right")
                            .renderingMode(.template)
                            .fontWeight(.bold)
                            .tint(.white)
                    }
                    .padding()
                    .background(
                        Circle()
                            .fill(Color.theme.accent)
                            .frame(width: 36)
                    )
                }
            }
        }
    }
}

#Preview {
    ImageSliderView(allCharacter: .constant(DeveloperPreview.instance.allCharacters))
}
