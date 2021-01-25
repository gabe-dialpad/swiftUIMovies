import Foundation

struct MovieBaseResponse: Decodable {
    let page: Int
    let total_pages: Int
    let results: [Movie]
    
    
//    enum CodingKeys: String, CodingKey {
//        case datosConexion = "datos_conexion"
//    }
}
