//
//  ImageSliderView.swift
//  DropDownMenuTutorial
//
//  Created by omer elmas on 24.01.2024.
//

import SwiftUI

struct ImageSliderView: View {
    
    let title: String
    let Options : [String]
    let prompt: String

    
    @State private var isExpanded = false
    @Binding var selection: String?
    @Environment(\.colorScheme) var scheme

    
    var body: some View {
        VStack(alignment:.leading){
            
            Text(title)
                .foregroundStyle(.gray)
                .font(.footnote)
                .opacity(0.8)
            
            
            VStack {
                HStack{
                    
                    Image(selection ?? prompt)
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 20, height: 50)

                    Spacer()
                    
                    Image(systemName: "chevron.down")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                        .rotationEffect(.degrees(isExpanded ? -180 : 0))
                }
                .frame(height: 40)
                .padding(.horizontal)
                .background(scheme == .dark ? .black : .white)
                .onTapGesture {
                    withAnimation(.snappy) {
                        isExpanded.toggle()
                    }
                }
                if isExpanded {
                    VStack (alignment:.leading){
                        ForEach(Options,id: \.self) { option in
                            HStack {
                                
                                Image(option)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 125, height: 125)
                                    .clipShape(Circle())
                                Spacer()
                                
                                if selection == option {
                                    Image(systemName: "checkmark")
                                        .font(.subheadline)
                                }
                            }
                            .frame(height: 140)
                            .padding(.horizontal)
                            .onTapGesture {
                                withAnimation(.snappy) {
                                    selection = option
                                    isExpanded.toggle()
                                }
                            }
                        }
                    }
                    .transition(.move(edge: .bottom))
                }
            }
            .background(scheme == .dark ? .black : .white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color: .primary.opacity(0.2), radius: 4)
            .frame(width: 140)
        }
    }
}

#Preview {
    ImageSliderView(title: "Choose", Options: ["p1","p2","p3","p4"], prompt: "no image", selection: .constant("p1"))
}
