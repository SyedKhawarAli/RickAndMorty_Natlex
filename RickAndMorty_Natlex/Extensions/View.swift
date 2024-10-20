//
//  View.swift
//  RickAndMorty_Natlex
//
//  Created by Khawar Shah on 17.10.2024.
//

import SwiftUI

extension View {
    func roundedCorner(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}
