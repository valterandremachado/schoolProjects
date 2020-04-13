//
//  DefaultSignup.swift
//  login&sighupPage
//
//  Created by VALTER ANDRE MACHADO on 01/07/2019.
//  Copyright © 2019 VALTER ANDRE MACHADO. All rights reserved.
//

import SwiftUI
import FirebaseCore
import Firebase
import FirebaseDatabase
import ProgressHUD

struct SignupView : View {
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var phoneNumber = ""
    @State private var gCashNumber = ""
    @State private var fullName = ""
    @State private var address = ""

    @State var presentMainView = false

    var body: some View {
        
        
        VStack{
            Image("trsnskdjg")
                .resizable()
                .scaledToFit()
                .clipped()
            
            Text("Signing up")
            VStack{
            TextField($fullName,placeholder: Text("full name"))
                .textFieldStyle(.roundedBorder)
            
            TextField($address,placeholder: Text("address"))
                    .textFieldStyle(.roundedBorder)
                
            TextField($username,placeholder: Text("username"))
                .textFieldStyle(.roundedBorder)

            TextField($email, placeholder: Text("email"))
                .textFieldStyle(.roundedBorder)

            SecureField($password, placeholder:  Text("password"))
                .textFieldStyle(.roundedBorder)
            
            TextField($phoneNumber,placeholder: Text("phone number"))
                .textFieldStyle(.roundedBorder)
            
            TextField($gCashNumber,placeholder: Text("GCash number"))
                .textFieldStyle(.roundedBorder)
            }
            
//            PresentationButton(destination: ForgotPassword()){
//                Text("Me")
//            }
            
            //TODO: SIGN UP USER IN THE FIREBASE
            Button(action: {
//                print("Signup pressed")
                self.signup(withEmail: self.email, password: self.password, username: self.username, fullName: self.fullName, num: self.phoneNumber, cashNo: self.gCashNumber, address: self.address)
                
            }) {

                HStack{
                    Spacer()
                    Text("Sign up")
                        .bold()
                        .foregroundColor(.white)
                        .font(.system(size: 18))
                        .font(.title)
                    Spacer()
                    }
                    .padding(.vertical, 10)
                    .background(Color(red: 33 / 255, green: 78 / 255, blue: 95 / 255))
                    .cornerRadius(8)
                
            }//.presentation( presentMainView ? Modal(TabView(), onDismiss: { self.presentMainView.toggle() }) : nil )
             .sheet(isPresented: $presentMainView, content: { TabView() })
            
         Spacer()
         Spacer()
        }.padding(.horizontal, 25)
        
        
    }
    
    func signup(withEmail email: String, password: String, username: String, fullName: String, num: String, cashNo: String, address: String){
        
        ProgressHUD.show("Wait...")
        Auth.auth().createUser(withEmail: email, password: password) {
            (user, error) in
            
            if error != nil {
                print(error!)
                print("failed")
                ProgressHUD.showError("Opps!!! \nSomething went wrong")
            }
            else
            {
                guard let uid = user?.user.uid else { return }
                
                let values = ["Email": email, "Username": username, "Full name": fullName, "PhoneNumber": num, "GCashNumber": cashNo, "address": address]
//                    as [String : Any]
                
                Database.database()
                
                Database.database().reference().child("users").child(uid).updateChildValues(values, withCompletionBlock: { (error, ref) in
                    if let error = error {
                        print("Failed to update database values with error: ", error.localizedDescription)
                        return
                    }
                })
                //success
                print("Registration Successful")
                ProgressHUD.showSuccess("Done!")
                self.presentMainView = true
                self.username = ""
                self.email = ""
                self.password = ""
                self.phoneNumber = ""
                self.gCashNumber = ""
                self.fullName = ""
                self.address = ""

//                SVProgressHUD.setMinimumDismissTimeInterval(0.1)
            }
        }
        
    }
    
//    func createUser(withEmail email: String, password: String, username: String) {
//
//        ProgressHUD.show("Wait...")
//        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
//
//            if let error = error {
//                print("Failed to sign user up with error: ", error.localizedDescription)
//                return
//            }
//
//            guard let uid = result?.user.uid else { return }
//
//            let values = ["email": email, "username": username]
//
//            Database.database()
//
//            Database.database().reference().child("users").child(uid).updateChildValues(values, withCompletionBlock: { (error, ref) in
//                if let error = error {
//                    print("Failed to update database values with error: ", error.localizedDescription)
//                    return
//                }else{
//                    print("Registration Successful")
//                    ProgressHUD.showSuccess("Done!")
//                    self.presentMainView = true
//                    self.username = ""
//                    self.email = ""
//                }
//            })
//        }
//    }
    
    
}
