//
//  TitleText.swift
//  GlassmorphismReel
//
//  Created by Landon Johnson on 4/5/23.
//

import Foundation
import SwiftUI
struct TitleText:  View {
    var text: String
    var fontFamily = CustomFontType.FontOneBold
    var fontSize = 30
    var paddingBottom = 0.0
    
    var body: some View {
        Text(text)
            .font(.custom(fontFamily.rawValue, size: CGFloat(fontSize)))
            .foregroundColor(Color.white)
            .padding([.top], CGFloat( 0))

            .padding([.bottom], CGFloat( paddingBottom))
            .frame(maxWidth: .infinity, alignment: .leading)
            .shadow(color: Color("ShadowColor"), radius: 2)
    }
}
