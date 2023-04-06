//
//  LogoTitleDescriptionHeading.swift
//  GlassmorphismReel
//
//  Created by Landon Johnson on 4/4/23.
//

import Foundation
import SwiftUI




struct LogoTitleDescriptionHeading:  View {
    var sectionText = ""
    var title: String;
    var description: String;
    
    
    var body: some View {
        VStack(spacing: 18) {
            VStack{
                
                DetailsText(text: sectionText)
                TitleText(text: title)
            }
            
            DescriptionText(text: description)
            
        }
    }
}




#if DEBUG
struct LogoTitleDescriptionHeading_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            
            ZStack{
                
                
                
                
                LogoTitleDescriptionHeading(sectionText: "section",  title:  "Title", description: "Description")
            }.padding(20)
        }.ignoresSafeArea()
        
        
    }
    
}
#endif
