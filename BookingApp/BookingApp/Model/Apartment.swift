//
//  Room.swift
//  BookingPage
//
//  Created by VALTER ANDRE MACHADO on 01/07/2019.
//  Copyright © 2019 VALTER ANDRE MACHADO. All rights reserved.
//

import SwiftUI
import CoreLocation

struct Apartment :  Hashable, Codable, Identifiable {
    var id: Int
    var uid = UUID()
    var name: String
    var imageName: String
    var capacity: String
//    var floor: String
    var description: String
//    var hasTV: Bool = false
    
    
//    var imageName: String {return name}
//    var thumbnailName: String {return name + "Thumb"}
//    func image(forSize size: Int) -> Image {
//        ImageStore.shared.image(name: imageName, size: size)
//    }
}

#if DEBUG

//let testData = [
//    Apartment(name: "Apartment1", capacity: 2, hasTV: true),
//    Apartment(name: "Apartment2", capacity: 3, hasTV: false),
//    Apartment(name: "Apartment3", capacity: 4, hasTV: true),
//    Apartment(name: "Apartment4", capacity: 5, hasTV: true),
//    Apartment(name: "Apartment5", capacity: 6, hasTV: true),
//    Apartment(name: "Apartment6", capacity: 7, hasTV: true),
//    Apartment(name: "Apartment7", capacity: 8, hasTV: true),
//    Apartment(name: "Apartment8", capacity: 10, hasTV: true),
//    Apartment(name: "Apartment9", capacity: 13, hasTV: true),
//    Apartment(name: "Apartment10", capacity: 22, hasTV: true),
//    
//
//]
//struct Room_Previews : PreviewProvider {
//    static var previews: some View {
//        Room()
//    }
//}
#endif
