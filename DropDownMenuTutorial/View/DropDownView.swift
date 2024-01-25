//
//  DropDownView.swift
//  DropDownMenuTutorial
//
//  Created by omer elmas on 23.01.2024.
//

import SwiftUI

struct DropDownView: View {
    let title: String
    let prompt: String
    let options: [String]
    
    
    @State private var isExpanded = false
    @Binding var selection: String?
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        VStack(alignment:.leading){
            Text(title)
                .font(.footnote)
                .foregroundStyle(.gray)
                .opacity(0.8)
            
            
            VStack {
                HStack {
                    Text(selection ?? prompt)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.down")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                        .rotationEffect(.degrees(isExpanded ? -180 : 0))
                }
                .frame(height: 40)
                .background(scheme == .dark ? .black : .white)
                .padding(.horizontal)
                .onTapGesture {
                    withAnimation(.snappy) {
                        isExpanded.toggle()
                    }
                }
                if isExpanded {
                    VStack {
                        ForEach(options,id:\.self) { option in
                            HStack {
                                Text(option)
                                    .foregroundStyle(selection == option ? Color.primary : .gray)
                                
                                Spacer()
                                
                                if selection == option {
                                    Image(systemName: "checkmark")
                                        .font(.subheadline)
                                }
                            }
                            .frame(height: 40)
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
            .shadow(color:.primary.opacity(0.2),radius: 4)
            .frame(width: 140)
        }
    }
}

#Preview {
    DropDownView(title: "Make", prompt: "Select", options: [
        "Lambo",
        "Ferrari",
        "Mercedes" ,
        "Aston Martin"
    ], selection: .constant("Ferrari"))
}
