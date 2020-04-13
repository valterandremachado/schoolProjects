//
//  SignUpWith.swift
//  login&sighupPage
//
//  Created by VALTER ANDRE MACHADO on 01/07/2019.
//  Copyright © 2019 VALTER ANDRE MACHADO. All rights reserved.
//

import SwiftUI

struct ForgotPassword : View {
    @State private var old_password = ""
    @State private var new_password = ""
    @State var floatNumb: CGFloat = 8
    @State var floatNumb2: CGFloat = 10
    @State var floatNumb3: CGFloat = 50
    
    @State var intNumb: Int = 0


    var body: some View {
       
        VStack{
            VStack{
                Text("Check your email to access your new password!")
                    .lineLimit(intNumb)
            }.padding(.vertical, floatNumb3)
            
            SecureField($old_password,placeholder: Text("new password"))
                .textFieldStyle(.roundedBorder)
            
            SecureField($new_password, placeholder: Text("confirm password"))
                .textFieldStyle(.roundedBorder)
            
            Button(action: {
                print("Confirm")

            }) {
                
                HStack{
                    Spacer()
                    Text("Confirm")
                        .bold()
//                        .color(.white)
                        .font(.headline)
                        .font(.title)
                    Spacer()
                    }
                    .padding(.vertical, floatNumb2)
                    .background(Color(red: 33 / 255, green: 78 / 255, blue: 95 / 255))
                    .cornerRadius(floatNumb)
            }
        }.padding(.horizontal, 25)
            .lineLimit(intNumb)
    }
}

//#if DEBUG
//struct SignUpWith_Previews : PreviewProvider {
//    static var previews: some View {
//        ForgotPassword()
//    }
//}
//#endif
