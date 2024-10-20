//
//  DeadAliveStatusView.swift
//  RickAndMorty_Natlex
//
//  Created by Khawar Ali on 14.10.2024.
//

import SwiftUI

struct DeadAliveStatusView: View {
    
    @EnvironmentObject private var vm: HomeViewModel

    var body: some View {
        CustomSegmentedControl(
            preselectedStatus: $vm.characterStatus,
            options: Status.allCases,
            color: Color.theme.accent,
            bgColor: Color.theme.searchBarColor
        )
    }
}

#Preview {
    DeadAliveStatusView()
        .environmentObject(HomeViewModel())
}

struct CustomSegmentedControl: View {
    @Binding var preselectedStatus: Status
    var options: [Status]
    var color: Color = .blue
    var bgColor: Color = .blue.opacity(0.5)

    var body: some View {
        HStack(spacing: 0) {
            
            ForEach(options.indices, id: \.self) { index in
                if options[index] != .unknown {
                    ZStack {
                        Rectangle()
                            .fill(bgColor)
                        
                        Rectangle()
                            .fill(color)
                            .cornerRadius(12)
                            .padding(2)
                            .opacity(preselectedStatus == options[index] ? 1 : 0.01)
                            .onTapGesture {
                                withAnimation(.interactiveSpring()) {
                                    preselectedStatus = options[index]
                                }
                            }
                            .padding(4)
                    }
                    .overlay(
                        Text(options[index].rawValue)
                            .font(.headline)
                            .foregroundColor(preselectedStatus == options[index] ? .black : .white)
                    )
                }
            }
        }
        .frame(height: 54)
        .cornerRadius(16)
    }
}
