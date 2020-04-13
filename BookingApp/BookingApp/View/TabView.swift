//
//  TabbedView.swift
//  login&sighupPage
//
//  Created by VALTER ANDRE MACHADO on 05/07/2019.
//  Copyright © 2019 VALTER ANDRE MACHADO. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseDatabase
import FirebaseAuth

struct TabView : View {
    var userPF=UserProfile()
    @Environment(\.isPresented) var isPresented
    @State var isLoginViewPresented = true

    var body: some View {
        
        TabbedView{
            // Tabbar 1
            HomeView()
                .tabItemLabel(
                    VStack{
                    Image("browserpage")
                    Text("FEED")
                })
                .tag(0)
          
            // Tabbar 2
            ApartmentList()
                .tabItemLabel(
                    VStack{
                    Image("bookingfilled")
                    Text("BOOK")
                })
                .tag(1)
            
            // Tabbar 3
            UserProfile()
                .tabItemLabel(
                    VStack{
                    Image("user")
                    Text("PROFILE")
                        
                })
                .tag(2)
            
            }//.presentation(isPresented ? Modal(LoginView(), onDismiss: { self.isPresented.toggle() }) : nil )
//        .presentation( isLoginViewPresented ? Modal(LoginView(), onDismiss: { self.isLoginViewPresented.toggle() }) : nil )
//            .presentation( isLoginViewPresented ? Modal(LoginView(), onDismiss: {
//                if Auth.auth().currentUser?.uid == nil {
//                self.isLoginViewPresented = false
//                //            perform(#selector(handleLogout), with: nil, afterDelay: 0)
//            } else {
//                //            fetchUserAndSetupNavBarTitle()
//                
//                } }) : nil )
        
        
    }
    
    func checkIfUserIsLoggedIn() {
        if Auth.auth().currentUser?.uid == nil {
//            perform(#selector(handleLogout), with: nil, afterDelay: 0)
        } else {
//            fetchUserAndSetupNavBarTitle()
            
        }
    }
}

#if DEBUG
//struct TabbedView_Previews : PreviewProvider {
//    static var previews: some View {
//        TabView()
//    }
//}
#endif
