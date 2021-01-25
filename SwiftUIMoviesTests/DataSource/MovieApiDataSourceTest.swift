import XCTest
@testable import SwiftUIMovies
import Combine

class MovieApiDataSourceTest: XCTestCase {
    
    var characterSubscriber: AnyCancellable?
    
    func testUpcomingMovies() {
        characterSubscriber =
        MoviesApiDataSourceImpl().upcoming(page: "1")?.sink(receiveCompletion: { (completion) in
            switch completion {
                case .finished:
                    print("🏁 finished fetching characters")
                case .failure(let error):
                    print("❗️ failure: \(error)")
            }
        }, receiveValue: { (result) in
            print("result")
        })
    }
}

