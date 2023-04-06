//
//  OnboardingLandingHeader.swift
//  GlassmorphismReel
//
//  Created by Landon Johnson on 4/4/23.
//

import Foundation
import SwiftUI
struct OnboardingLandingHeader<Content: View>: View {
    @ViewBuilder var renderLeftContent: Content
    
    var text: String
    var fontFamily = CustomFontType.FontTwoRegular
    var body: some View {
        HStack{
            
        }

       
    }}


#if DEBUG
struct OnboardingLandingHeader_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingLandingHeader(renderLeftContent: {
            TextButton(text: "Sign Up", fontFamily: CustomFontType.FontTwoRegular, toUpperCase: true, onPress: {})
            
        }
        ,
        text: "",fontFamily: CustomFontType.FontTwoRegular
            )
            
    }
  
}
#endif
