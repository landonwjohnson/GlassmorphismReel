//
//  Theme.swift
//  GlassmorphismReel
//
//  Created by Landon Johnson on 4/4/23.
//

import Foundation
import SwiftUI

enum CustomFontType: String  {
    case FontOneRegular = "Figtree-Regular"
    case FontOneBold = "Figtree-Bold"
    case FontTwoRegular = "PTSans-Regular"
    case FontTwoBold = "PTSans-Bold"
    
}


struct Theme {
    static var generalBackground: Color {
        return Color("ColorFive")
    }
    
    static func differentiateWithoutColorBackground(forScheme scheme: ColorScheme) -> Color {
        let any = Color(white: 0.95)
        let dark = Color(white: 0.2)
        switch scheme {
        case .light:
            return any
        case .dark:
            return dark
        @unknown default:
            return any
        }
    }
    
    static func ellipsesTopLeading(forScheme scheme: ColorScheme) -> Color {
        let any = Color("ColorOne")
        
        switch scheme {
        case .light:
            return any
        case .dark:
            return any
        @unknown default:
            return any
        }
    }
    
    static func ellipsesTopTrailing(forScheme scheme: ColorScheme) -> Color {
        let any = Color("ColorTwo")
        let dark = Color("ColorTwo")
        
        switch scheme {
        case .light:
            return any
        case .dark:
            return dark
        @unknown default:
            return any
        }
    }
    
    static func ellipsesBottomTrailing(forScheme scheme: ColorScheme) -> Color {
        return Color("ColorThree")
    }
    
    static func ellipsesBottomLeading(forScheme scheme: ColorScheme) -> Color {
        let any = Color("ColorFour")
        let dark = Color("ColorFour")
        switch scheme {
        case .light:
            return any
        case .dark:
            return dark
        @unknown default:
            return any
        }
    }
}
