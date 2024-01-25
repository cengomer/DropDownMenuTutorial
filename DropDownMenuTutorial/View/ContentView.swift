//
//  ContentView.swift
//  DropDownMenuTutorial
//
//  Created by omer elmas on 23.01.2024.
//

import SwiftUI

struct ContentView: View {
    
    private let cars = [
        "Lambo",
        "Ferrari",
        "Mercedes" ,
        "Aston Martin"
]
    private let names = [
    "Omer",
    "Mohd",
    "Suha",
    "Raghad",
    "Hamid"
    ]
    @State private var  selectedCars : String?
    @State private var  selectedNames : String?
    @State private var  selectedImage : String?

    var body: some View {
        ZStack {
            if let selectedImage = selectedImage {
                Image(selectedImage)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            }
                
            VStack(alignment:.leading,spacing: 16) {
//                HStack(spacing:18){
//                    DropDownView(title: "Make", prompt: "Select", options: cars, selection: $selectedCars)
//                    DropDownView(title: "Name", prompt: "Your name", options: names, selection: $selectedNames)
//                }
                VStack{
                    Spacer()
                    ImageSliderView(title: "Background", Options: ["p1","p2","p3","p4"], prompt: "Image", selection: $selectedImage)
                    
                }
                
            }
        }          

    }
}

#Preview {
    ContentView()
}
