import Foundation

public enum Router {
    
    var baseUrl: String { "https://api.themoviedb.org/3/movie" }
    var apiKey: String  { "0bd449b4a197142635ab358c297053e6" }
    var language: String { "en-U" }
    
    case upcoming([URLQueryItem])
    case detail(String)
    
    var path: String {
        switch self {
        case .upcoming: return "upcoming"
        case .detail(let movieId): return movieId
        }
    }
    
    var params: [URLQueryItem] {
        var defaultQueryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "language", value: language)
        ]
        
        switch self {
        case .upcoming(let upCommingParams):
            defaultQueryItems.append(contentsOf: upCommingParams)
            return defaultQueryItems
        default:
            return defaultQueryItems
        }
    }
    
    func buildUrl() -> URL? {
        let baseUrlPath = "\(baseUrl)/\(path)"
        
        var baseURLComponent = URLComponents(string: baseUrlPath)
        baseURLComponent?.queryItems = params
        
        guard let baseURL = baseURLComponent else {
            return nil
        }
        
        return baseURL.url
    }
}
