//
//  GlassTextField.swift
//  GlassmorphismReel
//
//  Created by Landon Johnson on 4/4/23.
//

import Foundation
import SwiftUI

struct GlassTextField: View {
    
    var errorText = "this is error text"
    var helperText = "Helper text"
    var placeholder = ""
    @State var inFocus = false
    @Binding var text: String
    
    var body: some View {
        VStack{
            TextField(placeholder, text: $text, onEditingChanged: { (editingChanged) in
                if editingChanged {
                    self.inFocus = true
                } else {
                    self.inFocus = false
                }
            })
            .autocapitalization(.none)
            .modifier(GlassTextFieldModifier(focused: $inFocus))
            ErrorText(errorText: errorText)
            
        }
    }
}

