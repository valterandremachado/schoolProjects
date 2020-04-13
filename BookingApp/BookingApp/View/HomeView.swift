//
//  HomeView.swift
//  login&sighupPage
//
//  Created by VALTER ANDRE MACHADO on 05/07/2019.
//  Copyright © 2019 VALTER ANDRE MACHADO. All rights reserved.
//

import SwiftUI
import WebKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

struct HomeView : View {
    @State var presentMainView = false
    let imageArray: [String] = ["IMG_4842", "IMG_4839", "IMG_4840"]
    var body: some View {
        VStack{
        List() {
            ForEach(self.imageArray, id: \.self) { image -> Image in
                Image(image)
                    .resizable()
                    .scaledToFit()
                HStack {
                    ForEach(self.imageArray, id: \.self) { image -> Image  in
                        Image(image)
                        .resizable()
//                        .scaledToFit()
                    }
                }
            }
            }
            
        }
//        ScrollView{
//            VStack{
//            Spacer()
//            Image("IMG_4842")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 414, height: 800)
//
//            Image("IMG_4842")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 414, height: 800)
//            Image("IMG_4842")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 414, height: 800)
//                Spacer()
//
//            }
//        }.lineSpacing(-10)
        
      
//        VStack{
////        NavigationView{
//            Image("IMG_4842")
//                .resizable()
////                .scaledToFit()
//                .frame(width: 414, height: 700)
////            }.navigationBarTitle(Text("Home"), displayMode: .inline)
//        }.frame(width: 414, height: 800)
      
    }
    func authenticateUserAndConfigureView() {
        if Auth.auth().currentUser == nil {
            .sheet(isPresented: $presentMainView, content: { TabView() })
//            presentation(presentMainView ? Modal(TabView(), onDismiss: { self.presentMainView.toggle() }) : nil )
        }
    }
    
}
    
    


//struct HomeView : UIViewRepresentable {
//    func makeUIView(context: Context) -> WKWebView  {
//        return WKWebView()
//    }
//    func updateUIView(_ uiView: WKWebView, context: Context) {
//        let req = URLRequest(url: URL(string: "http://www.apple.com")!)
//        uiView.load(req)
//    }
//}


#if DEBUG
//struct HomeView_Previews : PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
#endif
