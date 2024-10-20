//
//  FirstSeenInView.swift
//  RickAndMorty_Natlex
//
//  Created by Khawar Shah on 17.10.2024.
//

import SwiftUI

struct FirstSeenInView: View {
    @Binding var allLocations: [LocationModel]
    @State var selection: LocationModel?

    @State var showSelected: Bool = true
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Button(action: {
                showSelected.toggle()
            }, label: {
                HStack {
                    Text("First Seen In")
                        .font(.caption)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .fontWeight(.light)
                        .padding(.horizontal)
                }
                .foregroundStyle(.white)
            })
            .padding(.vertical, 0)
                if showSelected {
                    if selection != nil {
                        Text("\(selection?.name ?? "")")
                            .font(.headline)
                            .foregroundStyle(Color.theme.accent)
                    }
                } else {
                    LazyVStack {
                        ScrollView(.vertical) {
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
                        }
                    }
                    // .frame(maxHeight: 200)
                    .padding(.horizontal, 0)
                }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.theme.searchBarColor)
        )
        .onAppear {
            selection = allLocations.first
        }
    }
}
