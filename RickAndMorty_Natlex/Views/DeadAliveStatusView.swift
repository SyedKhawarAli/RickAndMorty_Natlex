//
//  DeadAliveStatusView.swift
//  RickAndMorty_Natlex
//
//  Created by Khawar Ali on 14.10.2024.
//

import SwiftUI

struct DeadAliveStatusView: View {
    
    @State var selectedStatus: Int = 0

    var body: some View {
//        Picker("What is your favorite color?", selection: $selectedStatus) {
//            Text("Dead").tag(0)
//            Text("Alive").tag(1)
//        }
//        .pickerStyle(.segmented)
//        .colorMultiply(.theme.accent)
//        .background(Color.theme.searchBarColor)
//        .scaledToFit()
//        .scaleEffect(CGSize(width: 1, height: 1.25))
        CustomSegmentedControl(
            preselectedIndex: $selectedStatus,
            options: ["Dead", "Alive"]
        )
        .padding()
    }
}

#Preview {
    DeadAliveStatusView()
}

struct CustomSegmentedControl: View {
    @Binding var preselectedIndex: Int
    var options: [String]
    let color = Color.theme.accent

    var body: some View {
        HStack(spacing: 0) {
            ForEach(options.indices, id:\.self) { index in
                ZStack {
                    Rectangle()
                        .fill(color.opacity(0.2))

                    Rectangle()
                        .fill(color)
                        .cornerRadius(20)
                        .padding(2)
                        .opacity(preselectedIndex == index ? 1 : 0.01)
                        .onTapGesture {
                                withAnimation(.interactiveSpring()) {
                                    preselectedIndex = index
                                }
                            }
                }
                .overlay(
                    Text(options[index])
                )
            }
        }
        .frame(height: 50)
        .cornerRadius(20)
    }
}
