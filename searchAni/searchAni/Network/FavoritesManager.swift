import Foundation

class FavoritesManager: ObservableObject {
    static let shared = FavoritesManager()
    
    @Published var favoriteTitles: [String] = []
    @Published var favorites: [Datum] = []
    
//    func addFavoriteTitle(_ title: String) {
//        favoriteTitles.append(title)
//        print("Added to favorites:", title)
//    }
//
//    func addFavorite(_ anime: Datum) {
//        if !favorites.contains(anime) {
//            favorites.append(anime)
//
//        }
//        print("Added to favorites list:", anime)
//    }
//
//    func removeFavorite(_ anime: Datum) {
//        if let index = favorites.firstIndex(where: { $0.id == anime.id }) {
//            favorites.remove(at: index)
//        }
//    }
    
    func addFavorite(_ anime: Datum) {
            if let animeID = anime.id {
                favorites[animeID] = anime
            }
        }

//        func removeFavorite(_ anime: Datum) {
//            if let animeID = anime.id {
//                favorites[animeID] = nil
//            }
//        }
//
    func removeFavorite(_ anime: Datum) {
        favorites.removeAll { $0 == anime }
    }
}
