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
    var onPress: () -> Void
    var body: some View {
        
        
        if self.toUpperCase {
            Button(action: {
                onPress()
                
            }, label: {
                Text(text.uppercased())
                    .foregroundColor(.white)
                    .frame(alignment: .leading)
                    .bold()
            })
            
        } else {
            Button(action: {
                onPress()
                
            }, label: {
                Text(text)
                    .foregroundColor(.white)
                    .frame(alignment: .leading)
                    .bold()
            })
            
        }
        
    }
}

struct SubmitNavigationLink<Destination: View>: View {
    let text: String
    var disabled: Bool
    var destination: Destination
    var body: some View {
        NavigationLink(destination: destination, label: {
            Text(text.uppercased())
                .foregroundColor(.white)
                .frame(alignment: .leading)
                .backgroundStyle(Color(red: 27, green: 28, blue: 48, opacity: 0.5))
                .bold()
        }).padding(.leading, 20)
            .padding(.trailing, 20)
            .padding(.top, 15)
            .padding(.bottom, 15)
            .frame(maxWidth: .infinity)
            .background(Color("ColorThree"))
            .cornerRadius(7)
        
    }
}

struct SubmitButton: View {
    let text: String
    let disabled: Bool
    var onPress: () -> Void
    var body: some View {
        Button(action: {
            onPress()
        }, label: {
            Text(text.uppercased())
                .foregroundColor(.white)
                .frame(alignment: .leading)
                .backgroundStyle(Color(red: 27, green: 28, blue: 48, opacity: 0.5))
                .bold()
        }).padding(.leading, 20)
            .padding(.trailing, 20)
            .padding(.top, 15)
            .padding(.bottom, 15)
            .frame(maxWidth: .infinity)
            .background(Color("ColorFive")).cornerRadius(4)
            .cornerRadius(7)
        
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
    @Binding var focused: Bool
    @State var thickMaterialOn = false
    
    
    
    
    func body(content: Content) -> some View {
        if focused {
            return content
                .padding(.leading, 15)
                .padding(.trailing, 15)
                .padding(.top, 15)
                .padding(.bottom, 15)
                .frame(maxWidth: .infinity)
                .background(.ultraThickMaterial, in: RoundedRectangle(
                    cornerRadius: 7, style: .continuous))
                .shadow(radius: 30.0)
            
        } else {
            return content
                .padding(.leading, 15)
                .padding(.trailing, 15)
                .padding(.top, 15)
                .padding(.bottom, 15)
                .frame(maxWidth: .infinity)
                .background(.ultraThinMaterial, in: RoundedRectangle(
                    cornerRadius: 7, style: .continuous))
                .shadow(radius: 30.0)
            
        }
        
        
        
        
        
        
        
        
    }
}

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

//struct ContentView: View {
//    @EnvironmentObject private var state: AppState
//
//    @State private var selection = 1
//
//    var body: some View {
//        Group {
//            switch state.view {
//            case .start:
//                TabView(selection: $selection) {
//                    ActivityView()
//                        .tag(0)
//                    StartView()
//                        .tag(1)
//                    SettingsView()
//                        .tag(2)
//                }
//                .transition(.slide)//<- here
//
//            case .workout:
//                TabView(selection: $selection) {
//                    TakeoffControlView()
//                        .tag(0)
//                    TakeoffView()
//                        .tag(1)
//                }
//                .transition(.slide)//<- here
//            }
//
//            // ...
//        }
//    }
//}


struct DashboardView: View {
    
    var body: some View {
        Text("Hi")
        
    }
}


struct LoginPasswordView: View {
    @Binding var email: String
    @Binding var password: String
    
    let setParentView: (UnAuthenticatedSwitchCases, LoginSwitchCases, RegisterSwitchCases) -> Void
    
    let setLoginView: (LoginSwitchCases) -> Void
    
    var disabled: Bool  {
        if email.isEmpty {
            return true
        } else {
            return false
        }
        
    }
    var body: some View {
        
        VStack {
            VStack {
                Text("Enter your password")
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
                .padding([.bottom], 20)
                
                .frame(maxWidth: .infinity, alignment: .leading)
                
                .foregroundColor(Color.white)
                .shadow(color: Color("ShadowColor"), radius: 2)
                VStack(spacing: 25){
                    GlassTextField(errorText: "", placeholder: "Password", text: $password)
                    
                    
                    
                    
                }
                
            }
            HStack {
                HStack{
                    
                    
                    
                }.frame(width: 220, alignment: .leading)
                Spacer()
                
            }.padding([.top], 20)
            
            
            
            
            
            
        }.padding()
    }
}

enum LoginSwitchCases: String, CaseIterable {
    case LoginEmail
    case LoginPassword
}


enum RegisterSwitchCases: String, CaseIterable {
    case RegisterEmail
    case RegisterPassword
}

enum UnAuthenticatedSwitchCases: String, CaseIterable {
    case Landing
    case Login
    case Register
}



struct RegisterEmailView: View {
    @Binding var email: String
    let setTab: (_ title: RegisterSwitchCases) -> Void
    
    var disabled: Bool  {
        if email.isEmpty {
            return true
        } else {
            return false
        }
        
    }
    var body: some View {
        withAnimation(.easeIn) {  //<- here
            
            VStack {
                VStack {
                    Text("How you will sign in")
                        .font(.system(size: 30))
                        .bold()
                        .foregroundColor(Color.white)
                        .padding([.bottom], 0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .shadow(color: Color("ShadowColor"), radius: 2)
                    
                    Text(
                        "Type in a email address for signing in to your Devlander Account"
                    )
                    .font(.system(size: 14))
                    .padding([.top], 1)
                    .padding([.bottom], 20)
                    
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    .foregroundColor(Color.white)
                    .shadow(color: Color("ShadowColor"), radius: 2)
                    VStack(spacing: 25){
                        GlassTextField(errorText: "",
                                       placeholder: "Email", text: $email )
                        
                        
                        SubmitButton(text: "Continue", disabled: disabled, onPress: {})
                    }
                    
                }
                HStack {
                    HStack{
                        
                        Text("New to Devlander?").frame(maxWidth: .infinity, alignment: .leading).foregroundColor(.white)
                        TextButton(text: "Sign Up", toUpperCase: true, onPress: {})
                        
                    }.frame(width: 220, alignment: .leading)
                    Spacer()
                    
                }.padding([.top], 20)
                
                
                
                
                
                
            }.padding()
        }
    }
}

struct LoginEmailView: View {
    
    let setParentView: (UnAuthenticatedSwitchCases, LoginSwitchCases, RegisterSwitchCases) -> Void
    
    let setLoginView: (LoginSwitchCases) -> Void
    
    
    @Binding var email: String
    @Binding var password: String
    
    
    var disabled: Bool  {
        if email.isEmpty {
            return true
        } else {
            return false
        }
        
    }
    var body: some View {
        withAnimation(.easeIn) {  //<- here
            
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
                    .padding([.bottom], 20)
                    
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    .foregroundColor(Color.white)
                    .shadow(color: Color("ShadowColor"), radius: 2)
                    VStack(spacing: 25){
                        GlassTextField(errorText: "", placeholder: "Email", text: $email )
                        
                        
                        SubmitButton(text: "Continue", disabled: disabled, onPress: {
                            setLoginView(LoginSwitchCases.LoginPassword)
                        })
                        
                        
                        
                    }
                    
                }
                HStack {
                    HStack{
                        
                        Text("New to Devlander?").frame(maxWidth: .infinity, alignment: .leading).foregroundColor(.white)
                        TextButton(text: "Sign Up", toUpperCase: true, onPress: {
                            setParentView(UnAuthenticatedSwitchCases.Register, LoginSwitchCases.LoginEmail, RegisterSwitchCases.RegisterEmail)
                        })
                        
                    }.frame(width: 220, alignment: .leading)
                    Spacer()
                    
                }.padding([.top], 20)
                
                
                
                
                
                
            }.padding()
            
        }
    }
}
class AppState: ObservableObject {
    static let shared = AppState()    // << here !!
    
}

//struct StartView: View {
//    @EnvironmentObject private var state: AppState
//
//    var body: some View {
//        Button(action: {
//            withAnimation(.easeIn) {  //<- here
//                state.view = .workout
//            }
//        }, label: {
//            Text("Start")
//        })
//    }
//}


//Group {
//    switch state.view {
//    case .LoginEmailView:
//        LoginEmailView(email: $email, password: $password)
//        .transition(.slide)//<- here
//
//
//    }
//
//}




struct LoginSwitch: View {
    @Binding var selectedLoginView: LoginSwitchCases
    
    @State private var email = ""
    @State private var password = ""
    
    var setParentView: (UnAuthenticatedSwitchCases, LoginSwitchCases, RegisterSwitchCases) -> Void
    
    var setLoginView: (LoginSwitchCases) -> Void
    
    
    func getLoginViewForRender(viewName: LoginSwitchCases) -> some View {
        switch viewName {
        case LoginSwitchCases.LoginEmail:
            return AnyView(LoginEmailView(setParentView: setParentView, setLoginView: setLoginView, email: $email, password: $password))
        case LoginSwitchCases.LoginPassword:
            return AnyView(LoginPasswordView(email: $email, password: $password,setParentView: setParentView, setLoginView: setLoginView ))
        default:
            return AnyView(LoginEmailView(setParentView: setParentView, setLoginView: setLoginView, email: $email, password: $password))
        }
    }
    
    
    
    
    
    
    var body: some View {
        getLoginViewForRender(viewName: selectedLoginView)
    }
}


struct LoginParentView: View {
    
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.colorScheme) var scheme
    var testReduceTransparency = false
    var testDifferentiateWithoutColor = false
    
    @State  var selectedParentView = UnAuthenticatedSwitchCases.Login
    @State  var selectedLoginView = LoginSwitchCases.LoginEmail
    @State  var selectedRegisterView = RegisterSwitchCases.RegisterEmail
    
    
    func setParentView(parentViewName: UnAuthenticatedSwitchCases, loginViewName: LoginSwitchCases = LoginSwitchCases.LoginEmail, registerViewName: RegisterSwitchCases = RegisterSwitchCases.RegisterEmail ) {
        
        selectedParentView =  parentViewName
        selectedLoginView = loginViewName
        selectedRegisterView = registerViewName
    }
    
    func setLoginView(loginViewName: LoginSwitchCases) {
        selectedLoginView =  loginViewName
    }
    
    func setRegisterView(registerViewName: RegisterSwitchCases) {
        selectedRegisterView =  registerViewName
    }
    
    
    
    
    
    
    
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
            
            LoginSwitch(selectedLoginView: $selectedLoginView, setParentView: setParentView, setLoginView: setLoginView)
            
        }
        
    }
}

struct RegisterView: View {
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
                
            }.padding()
        }.navigationTitle("Register Screen")
            .toolbar(.hidden)
    }
}



struct ContentView: View {
    var body: some View {
        LoginParentView()
        
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
