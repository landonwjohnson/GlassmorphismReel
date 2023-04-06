//
//  OnboardingLandingFooter.swift
//  GlassmorphismReel
//
//  Created by Landon Johnson on 4/4/23.
//

import Foundation
import SwiftUI

struct OnboardingLandingFooter<Content: View>: View {
    @ViewBuilder var renderOnPressContent: Content
    
    var text: String
    var fontFamily = CustomFontType.FontTwoRegular
    var body: some View {
        
        HStack {
            HStack{
                
                Text(text)
                    .font(.custom(fontFamily.rawValue, size: 18))
                
                    .frame(maxWidth: .infinity, alignment: .leading).foregroundColor(.white)
                
                renderOnPressContent
            }.frame(width: 220, alignment: .leading)
            

            Spacer()
        }.padding([.top], 20)
    }}



#if DEBUG
struct OnboardingLandingFooter_Previews: PreviewProvider {
    static var previews: some View {
        
        OnboardingLandingFooter(renderOnPressContent: {TextButton(text: "Sign Up", toUpperCase: true, onPress: {})}, text: "New to Devlander?", fontFamily: CustomFontType.FontTwoRegular)
            
    }
  
}
#endif
