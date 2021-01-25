import Foundation

public enum ServiceError: Error {
    case url(URLError?)
    case decode(Error)
    case unknown(Error)
    case buildURLError(String)
}
