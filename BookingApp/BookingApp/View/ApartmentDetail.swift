//
//  ApartmentDetail.swift
//  BookingPage
//
//  Created by VALTER ANDRE MACHADO on 02/07/2019.
//  Copyright © 2019 VALTER ANDRE MACHADO. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseDatabase
import ProgressHUD

struct ApartmentDetail : View {
    var apartment: Apartment
    @State private var bookAlert: Bool = false
    @State private var zoomed = false
    @State var users = [String]()
    
    @State private var tapped = false
    @State private var draggedOffset = CGSize.zero

    var body: some View {
        VStack{
            VStack{
                Group{
                    Image(apartment.imageName)
//                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    HStack{
                    Text(apartment.name)
                        .bold()
                        .font(.title)
                    }
                }
                Group{
                    Text(apartment.description)
                        .truncationMode(.middle)
                        .padding(.vertical, 0)
                        .lineLimit(nil)
                        .padding(.horizontal, 10)
                }
            }
            Button(action: {
                print("Book triggered")
                self.bookAlert = true
                
                
               
            }){
                HStack(alignment: .center, spacing: 100){
                    Spacer()
                    Text("Book")
//                        .foregroundColor(.white)
//                        .lineLimit(nil)
                        .font(.headline)
                    Spacer()
                    }.padding(.vertical, 15)
                    .background(Color(red: 33 / 255, green: 78 / 255, blue: 95 / 255))
                    .cornerRadius(CGFloat(25))
                    .padding(.horizontal, 70)
            }.padding(.top, 15)

            Spacer()
            
        }
        .navigationBarTitle(Text("Diamond Vation Homes"), displayMode: .inline)
//            .tapAction {
//                self.zoomed.toggle()
//            }
            .sheet($bookAlert){
                Alert(title: Text("Booking"), message: Text("You will be charged P1500 for downpayment, are you sure you want to book \(self.apartment.name)?"), primaryButton: .cancel(), secondaryButton: .default(Text("Yes"), onTrigger: {
                    
                    // Do something: Process the reservation when yes is pressed
                    // Save the reservation in Database
                    print("Yes Triggered")
                    self.reserveApart()
                    ProgressHUD.showSuccess("Sucess!!!")
                   
                }))
        }
    }
//    func loadUserData() {
//        guard let uid = Auth.auth().currentUser?.uid else { return }
//        Database.database().reference().child("users").child(uid).child("username").observeSingleEvent(of: .value) { (snapshot) in
//            guard let username = snapshot.value as? String else { return }
//            //            self.username = username
//        }
//    }
    
    //TODO: PUT RESERVED APARTMENT IN THE DATABASE
    func reserveApart(){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let value = ["Apartment booked": apartment.name]
        Database.database().reference().child("users").child(uid).updateChildValues(value, withCompletionBlock: { (error, ref) in
            if let error = error {
                print("Failed to update database values with error: ", error.localizedDescription)
                return
            }
        })
    }
    
//    func card(){
//        DownpaymentView(tapped: self.tapped)
//            .offset(y: self.draggedOffset.height)
//            .gesture(DragGesture()
//                .onChanged({ (value) in
//                    self.draggedOffset = value.translation
//                })
//            )
//
//    }
}


#if DEBUG
//struct ApartmentDetail_Previews : PreviewProvider {
////    static let apartments = Bundle.main([Apartment].self, from: "apartmentData.json")
//    static var previews: some View {
//        ApartmentDetail(apartment: apartments[0])
//    }
//}
#endif
