//
//  Logo.swift
//  GlassmorphismReel
//
//  Created by Landon Johnson on 4/5/23.
//

import Foundation



//
//  LogoTitleDescriptionHeading.swift
//  GlassmorphismReel
//
//  Created by Landon Johnson on 4/4/23.
//

import Foundation
import SwiftUI






struct Logo:  View {
    var src = "Logo"
    
    
    var body: some View {
        Image(src)
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
        
    }
}




#if DEBUG
struct Logo_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            
            ZStack{
                
                
                
                
                Logo(src: "logo")
            }.padding(20)
        }.ignoresSafeArea()
        
        
    }
    
}
#endif
