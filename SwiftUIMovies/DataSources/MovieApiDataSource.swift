import Foundation
import Combine

protocol CharactersApiDataSource {
    
    func allMovies() -> AnyPublisher<MovieBaseResponse, Error>
}


