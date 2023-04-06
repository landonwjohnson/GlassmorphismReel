//
//  GlassTextFieldModifier.swift
//  GlassmorphismReel
//
//  Created by Landon Johnson on 4/4/23.
//

import Foundation
import SwiftUI


struct GlassTextFieldModifier: ViewModifier {
    @Binding var focused: Bool
    @State var thickMaterialOn = false
    
    
    
    
    func body(content: Content) -> some View {
        if focused {
            return content
                .padding(.leading, 15)
                .padding(.trailing, 15)
                .padding(.top, 15)
                .padding(.bottom, 15)
                .frame(maxWidth: .infinity)
                .background(.ultraThickMaterial, in: RoundedRectangle(
                    cornerRadius: 7, style: .continuous))
                .shadow(radius: 30.0)
            
        } else {
            return content
                .padding(.leading, 15)
                .padding(.trailing, 15)
                .padding(.top, 15)
                .padding(.bottom, 15)
                .frame(maxWidth: .infinity)
                .background(.ultraThinMaterial, in: RoundedRectangle(
                    cornerRadius: 7, style: .continuous))
                .shadow(radius: 30.0)
            
        }
    }
}
