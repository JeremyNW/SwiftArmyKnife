//
//  SunsetViewModel.swift
//  SwiftArmyKnife
//
//  Created by Jeremy Warren on 3/14/22.
//

import Foundation

class SunsetViewModel: ObservableObject {
    @Published var sunsetData: Results?
    
    @MainActor func fetchSunset() async {
        guard let url = URL(string: "https://api.sunrise-sunset.org/json?lat=36.7201600&lng=-4.4203400&date=today") else { return  }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let JSONResponse = try decoder.decode(JSONResponse.self, from: data)
            self.sunsetData = JSONResponse.results
        } catch {
            print(error)
        }
    }
    
    
}
