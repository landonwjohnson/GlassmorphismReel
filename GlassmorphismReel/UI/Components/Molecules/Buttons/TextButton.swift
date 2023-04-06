//
//  TextButton.swift
//  GlassmorphismReel
//
//  Created by Landon Johnson on 4/4/23.
//

import Foundation
import SwiftUI

struct TextButton: View {
    let text: String
    var fontFamily = CustomFontType.FontTwoBold
    var toUpperCase = false
    var onPress: () -> Void
    var body: some View {
        
        
        if self.toUpperCase {
            Button(action: {
                onPress()
                
            }, label: {
                Text(text.uppercased())
                    .foregroundColor(.white)
                    .font(.custom(fontFamily.rawValue, size: 18))
                    .frame(alignment: .leading)
                    .bold()
            })
            
        } else {
            Button(action: {
                onPress()
                
            }, label: {
                Text(text)
                    .foregroundColor(.white)
                    .font(.custom(fontFamily.rawValue, size: 18))
                    .frame(alignment: .leading)
                    .bold()
            })
            
        }
        
    }
}


#if DEBUG
struct TextButton_Previews: PreviewProvider {
    static var previews: some View {
        TextButton(text: "hi", fontFamily: CustomFontType.FontOneBold, toUpperCase: true, onPress: {})
    }
}
#endif
