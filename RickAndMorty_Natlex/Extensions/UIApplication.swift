//
//  UIApplication.swift
//  RickAndMorty_Natlex
//
//  Created by Khawar Ali on 14.10.2024.
//

import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
