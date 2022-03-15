//
//  Sunset.swift
//  SwiftArmyKnife
//
//  Created by Jeremy Warren on 3/14/22.
//

import SwiftUI

struct SunsetView: View {
    @StateObject var model = SunsetViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.orange, .yellow, .cyan], startPoint: .bottom, endPoint: .top).ignoresSafeArea()
                VStack {
                    Button(action: {
                        Task {
                            await model.fetchSunset()
                        }
                    }, label: {
                        Image(systemName: "calendar")
                    })
                    if let sunset = model.sunsetData {
                        Text("Sunset: \(sunset.sunset) ")
                            .padding()
                        Text("Sunrise: \(sunset.sunrise)")
                            .padding()
                        Text("Day Length: \(sunset.dayLength)")
                            .padding()
                    }
                    
                }
                
            }
        }
    }
}
struct Sunset_Previews: PreviewProvider {
    static var previews: some View {
        SunsetView()
    }
}
