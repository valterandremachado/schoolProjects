//
//  ContentView.swift
//  login&sighupPage
//
//  Created by VALTER ANDRE MACHADO on 27/06/2019.
//  Copyright © 2019 VALTER ANDRE MACHADO. All rights reserved.
//

import SwiftUI
import ProgressHUD
import FirebaseAuth
import FirebaseDatabase
import Firebase

struct LoginView : View {
    
    @State private var email = ""
    @State private var password = ""
    @State var isSignupViewPresented = false
    @State var isLoginViewPresented = false
    var login = false
    var tab = TabView()
//    @Environment(\.isPresented) private var isPresented
    
    let rootRef = Database.database().reference()
    
    var body: some View {
    
//        NavigationView {
        
        VStack{
            VStack{
                Image("trsnskdjg")
                    .resizable()
                    .scaledToFit()
//                    .clipped()
//                Spacer()
                TextField($email, placeholder: Text("email"))
                    .textFieldStyle(.roundedBorder)
//                    .frame(height: 100)
//                    .padding(.top, 1000)
//                    Spacer()
            
                    SecureField($password, placeholder: Text("password"))
                        .textFieldStyle(.roundedBorder)
            }
            // Login Button
            VStack(alignment: .trailing){
                
                //TODO: SIGN IN USER IN THE FIREBASE
                
                Button(action: {
                    print("Login")
                    self.loginUser()
                }) {

                    HStack{
                        Spacer()
                        Text("Login")
                            .bold()
                            .color(.white)
                            .font(.system(size: 18))
                            .font(.title)
                        Spacer()
                    }
                    .padding(.vertical, 10)
                    .background(Color(red: 33 / 255, green: 78 / 255, blue: 95 / 255))
                    .cornerRadius(8)
                    
                }//.presentation( isLoginViewPresented ? Modal(TabView(), onDismiss: { self.isLoginViewPresented.toggle() }) : nil )
                .sheet(isPresented: $isLoginViewPresented, content: { TabView() })
                VStack(alignment:.trailing){
                    
                NavigationLink(destination: ForgotPassword()) {
                    Text("Forgot Password?")
                    }.edgesIgnoringSafeArea(.all)

                }
                
            
        }
           Spacer()
            
            HStack{
//                Image(systemName: "close")
                Text("Don't you have an account?")
                Button(action: {
                    self.isSignupViewPresented = true
                    if self.isSignupViewPresented == true{
                        print("Sign up pressed")
                    }
                }) {
                    Text("Sign up")
                }//.presentation( isSignupViewPresented ? Modal(SignupView(), onDismiss: { self.isSignupViewPresented.toggle() }) : nil )
                 .sheet(isPresented: $isSignupViewPresented, content: { SignupView() })
            }
//             Spacer()
        }.padding(.horizontal, 25)
//        .background(Color.gray)
        }
//       .edgesIgnoringSafeArea(.top)
//       .padding(.bottom)
    
    func loginUser(){
        ProgressHUD.show("Wait...")
        Auth.auth().signIn(withEmail: email, password: password) {
            
            (user, error) in
            
            if error != nil {
                
                print(error!)
                ProgressHUD.showError("Opps!!! \nSomething went wrong")
            }
            else
            {
                print("successful! You're Logged In")
                
                ProgressHUD.showSuccess("Done!")
                self.isLoginViewPresented = true
//                self.isPresented?.value = false
//                self.tab.isLoginViewPresented = false
                self.email = ""
                self.password = ""
                
            }
            
        }
    }
    
//    func dismissLoginView(){
//    }
}


