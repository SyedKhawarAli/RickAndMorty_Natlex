//
//  LastKnownLocationView.swift
//  RickAndMorty_Natlex
//
//  Created by Khawar Shah on 15.10.2024.
//

import SwiftUI

struct LastKnownLocationView: View {
    @EnvironmentObject private var vm: HomeViewModel
    @Binding var allLocations: [LocationModel]
    
    @State var showSelected: Bool = true
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Button(action: {
                showSelected.toggle()
            }, label: {
                    
                HStack {
                    Text("Last Known Location")
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
                    if vm.lastKnownLocation != nil {
                        Text("\(vm.lastKnownLocation?.name ?? "")")
                            .font(.headline)
                            .foregroundStyle(Color.theme.accent)
                    }
                } else {
                    LazyVStack {
                        ForEach(allLocations) { location in
                            Button {
                                vm.lastKnownLocation = location
                                showSelected.toggle()
                            } label: {
                                HStack {
                                    Text(location.name ?? "")
                                        .foregroundStyle(Color(uiColor: .systemGray))
                                    Spacer()
                                    if vm.lastKnownLocation == location {
                                        Image(systemName: "checkmark")
                                    }
                                }
                            }
                        }
                        .listRowBackground(Color.theme.searchBarColor)
                    }
                    .padding(.horizontal, 0)
                }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.theme.searchBarColor)
        )
//        .onAppear {
//            vm.lastKnownLocation = allLocations.first
//        }
    }
}

#Preview {
    LastKnownLocationView(allLocations: .constant(DeveloperPreview.instance.allLocations))
}
