//
//  GlassTextField.swift
//  GlassmorphismReel
//
//  Created by Landon Johnson on 4/4/23.
//

import Foundation
import Combine
import SwiftUI

struct GlassTextField: View {
    
   
    @State private var inFocus = false
    @Binding var text: String
    var placeholder = ""
    var errorText = "this is error text"
    var helperText = "Helper text"
    var onReceiveCallback : (_ value: String?) -> ()

    
    var body: some View {
        VStack{
            TextField(placeholder, text: $text, onEditingChanged: { (editingChanged) in
                if editingChanged {
                    self.inFocus = true
                } else {
                    self.inFocus = false
                }
            }).onReceive(Just(text)) { text in
                onReceiveCallback(text)
            }

            .autocapitalization(.none)
            .modifier(GlassTextFieldModifier(focused: $inFocus))
            HStack{
                ErrorText(errorText: errorText)
                Spacer()
            }
            
        }
    }
}

