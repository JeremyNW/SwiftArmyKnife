//
//  ContentView.swift
//  SwiftArmyKnife
//
//  Created by Jeremy Warren on 2/16/22.
//

import SwiftUI

struct ContentView: View {
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                LazyVGrid(columns: columns) {
                    DemoAppIcon(name: "ImageFetcher", color: .blue, destination: ImageFetcher())
                }
                Spacer()
            }
            .padding()
            .navigationTitle("SwiftArmyKnife")
            .background(.linearGradient(colors: [.gray, .white], startPoint: .bottom, endPoint: .top))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct DemoAppIcon<Destination: View>: View {
    let name: String
    let color: Color
    let destination: Destination
    var body: some View {
            NavigationLink(destination: destination) {
                VStack {
                
                if let firstLetter = name.first {
                    
                    Image(systemName: "\(firstLetter.lowercased()).square")
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .foregroundColor(color)
                }
                Text(name)
                    .font(.caption)
                    .lineLimit(1)
                    .foregroundColor(.primary)
            }
        }
    }
}
