//
//  DescriptionText.swift
//  GlassmorphismReel
//
//  Created by Landon Johnson on 4/4/23.
//

import Foundation
import SwiftUI

struct DescriptionText:  View {
    var text: String
    var fontFamily = CustomFontType.FontTwoRegular
    var fontSize = 17
    var paddingBottom = 30
    var paddingTop = 1
    
    var body: some View {
        Text(text)
            .font(.custom(fontFamily.rawValue, size: CGFloat(fontSize)))
            .padding([.top], CGFloat(paddingTop))
            .padding([.bottom], CGFloat(paddingTop))
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(Color.white)
            .shadow(color: Color("ShadowColor"), radius: 2)


    }
}
