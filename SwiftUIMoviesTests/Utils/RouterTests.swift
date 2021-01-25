import XCTest
@testable import SwiftUIMovies

class RouterTests: XCTestCase {
    
    func testBuildUpcomingURL() {
        // Given
        let result = Router.upcoming([]).buildUrl()
        let expected = URL(string: "https://api.themoviedb.org/3/movie/upcoming?api_key=0bd449b4a197142635ab358c297053e6&language=en-U")
        
        // Then        
        XCTAssertEqual(result, expected)
    }
    

    func testBuildUpcomingURLWithoutParams() {
        // Given
        let result = Router.upcoming([URLQueryItem(name: "my_test", value: "testing")]).buildUrl()
        let expected = URL(string: "https://api.themoviedb.org/3/movie/upcoming?api_key=0bd449b4a197142635ab358c297053e6&language=en-U&my_test=testing")
        
        // Then
        XCTAssertEqual(result, expected)
    }
    
    func testBuildDetailURL() {
        // Given
        let detailUrl = Router.detail("464052").buildUrl()
                
        // Then
        XCTAssertEqual(detailUrl, URL(string: "https://api.themoviedb.org/3/movie/464052?api_key=0bd449b4a197142635ab358c297053e6&language=en-U"))
    }
}

