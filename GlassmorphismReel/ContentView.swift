//
//  ContentView.swift
//  GlassmorphismReel
//
//  Created by Landon Johnson on 3/12/23.
//

import SwiftUI















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






func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
    if UIAccessibility.isReduceMotionEnabled {
        return try body()
        
    } else {
        return try withAnimation(animation, body)
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
            Logo(src: "Logo")

            VStack {
                LogoTitleDescriptionHeading(sectionText: "", title: "Enter your password", description: "You will use this email and password to log into your accounts for all your favorite services across our platform")
                
                GlassTextField(errorText: "", placeholder: "Password", text: $password)
                
                SubmitButton(text: "Continue", disabled: disabled, onPress: {})
                
            }.modifier(GlassPanel())
                
        }

            
            
            
            
            
            
            
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
    @Binding var password: String

    let setRegisterView: (RegisterSwitchCases) -> Void
    let setParentView: (UnAuthenticatedSwitchCases, LoginSwitchCases, RegisterSwitchCases) -> Void
    
    
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
                    
                
                    VStack(spacing: 25){
                        LogoTitleDescriptionHeading(sectionText: "Sign Up".uppercased(), title: "Enter your email", description: "Type in a email address for signing in to your Devlander Account")
                        GlassTextField(errorText: "",
                                       placeholder: "Email", text: $email )
                        
                        
                        SubmitButton(text: "Continue", disabled: disabled, onPress: {})
                    }
                    
                }
            
                
                
                
                
                
                
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
                Logo(src: "Logo")
                VStack{
                    
                VStack(spacing: 25){
                    LogoTitleDescriptionHeading(title: "Log in with your email", description: "You will use this email and password to log into your accounts for all your favorite services across the Devlander companies")
                    GlassTextField(errorText: "", placeholder: "Email", text: $email )
                    
                    
                    SubmitButton(text: "Continue", disabled: disabled, onPress: {
                        setLoginView(LoginSwitchCases.LoginPassword)
                    })
                    
                    
                    
                }
                
                
                
                OnboardingLandingFooter(renderOnPressContent: {TextButton(text: "Sign Up", toUpperCase: true, onPress: {
                    setParentView(UnAuthenticatedSwitchCases.Register, LoginSwitchCases.LoginEmail, RegisterSwitchCases.RegisterEmail)
                })}, text: "New to Devlander?", fontFamily: CustomFontType.FontTwoRegular)
                
                
                
                
                }.modifier(GlassPanel())

                
                
            }
            
        }
    }
}
class AppState: ObservableObject {
    static let shared = AppState()    // << here !!
    
}




struct RegisterSwitch: View {
    @Binding var selectedRegisterView: RegisterSwitchCases
    
    @State private var email = ""
    @State private var password = ""
    @State private var passwordAgain = ""

    
    var setParentView: (UnAuthenticatedSwitchCases, LoginSwitchCases, RegisterSwitchCases) -> Void
    
    var setRegisterView: (RegisterSwitchCases) -> Void
    
    
    func getRegisterViewForRender(viewName: RegisterSwitchCases) -> some View {
        switch viewName {
        case RegisterSwitchCases.RegisterEmail:
            return AnyView(RegisterEmailView(email: $email, password: $password, setRegisterView: setRegisterView, setParentView: setParentView))

        default:
            return AnyView(RegisterEmailView(email: $email, password: $password, setRegisterView: setRegisterView, setParentView: setParentView))

        }
    }
    
    
    
    
    
    
    var body: some View {
        getRegisterViewForRender(viewName: selectedRegisterView)
    }
}



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
        ZStack{
            
        getLoginViewForRender(viewName: selectedLoginView)
        }

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
    
    
    
    func getParentViewForRender(parentViewName:UnAuthenticatedSwitchCases, loginViewName: LoginSwitchCases, registerViewName: RegisterSwitchCases) -> some View {
        switch parentViewName {
        case UnAuthenticatedSwitchCases.Login:
            return  AnyView(LoginSwitch(selectedLoginView: $selectedLoginView, setParentView: setParentView, setLoginView: setLoginView))
        case UnAuthenticatedSwitchCases.Register:
            return  AnyView(RegisterSwitch(selectedRegisterView: $selectedRegisterView, setParentView: setParentView, setRegisterView: setRegisterView ))
        default:
            return  AnyView(LoginSwitch(selectedLoginView: $selectedLoginView, setParentView: setParentView, setLoginView: setLoginView))
        }
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
                
                ZStack{
                   
                    getParentViewForRender(parentViewName: selectedParentView, loginViewName: selectedLoginView, registerViewName: selectedRegisterView)
                }

                
              


            
        }
        
    }
             }}

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
