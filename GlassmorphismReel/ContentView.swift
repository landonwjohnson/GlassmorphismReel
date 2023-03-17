//
//  ContentView.swift
//  GlassmorphismReel
//
//  Created by Landon Johnson on 3/12/23.
//

import SwiftUI

struct TextButton: View {
    let text: String
    var toUpperCase = false
    var body: some View {
        if self.toUpperCase {
            Text(text.uppercased())
                .foregroundColor(.white)
                .frame(alignment: .leading)
                .bold()
                .border(.red)
        } else {
            Text(text)
                .foregroundColor(.white)
                .frame(alignment: .leading)
                .bold()
                .border(.red)
        }
      
    }
}

struct Theme {
  static var generalBackground: Color {
    return Color("ColorFive")
  }

  static func differentiateWithoutColorBackground(forScheme scheme: ColorScheme) -> Color {
    let any = Color(white: 0.95)
    let dark = Color(white: 0.2)
    switch scheme {
    case .light:
      return any
    case .dark:
      return dark
    @unknown default:
      return any
    }
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
  let offset: CGSize
  let frameHeightRatio: CGFloat
  init() {
    self.frameHeightRatio = CGFloat.random(in: 0.7 ..< 1.4)

    self.offset = CGSize(
      width: CGFloat.random(in: -150 ..< 150),
      height: CGFloat.random(in: -150 ..< 150)
    )
  }
}

func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
  if UIAccessibility.isReduceMotionEnabled {
    return try body()

  } else {
    return try withAnimation(animation, body)
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
      .rotationEffect(.init(degrees: move ? rotationStart : rotationStart + 360))
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
      .opacity(0.8)
      .onAppear {
        withOptionalAnimation(Animation.linear(duration: duration).repeatForever(autoreverses: false)) {
          move.toggle()
        }
      }
  }
}

struct FloatingClouds: View {
  @Environment(\.colorScheme) var scheme
  let blur: CGFloat = 60

  var body: some View {
    ZStack {
      Color("ColorFive")

      GeometryReader { proxy in
        ZStack {
          Cloud(
            proxy: proxy,
            color: Theme.ellipsesBottomTrailing(forScheme: scheme),
            rotationStart: 0,
            duration: 60,
            alignment: .bottomTrailing
          )
          Cloud(
            proxy: proxy,
            color: Theme.ellipsesTopTrailing(forScheme: scheme),
            rotationStart: 240,
            duration: 50,
            alignment: .topTrailing
          )
          Cloud(
            proxy: proxy,
            color: Theme.ellipsesBottomLeading(forScheme: scheme),
            rotationStart: 120,
            duration: 80,
            alignment: .bottomLeading
          )
          Cloud(
            proxy: proxy,
            color: Theme.ellipsesTopLeading(forScheme: scheme),
            rotationStart: 180,
            duration: 70,
            alignment: .topLeading
          )
        }

      }.blur(radius: blur)
    }
    .ignoresSafeArea()
  }
}

struct FlatGlassView: ViewModifier {
  func body(content: Content) -> some View {
    if #available(iOS 15.0, *) {
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
    if #available(iOS 15.0, *) {
      VStack {}.padding()
        .background(.ultraThinMaterial)
        .foregroundColor(Color.primary.opacity(0.35))
        .foregroundStyle(.ultraThinMaterial)
        .cornerRadius(35)
        .padding()

    } else {
      VStack {}
    }
  }
}

struct GlassTextFieldModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .padding(8.0)
      .background(Color.white.cornerRadius(8.0))
      .shadow(radius: 24.0)
      .padding()
  }
}

struct LoginWithEmailPrompt: View {
  @State var email = ""
  @State var password = ""
  @State var passwordAgain = ""

  var body: some View {
    VStack {
      VStack {
        Text("Log in with your email")
          .font(.system(size: 30))
          .bold()
          .foregroundColor(Color.white)
          .padding([.bottom], 0)
          .frame(maxWidth: .infinity, alignment: .leading)
          .shadow(color: Color("ShadowColor"), radius: 2)

        Text(
          "You will use this email and password to log into your accounts for all your favorite services across our platform"
        )
        .font(.system(size: 14))
        .padding([.top], 1)
        .frame(maxWidth: .infinity, alignment: .leading)

        .foregroundColor(Color.white)
        .shadow(color: Color("ShadowColor"), radius: 2)
      }
        HStack {
            HStack{
                
                Text("New to Devlander?").frame(maxWidth: .infinity, alignment: .leading).foregroundColor(.white)
                TextButton(text: "Sign Up", toUpperCase: true)

            }.frame(width: 220, alignment: .leading)
            Spacer()

        }.padding([.top], 20)
          
            

        


    }.padding()
  }
}

// Text("Sign up")
//    .font(.largeTitle)
//    .bold()
//    .frame(maxWidth : .infinity, alignment: .leading)
//    .padding(.top)
//    .foregroundColor(Color.primary.opacity(0.4))

struct Screen: View {
  let title: String
  let text: String
  var body: some View {
    VStack {}.navigationTitle(title)
  }
}

struct LoginScreenView: View {
  @Environment(\.accessibilityReduceTransparency) var reduceTransparency
  @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
  @Environment(\.colorScheme) var scheme
  var testReduceTransparency = false
  var testDifferentiateWithoutColor = false
  var body: some View {
    ZStack {
      if differentiateWithoutColor || testDifferentiateWithoutColor {
        Theme.differentiateWithoutColorBackground(forScheme: scheme)
          .ignoresSafeArea()
      } else {
        if reduceTransparency || testReduceTransparency {
          LinearNonTransparency()
        } else {
          FloatingClouds()
        }
      }
      VStack {
        LoginWithEmailPrompt()
      }.padding()
    }.navigationTitle("Login Screen")
      .toolbar(.hidden)
  }
}

struct RegisterScreenView: View {
  @Environment(\.accessibilityReduceTransparency) var reduceTransparency
  @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
  @Environment(\.colorScheme) var scheme
  var testReduceTransparency = false
  var testDifferentiateWithoutColor = false
  var body: some View {
    ZStack {
      if differentiateWithoutColor || testDifferentiateWithoutColor {
        Theme.differentiateWithoutColorBackground(forScheme: scheme)
          .ignoresSafeArea()
      } else {
        if reduceTransparency || testReduceTransparency {
          LinearNonTransparency()
        } else {
          FloatingClouds()
        }
      }
      VStack {
        LoginWithEmailPrompt()
      }.padding()
    }.navigationTitle("Register Screen")
      .toolbar(.hidden)
  }
}

struct ContentView: View {
  var body: some View {
    NavigationView {
      LoginScreenView()
    }
  }
}

struct LinearNonTransparency: View {
  @Environment(\.colorScheme) var scheme
  var gradient: Gradient {
    Gradient(colors: [Theme.ellipsesTopLeading(forScheme: scheme), Theme.ellipsesTopTrailing(forScheme: scheme)])
  }

  var body: some View {
    LinearGradient(gradient: gradient, startPoint: .topLeading, endPoint: .bottomTrailing)
      .ignoresSafeArea()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
