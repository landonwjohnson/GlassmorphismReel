////
////  GlassPanel.swift
////  GlassmorphismReel
////
////  Created by Landon Johnson on 4/5/23.
////
//
//import Foundation
////
////  CardGlassView.swift
////  GlassmorphismReel
////
////  Created by Landon Johnson on 4/5/23.
////
//
//import Foundation
//
//
////
////  FlatGlassView.swift
////  GlassmorphismReel
////
////  Created by Landon Johnson on 4/4/23.
////
//
//import SwiftUI
//
//struct VisualEffectView: UIViewRepresentable {
//
//    var effect: UIVisualEffect?
//    var color: UIColor?
//    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
//    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) {
//        uiView.effect = effect
//
//    }
//}
//
//
//
//struct GlassPanel: ViewModifier {
//
//    @State var childContentSize: CGSize = .zero
//
//    var computedSize: CGSize {
//        return childContentSize
//    }
//
//
//    func body(content: Content) -> some View {
//        ZStack{
//            VisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterial)).frame(height: computedSize.height)    .clipShape(RoundedRectangle(cornerRadius: 15))
//
//
//        ZStack{
//            ChildSizeReader(size: $childContentSize) {
//                VStack{
//
//
//            content
//                        .padding(20)
//                .border(Color.pink)
//            }
//            }
//
//        }
//        }.padding(20)
//    }
//
//}
//
//#if DEBUG
//struct GlassPanel_Previews: PreviewProvider {
//    static var previews: some View {
//        ZStack{
//
//
//        VStack {
//            Logo(src: "Logo")
//            VStack{
//
//                VStack(spacing: 25){
//                    LogoTitleDescriptionHeading(title: "Log in with your email", description: "You will use this email and password to log into your accounts for all your favorite services across the Devlander companies")
//
//
//
//                    SubmitButton(text: "Continue", disabled: false, onPress: {
//                    })
//
//
//
//                }
//
//
//
//                OnboardingLandingFooter(renderOnPressContent: {TextButton(text: "Sign Up", toUpperCase: true, onPress: {
//                })}, text: "New to Devlander?", fontFamily: CustomFontType.FontTwoRegular)
//
//
//
//
//            }.modifier(GlassPanel())
//
//
//
//        }
//
//        }.background(Image("HotSprings").resizable()
//            .scaledToFill().ignoresSafeArea(.all))    }
//
//
//}
//#endif

//
//  GlassPanel.swift
//  GlassmorphismReel
//
//  Created by Landon Johnson on 4/5/23.
//

import Foundation
//
//  CardGlassView.swift
//  GlassmorphismReel
//
//  Created by Landon Johnson on 4/5/23.
//

import Foundation


//
//  FlatGlassView.swift
//  GlassmorphismReel
//
//  Created by Landon Johnson on 4/4/23.
//

import SwiftUI

struct VisualEffectView: UIViewRepresentable {

    var effect: UIVisualEffect?
    var color: UIColor?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) {
        uiView.effect = effect
        
    }
}



struct GlassPanel: ViewModifier {
    
    @State var childContentSize: CGSize = .zero
    
    var computedHeight: Double {
        let height = childContentSize.height
        return height
    }
    
 

    func body(content: Content) -> some View {
        ZStack{
//            VisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterial)).frame(height: computedSize.height)    .clipShape(RoundedRectangle(cornerRadius: 15))
                
            
        ZStack{
            GlassContainer(height: computedHeight)
            ChildSizeReader(size: $childContentSize) {
                VStack{
                    
            
            content
                        .padding(20)
            }
            }

        }
        }.padding(20)
    }

}

#if DEBUG
struct GlassPanel_Previews: PreviewProvider {
    static var previews: some View {
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
    
        }.background(Image("HotSprings").resizable()
            .scaledToFill().ignoresSafeArea(.all))    }

  
}
#endif
