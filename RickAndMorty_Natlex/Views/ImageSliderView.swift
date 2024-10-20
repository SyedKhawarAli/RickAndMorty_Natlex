//
//  ImageSliderView.swift
//  RickAndMorty_Natlex
//
//  Created by Khawar Ali on 14.10.2024.
//

import SwiftUI

struct ImageSliderView: View {
 
    @State var currentIndex: Int = 0
    @State var wallpapersArray: [String] = ["wallpaper1", "wallpaper2", "wallpaper3"]
    
    var body: some View {
        ZStack {
            HStack {
                Image(wallpapersArray[currentIndex])
                    .resizable()
                    .frame(height: 100)
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity)
            }
            HStack {
                if wallpapersArray.count > 0 {
                    Button(action: {
                        currentIndex = currentIndex == 0 ? wallpapersArray.count - 1 : currentIndex - 1
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
                        currentIndex = currentIndex == wallpapersArray.count - 1 ? 0 : currentIndex + 1
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
    ImageSliderView()
}
