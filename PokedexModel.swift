//
//  PokedexModel.swift
//  SwiftArmyKnife
//
//  Created by Jeremy Warren on 2/17/22.
// https://pokeapi.co/api/v2/pokemon/ditto


import Foundation
import UIKit

@MainActor
class PokedexModel: ObservableObject {
    @Published var searchText = ""
    @Published var image: UIImage?
    @Published var pokemon: Pokemon?
    func fetchPokemon() async {
        guard let baseUrl = URL(string: "https://pokeapi.co/api/v2/pokemon") else { return }
        let finalURL = baseUrl.appendingPathComponent(searchText.lowercased())
        print(finalURL)
    
        do {
            let (data, _) = try await URLSession.shared.data(from: finalURL)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let pokemon = try decoder.decode(Pokemon.self, from: data)
            self.pokemon = pokemon
            
            let (imageData, _) = try await URLSession.shared.data(from: pokemon.sprites.frontDefault)
            let image = UIImage(data: imageData)
            self.image = image
        } catch {
            print(error)
        }
    }
    
}
