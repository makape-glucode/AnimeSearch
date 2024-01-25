//
//  FavoritesView.swift
//  searchAni
//
//  Created by Makape Tema on 2023/08/01.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favoritesManager: FavoritesManager
    
    var body: some View {
        NavigationView {
            List {
                ForEach(favoritesManager.favorites) { anime in
                    NavigationLink(destination: AnimeDetailView(anime: anime, animeImage: nil)) {
                        Text(anime.title ?? "Unknown Title")
                    }
                }
            }
            .navigationBarTitle("Favorites")
        }
    }
}


struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
