import Foundation

public struct Movie: Decodable {
    let id: Int
    let title: String
    let original_title: String
    let overview: String
    let poster_path: String
    let backdrop_path: String
    let vote_average: Float
    let genre_ids: [Int]
}
