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
    @State var move = false
    let proxy: GeometryProxy

    let color: Color

    let rotationStart: Double
    let duration: Double
    let alignment: Alignment
    


    var body: some View {
            Circle()
                .fill(color)
                .frame(height: proxy.size.height / provider.frameHeightRatio)
                .offset(provider.offset)
                .rotationEffect(.init(degrees: move ? rotationStart : rotationStart + 360) )
                .animation(Animation.linear(duration: duration).repeatForever(autoreverses: false))

                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
                .opacity(0.8)
                .onAppear {
                    move.toggle()
                }
        
     
    }
}

struct FloatingClouds: View {
    @Environment(\.colorScheme) var scheme
    let blur: CGFloat = 60

    var body: some View {
        ZStack{
            Color("ColorFive")

        GeometryReader { proxy in
            ZStack {
                
                Cloud(proxy: proxy,
                      color: Theme.ellipsesBottomTrailing(forScheme: scheme),
                      rotationStart: 0,
                      duration: 60,
                      alignment: .bottomTrailing)
                Cloud(proxy: proxy,
                      color: Theme.ellipsesTopTrailing(forScheme: scheme),
                      rotationStart: 240,
                      duration: 50,
                      alignment: .topTrailing)
                Cloud(proxy: proxy,
                      color: Theme.ellipsesBottomLeading(forScheme: scheme),
                      rotationStart: 120,
                      duration: 80,
                      alignment: .bottomLeading)
                Cloud(proxy: proxy,
                      color: Theme.ellipsesTopLeading(forScheme: scheme),
                      rotationStart: 180,
                      duration: 70,
                      alignment: .topLeading)
            }
            
        
        }.blur(radius: blur)

        }
        .ignoresSafeArea()
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
