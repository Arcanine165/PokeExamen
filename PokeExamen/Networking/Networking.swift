//
//  Networking.swift
//  PokeExamen
//
//  Created by Victor Perez on 16/01/24.
//

import Foundation
enum NetworkError : Error {
    case urlError
    case canNotParseData
}
enum Endpoint : String {
    case pokemon = "/pokemon/"
}
final class Networking{
    let url : String = Bundle.main.infoDictionary!["BASE_URL"] as! String
 
    static let shared = Networking()
    
    private init(){
        
    }
    
    func setRequest<T: Codable>(type: T.Type, endpoint : Endpoint, param : String, httpMethod : String, completion : @escaping (Result<T,NetworkError>)->Void){
        guard let request = createRequest(endpoint: endpoint, param: param, httpMethod: httpMethod) else {
            completion(.failure(NetworkError.urlError))
            return
        }
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(NetworkError.urlError))
                return
            }
            do{
                let response = try JSONDecoder().decode(T.self, from: data)
                completion(.success(response))
            }catch{
                
                completion(.failure(NetworkError.canNotParseData))
            }
        }.resume()
        
        
    }
    private func createRequest(endpoint : Endpoint, param : String, httpMethod : String)->URLRequest?{
        guard var components = URLComponents(string: url + endpoint.rawValue + param) else {
            return nil
        }
        let headers : [String:String] =  [ "Content-Type": "application/json"]
       
        
        guard let url = components.url else {
            return nil
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod
        urlRequest.allHTTPHeaderFields = headers
        return urlRequest
    }
}
