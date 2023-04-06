//
//  FlatGlassView.swift
//  GlassmorphismReel
//
//  Created by Landon Johnson on 4/4/23.
//

import Foundation
import SwiftUI


struct FlatGlassView: ViewModifier {
    func body(content: Content) -> some View {
        if #available(iOS 15.0, *) {
            content.padding()
                .frame(height: 50)
                .background(.ultraThinMaterial)
                .cornerRadius(14)
        } else {
            content.padding()
                .frame(height: 50)
                .cornerRadius(14)
        }
    }
}
