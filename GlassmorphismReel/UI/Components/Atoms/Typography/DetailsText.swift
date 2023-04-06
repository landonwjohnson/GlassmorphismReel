//
//  DetailsText.swift
//  GlassmorphismReel
//
//  Created by Landon Johnson on 4/4/23.
//

import Foundation
import SwiftUI

struct DetailsText: View {
    var text: String
    var fontFamily = CustomFontType.FontTwoRegular
    var fontSize = 15
    var paddingBottom = 0
    var opacity = 0.8
    var paddingTop = 1

    var body: some  View {
            if !text.isEmpty{
                 Text(text)
                    .font(.custom(fontFamily.rawValue, size: CGFloat(fontSize)))
                    .padding([.top], CGFloat(paddingTop))
                    .padding([.bottom], CGFloat(paddingTop))

                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color.white)
                    .opacity(opacity)

            } else {
                 Text("")
            }
    }


}
