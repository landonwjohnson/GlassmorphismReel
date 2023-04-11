//
//  SubmitButton.swift
//  GlassmorphismReel
//
//  Created by Landon Johnson on 4/4/23.
//

import Foundation
import SwiftUI

struct SubmitButtonModifier: ViewModifier {
     var disabled: Bool
    
    func body(content: Content) -> some View {
        if disabled {
            return content.padding(.leading, 20)
                .padding(.trailing, 20)
                .padding(.top, 15)
                .padding(.bottom, 15)
                .frame(maxWidth: .infinity)
                .background(Color(UIColor.lightGray).opacity(0.1)).cornerRadius(4)
                .cornerRadius(7)
               
             
            
        } else {
            return content.padding(.leading, 20)
                .padding(.trailing, 20)
                .padding(.top, 15)
                .padding(.bottom, 15)
                .frame(maxWidth: .infinity)
                .background(Color("ColorFive")).cornerRadius(4)
                .cornerRadius(7)
             
            
        }
    }
}

struct SubmitButtonTextModifier: ViewModifier {
    var disabled: Bool
    
    
    
    
    func body(content: Content) -> some View {
        if disabled {
            return content.foregroundColor(Color(UIColor.darkGray).opacity(0.1))
                .frame(alignment: .leading)
                .backgroundStyle(Color(red: 27, green: 28, blue: 48, opacity: 1))
                .bold()
               
             
            
        } else {
            return content.foregroundColor(.white)
                .frame(alignment: .leading)
                .backgroundStyle(Color(red: 27, green: 28, blue: 48, opacity: 0.5))
                .bold()
             
            
        }
    }
}


struct SubmitButton: View {
    let text: String
    let disabled: Bool
    var onPress: () -> Void
    var body: some View {
        Button(action: {
            
                onPress()
            
           
        }, label: {
            Text(text.uppercased()).modifier(SubmitButtonTextModifier(disabled: disabled))
               
        }).modifier(SubmitButtonModifier(disabled: disabled))
            .disabled(disabled)

        
    }
}


#if DEBUG
struct SubmitButton_Previews: PreviewProvider {
    static var previews: some View {
        SubmitButton(text: "Submit", disabled: true, onPress: {})
    }
}
#endif

