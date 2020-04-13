//
//  JUNK.swift
//  BookingApp
//
//  Created by VALTER ANDRE MACHADO on 10/07/2019.
//  Copyright © 2019 VALTER ANDRE MACHADO. All rights reserved.
//

import Foundation

//@State private var showSheet = false
//
//let transition = AnyTransition.move(edge: .bottom)
//@State var showModal: Bool = false
//
//// Instantiate ActionSheet
//var sheet: ActionSheet{
//    ActionSheet(title: Text("Sign up"), message: nil, buttons: [.cancel({
//        self.showSheet = false
//    }), .default(Text("Default"), onTrigger: {
//        
//        // present DefaultSignup View
//        
//        print("Sign up with Gmail triggered")
//    }), .default(Text("Gmail"), onTrigger: {
//        print("Sign up with Gmail triggered")
//    }), .default(Text("Facebook"), onTrigger: {
//        print("Sign up with FB triggered")
//    })])
//}

//struct ViewControllerHolder {
//    weak var value: UIViewController?
//}
//
//
//struct ViewControllerKey: EnvironmentKey {
//    static var defaultValue: ViewControllerHolder { return ViewControllerHolder(value: UIApplication.shared.windows.first?.rootViewController ) }
//}
//
//extension EnvironmentValues {
//    // This will get/set the view controller directly.  No need to worry about `.value` in use
//    var viewController: UIViewController? {
//        get { return self[ViewControllerKey.self].value }
//        set { self[ViewControllerKey.self].value = newValue }
//    }
//
//}
//
//extension UIViewController {
//    func present<Content: View>(style: UIModalPresentationStyle = .automatic, @ViewBuilder builder: () -> Content) {
//        // Must instantiate HostingController with some sort of view...
//        let toPresent = UIHostingController(rootView: AnyView(EmptyView()))
//        //            ... but then we can reset that view to include the environment
//        toPresent.rootView = AnyView(
//            builder()
//                .environment(\.viewController, toPresent)
//        )
//        self.present(toPresent, animated: true, completion: nil)
//    }
//}
// need to use the code below to be able to present the view
// @Environment(\.viewController) private var viewController: UIViewController?
//self.viewController?.present(style: .fullScreen) {
//    TabView()
//}

