//
//  Pokedex.swift
//  SwiftArmyKnife
//
//  Created by Jeremy Warren on 2/17/22.
//

import SwiftUI

struct Pokedex: View {
    @StateObject var viewModel = PokedexModel()
    var body: some View {
        VStack {
            HStack {
                TextField("Search for a Pokemon!", text: $viewModel.searchText)
                    .textFieldStyle(.roundedBorder)
                    .accessibilityIdentifier("Search textfield")
                    .accessibilityLabel("Search BAr")
                Button(action: {
                    Task {
                        await viewModel.fetchPokemon()
                    }
                }, label: {
                    Image(systemName: "magnifyingglass")
                })
            }
            .padding()
            if let pokemon = viewModel.pokemon {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .accessibilityLabel("\(pokemon.name) sprite")
            }
                Text(pokemon.name.uppercased())
                    .font(.largeTitle)
                    .padding()
                Text("\(pokemon.id)")
                    .font(.body)
                    .padding()
            }
        Spacer()
        }
        .navigationTitle("Pokedex")
    }
}

struct Pokedex_Previews: PreviewProvider {
    static var previews: some View {
        Pokedex()
    }
}
