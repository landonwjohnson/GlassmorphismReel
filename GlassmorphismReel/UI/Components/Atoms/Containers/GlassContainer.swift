//
//  GlassContainer.swift
//  GlassmorphismReel
//
//  Created by Landon Johnson on 4/6/23.
//

import Foundation
import SwiftUI








struct GlassContainer:  View {
    var height: Double
    
    var computedHeight: Double {
        return height
    }
    var body:  some View {
        
        ZStack{
            
            VStack{
                Color(
                    red: 255/255,
                    green: 255/255,
                    blue: 255/255,
                    opacity: 0.06)
//                VisualEffectView(effect: UIBlurEffect(style: .systemMaterialDark))
                
            }
            .frame(height: height)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .border(
                Color(
                    red: 255/255,
                    green: 255/255,
                    blue: 255/255,
                    opacity: 0.1
                )
            ).cornerRadius(15)
        }
    }
}












struct GlassContainer_ContentView:  View {
   var height = 40.0

    
  
    
    var body:  some View {
        ZStack{
            VStack{
                
                ZStack{
            

                VStack {
                    Logo(src: "Logo")
                    VStack{
                        
                        VStack(spacing: 25){
                            LogoTitleDescriptionHeading(title: "Log in with your email", description: "You will use this email and password to log into your accounts for all your favorite services across the Devlander companies")
                           
                            
                            
                            SubmitButton(text: "Continue", disabled: false, onPress: {
                            })
                            
                            
                            
                        }
                        
                        
                        
                        OnboardingLandingFooter(renderOnPressContent: {TextButton(text: "Sign Up", toUpperCase: true, onPress: {
                        })}, text: "New to Devlander?", fontFamily: CustomFontType.FontTwoRegular)
                        
                        
                        
                        
                    }.modifier(GlassPanel())
                    
                    
                    
                }
            
                }.background(Image("LightPainting").resizable()
                    .scaledToFill().ignoresSafeArea(.all))    }

          

            }
            
            
        }
        
    }




#if DEBUG
struct GlassContentView: PreviewProvider {

    static var previews: some View {
       
        GlassContainer_ContentView()
            
    }
    
    
  
}
#endif
