//
//  ImageFetcher.swift
//  SwiftArmyKnife
//
//  Created by Jeremy Warren on 2/16/22.
//

import SwiftUI

struct ImageFetcher: View {
    @StateObject var viewModel = ImageFetcherModel()
    var body: some View {
        VStack {
            
            if let image = viewModel.randomImage {
                Image(uiImage: image)
            }
        }
        .navigationTitle("RandomImageFetcher")
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button(action: {
                    Task{
                       await viewModel.fetchRandomImage()
                    }
                }, label: {
                    Image(systemName: "magnifyingglass")
                })
            }
        }
    }
}

struct ImageFetcher_Previews: PreviewProvider {
    static var previews: some View {
        ImageFetcher()
    }
}
