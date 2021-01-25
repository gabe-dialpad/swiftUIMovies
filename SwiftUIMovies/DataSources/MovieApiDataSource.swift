import Foundation
import Combine

public protocol MoviesApiDataSource {
    
    func upcoming(page: String) -> AnyPublisher<MovieBaseResponse, Error>?
}

public struct MoviesApiDataSourceImpl: MoviesApiDataSource {
    
    public func upcoming(page: String) -> AnyPublisher<MovieBaseResponse, Error>? {
        guard let url = Router.upcoming([URLQueryItem(name: "page", value: page)]).buildUrl() else {
            return nil
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: MovieBaseResponse.self, decoder: JSONDecoder())
            .mapError({ (error) -> ServiceError in
                switch error {
                case is DecodingError: return .decode(error)
                case is URLError: return .url(error as? URLError)
                default: return .unknown(error)
                }
            })
            .receive(on: RunLoop.main)
            .retry(1)
            .eraseToAnyPublisher()
    }
}
