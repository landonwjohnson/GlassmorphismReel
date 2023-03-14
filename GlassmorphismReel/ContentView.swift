//
//  ContentView.swift
//  GlassmorphismReel
//
//  Created by Landon Johnson on 3/12/23.
//

import SwiftUI

struct Theme {
    static var generalBackground: Color {
        return Color("ColorFive")
    }
    
    static func ellipsesTopLeading(forScheme scheme: ColorScheme) -> Color {
        let any = Color("ColorOne")
        let dark = Color("ColorOne")
        
        switch scheme {
        case .light:
            return any
        case .dark:
            return any
        @unknown default:
            return any
        }
    }
    
    static func ellipsesTopTrailing(forScheme scheme: ColorScheme) -> Color {
            let any = Color("ColorTwo")
        let dark = Color("ColorTwo")

            switch scheme {
            case .light:
                return any
            case .dark:
                return dark
            @unknown default:
                return any
            }
        }
    
    static func ellipsesBottomTrailing(forScheme scheme: ColorScheme) -> Color {
         return Color("ColorThree")

        }
    
    static func ellipsesBottomLeading(forScheme scheme: ColorScheme) -> Color {
           let any = Color("ColorFour")
           let dark = Color("ColorFour")
           switch scheme {
           case .light:
               return any
           case .dark:
               return dark
           @unknown default:
               return any
           }
       }
}


class CloudProvider: ObservableObject {
    let offset:  CGSize
    let frameHeightRatio: CGFloat
    init(){
        frameHeightRatio = CGFloat.random(in: 0.7 ..< 1.4)
        
        offset = CGSize(width: CGFloat.random(in: -150 ..< 150),
                        height: CGFloat.random(in: -150 ..< 150))
    }
}


struct Cloud: View {
    @StateObject var provider = CloudProvider()
    let alignment: Alignment
    let proxy: GeometryProxy
    let color: Color

    var body: some View {
        Circle()
            .fill(color)
            .frame(height: proxy.size.height / provider.frameHeightRatio)
            .offset(provider.offset)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
    }
}

struct FloatingClouds: View {
    @Environment(\.colorScheme) var scheme

    var body: some View {
        GeometryReader { proxy in
            ZStack {
                
            Color("ColorFive")
                Cloud(alignment: .bottomTrailing,
                               proxy: proxy,
                               color: Theme.ellipsesBottomTrailing(forScheme: scheme))
                         Cloud(alignment: .topTrailing,
                               proxy: proxy,
                               color: Theme.ellipsesTopTrailing(forScheme: scheme))
                         Cloud(alignment: .bottomLeading,
                               proxy: proxy,
                               color: Theme.ellipsesBottomLeading(forScheme: scheme))
                         Cloud(alignment: .topLeading,
                               proxy: proxy,
                               color: Theme.ellipsesTopLeading(forScheme: scheme))
            }



        }.ignoresSafeArea()
    }
}



struct FlatGlassView: ViewModifier {
    func body(content: Content) -> some View {
        if #available(iOS 15.0, *){
            content.padding()
                .frame(height: 50)
                .background(.ultraThinMaterial)
                .cornerRadius(14)
        } else {
            content.padding()
                .frame(height: 50)
                .cornerRadius(14)
        }
    }
}

struct FlatSignUpScreen: View {
    @State var email = ""
       @State var password = ""
       @State var passwordAgain = ""
    
    var body: some View {
        if #available(iOS 15.0, *){
            VStack{
                
            }.padding()
                .background(.ultraThinMaterial)
                .foregroundColor(Color.primary.opacity(0.35))
                .foregroundStyle(.ultraThinMaterial)
                .cornerRadius(35)
                .padding()

        } else {
            VStack{
                
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        ZStack {
            FloatingClouds()
            VStack {
                
                FlatSignUpScreen()
            }        .padding()

        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
