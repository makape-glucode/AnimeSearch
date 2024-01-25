import SwiftUI
import Foundation

class AnimeViewModel: ObservableObject {
    @Published var animeData: AnimesModel?
    @Published var searchText = ""
    @Published var carouselImageURLs: [String] = []
    
    @Published var urlImages: [String: ImageModel] = [:]
    
//    init() {
//        // Initialize your ViewModel and populate carouselImageURLs
//        // For example:
//        if let animeData = animeData, let animeList = animeData.data {
//            carouselImageURLs = animeList.compactMap { anime in
//                return anime.images?.first?.value.imageURL
//            }
//        }
//    }
        
    func searchAnime() {
        guard let searchingAnime = searchText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return
        }

        let apiURL = "https://api.jikan.moe/v4/anime?q=\(searchingAnime)"

        guard let url = URL(string: apiURL) else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }

            guard let data = data else {
                return
            }

            do {
                let decoder = JSONDecoder()
                let animeModel = try decoder.decode(AnimesModel.self, from: data)
                

                DispatchQueue.main.async {
                    self.animeData = animeModel
                }
            } catch {
                print("Error decoding data: \(error)")
            }
        }.resume()
    }
}



