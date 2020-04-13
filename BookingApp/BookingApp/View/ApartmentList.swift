//
//  ContentView.swift
//  BookingPage
//
//  Created by VALTER ANDRE MACHADO on 01/07/2019.
//  Copyright © 2019 VALTER ANDRE MACHADO. All rights reserved.
//

import SwiftUI

struct ApartmentList : View {
    
    var body: some View {
        NavigationView{
        
            List{
                ForEach(apartments, id: \.id){ apartment in
                    HStack{
                        NavigationLink(destination: ApartmentDetail(apartment: apartment)) {
                            
                            Image("\(apartment.imageName)")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(20)
                                .frame(width: 150, height: 150)
                                .clipped()
                            
                            VStack(alignment:.leading){
                                Text(apartment.name)
                                Text(apartment.capacity)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }

            }.navigationBarTitle(Text("Apartments"), displayMode: .automatic)
        }
    }
}

