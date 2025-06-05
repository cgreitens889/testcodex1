import SwiftUI
import StremioCore
import AVKit

struct CatalogItem: Identifiable {
    let id: String
    let name: String
    let poster: URL?
    let stream: String
}

struct ContentView: View {
    @State private var items: [CatalogItem] = []
    @State private var player: AVPlayer? = nil

    var body: some View {
        NavigationStack {
            List(items) { item in
                Button(action: { play(stream: item.stream) }) {
                    HStack {
                        AsyncImage(url: item.poster)
                            .frame(width: 100, height: 150)
                        Text(item.name)
                    }
                }
            }
            .navigationTitle("Trending")
            .task { await loadCatalog() }
            .fullScreenCover(item: $player) { player in
                VideoPlayer(player: player)
                    .onDisappear { player.pause() }
            }
        }
    }

    func loadCatalog() async {
        // Example call to get catalog using Stremio Core
        guard let action = try? Stremio_Core_Runtime_Action.with { builder in
            var catalogReq = Stremio_Core_Types_CatalogRequest()
            catalogReq.type = "movie"
            catalogReq.id = "top"
            builder.requests = [catalogReq]
        } else { return }
        Core.dispatch(action: action)

        if let state: Stremio_Core_Runtime_State = Core.getState(.context) {
            items = state.catalog.items.map { it in
                CatalogItem(
                    id: it.id,
                    name: it.name,
                    poster: URL(string: it.poster),
                    stream: it.stream)
            }
        }
    }

    func play(stream: String) {
        if let url = URL(string: stream) {
            player = AVPlayer(url: url)
            player?.play()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
