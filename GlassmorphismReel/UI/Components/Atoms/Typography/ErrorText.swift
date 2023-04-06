//
//  ErrorText.swift
//  GlassmorphismReel
//
//  Created by Landon Johnson on 4/4/23.
//

import Foundation
import SwiftUI


struct ErrorText: View {
    var errorText: String
    var body: some View {
        if !errorText.isEmpty{
            return Text(errorText).foregroundColor(Color("ErrorColor"))
            
        } else {
            return Text("")
        }
    }
}
