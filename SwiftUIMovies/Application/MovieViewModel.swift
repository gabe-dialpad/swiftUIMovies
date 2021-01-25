import Combine

public class MovieViewModel: ObservableObject {
            
    @Published var movies: [Movie] = []
    var finishedLoading = false
    
    var cancellables = Set<AnyCancellable>()
                    
    func upcoming(page: String) {
        guard !finishedLoading else {
            return
        }
                        
        MoviesApiDataSourceImpl().upcoming(page: page)?.sink(receiveCompletion: { (completion) in
            switch completion {
                case .finished:
                    print("🏁 finished fetching characters")
                case .failure(let error):
                    print("❗️ failure: \(error)")
            }
        }, receiveValue: { [weak self] (result)  in
            if result.results.isEmpty {
                self?.finishedLoading = true
            }
            
            self?.movies.append(contentsOf: result.results)
        })
        .store(in: &cancellables)
    }
}

