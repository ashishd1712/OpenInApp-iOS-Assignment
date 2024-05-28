//
//  APIService.swift
//  openInAppAssignment
//
//  Created by Ashish Dutt on 28/05/24.
//

import Foundation

class APIService {
    static let shared = APIService()
    
    private init() {}
    
    func fetchDashboardData(completion: @escaping (Result<Dashboard, Error>) -> Void) {
        guard let url = URL(string: "https://api.inopenapp.com/api/v1/dashboardNew") else {
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        request.addValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjU5MjcsImlhdCI6MTY3NDU1MDQ1MH0.dCkW0ox8tbjJA2GgUx2UEwNlbTZ7Rr38PVFJevYcXFI", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                let error = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No Data Found"])
                completion(.failure(error))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let dashboardData = try decoder.decode(Dashboard.self, from: data)
                completion(.success(dashboardData))
            } catch let parseError as DecodingError {
                switch parseError {
                case .typeMismatch(let type, let context):
                    print("Type '\(type)' mismatch: \(context.debugDescription), codingPath: \(context.codingPath)")
                case .valueNotFound(let type, let context):
                    print("Value not found for type '\(type)': \(context.debugDescription), codingPath: \(context.codingPath)")
                case .keyNotFound(let key, let context):
                    print("Key '\(key)' not found: \(context.debugDescription), codingPath: \(context.codingPath)")
                case .dataCorrupted(let context):
                    print("Data corrupted: \(context.debugDescription), codingPath: \(context.codingPath)")
                @unknown default:
                    print("Unknown error: \(parseError.localizedDescription)")
                }
                if let jsonString = String(data: data, encoding: .utf8) {
                    print("Failed JSON data: \(jsonString)")
                }
                completion(.failure(parseError))
            } catch {
                print("Parsing error: \(error.localizedDescription)")
                if let jsonString = String(data: data, encoding: .utf8) {
                    print("Failed JSON data: \(jsonString)")
                }
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}

