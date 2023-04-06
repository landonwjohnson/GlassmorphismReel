//
//  SubmitButton.swift
//  GlassmorphismReel
//
//  Created by Landon Johnson on 4/4/23.
//

import Foundation
import SwiftUI


struct SubmitButton: View {
    let text: String
    let disabled: Bool
    var onPress: () -> Void
    var body: some View {
        Button(action: {
            onPress()
        }, label: {
            Text(text.uppercased())
                .foregroundColor(.white)
                .frame(alignment: .leading)
                .backgroundStyle(Color(red: 27, green: 28, blue: 48, opacity: 0.5))
                .bold()
        }).padding(.leading, 20)
            .padding(.trailing, 20)
            .padding(.top, 15)
            .padding(.bottom, 15)
            .frame(maxWidth: .infinity)
            .background(Color("ColorFive")).cornerRadius(4)
            .cornerRadius(7)
        
    }
}


#if DEBUG
struct SubmitButton_Previews: PreviewProvider {
    static var previews: some View {
        SubmitButton(text: "Submit", disabled: false, onPress: {})
    }
}
#endif

