//
//  SwiftUIView.swift
//  login&sighupPage
//
//  Created by VALTER ANDRE MACHADO on 05/07/2019.
//  Copyright © 2019 VALTER ANDRE MACHADO. All rights reserved.
//

import SwiftUI
import FirebaseDatabase
import FirebaseAuth
import Firebase

struct UserProfile : View {
    
    @State var username = "NARUTO"
    var ref: DatabaseReference!
    let userID = Auth.auth().currentUser?.uid
//    var loginScreen = LoginView()
//    var details = ApartmentDetail()
    
    
    var body: some View {
        
//        NavigationView{
        VStack{
            VStack{
            Image("DVM")
                .resizable()
                .scaledToFill()
            ZStack{
            Image("naruto1")
            .resizable()
            .clipShape(Circle())
            .frame(width: 210, height: 200)
            .scaledToFit()
            .offset(CGSize.init(width: .zero, height: -130))
                    
                }.padding(.bottom, -130)
            }//.padding(.top, -10)

           
                Text("\(username)")
                .bold()
            List{
                Text("USER INFO")
                Text("MANAGER INFO")
                Text("HELP")
                Text("FEEDBACK")
                }
            
            Button(action: {
                print("Log out pressed")
//                self.loadUserData()
                self.handleLogout()
            }) {
                HStack{
                    Spacer()
                    Text("Log out")
//                        .bold()
//                        .color(.white)
//                        .font(.system(size: 18))
                        .font(.title)
                    Spacer()
                    }
                    .padding(.vertical, 12)
                    .background(Color(red: 33 / 255, green: 78 / 255, blue: 95 / 255))
                    .cornerRadius(25)
            }
            .padding(.horizontal, 110)
            .padding(.bottom, 15)
//            Spacer()
//            }.navigationBarTitle(Text("\(username)"), displayMode: .inline)
        }
    }

    func loadUserData() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        Database.database().reference().child("users").child(uid).child("username").observeSingleEvent(of: .value) { (snapshot) in
            guard let username = snapshot.value as? String else { return }
            self.username = username
//            print(username)

//        ref.observe(.value, with: { snapshot in
//            print(snapshot.value as Any)
//        })
        }
    }
    
    func handleLogout() {
        
        do {
            try Auth.auth().signOut()
        } catch let logoutError {
            print(logoutError)
        }
    }

   
}
    


#if DEBUG
//struct SwiftUIView_Previews : PreviewProvider {
//    static var previews: some View {
//        UserProfile()
//    }
//}
#endif
