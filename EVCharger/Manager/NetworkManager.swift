//
//  NetworkingManager.swift
//  EVCharger
//
//  Created by 박성원 on 1/11/24.
//

import Foundation


enum NetworkError: Error {
    case networkingError
    case dataError
    case parseError
}

public class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    typealias NetworkCompletion = (Result<[ChargerInfo], NetworkError>) -> Void
    
    func fetchVideo(completion: @escaping NetworkCompletion) {
        let urlString = "https://bigdata.kepco.co.kr/openapi/v1/EVcharge.do?metroCd=11&cityCd=11&apiKey=Szd82SFpRuvmkrCZ9985ItVgdIb5l32GX2Z51hv6&returnType=json"
        
        performRequest(with: urlString) { result in
            completion(result)
            
        }
    }
    
    private func performRequest(with urlString: String, completion: @escaping NetworkCompletion) {
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { data, _, error in
            if error != nil {
                completion(.failure(.networkingError))
                return
            }
            
            guard let safeData = data else {
                completion(.failure(.dataError))
                return
            }
            
            if let info = self.parseJSON(safeData) {
                completion(.success(info))
            } else {
                completion(.failure(.parseError))
            }
        }
        task.resume()
    }
    
    
    private func parseJSON(_ data: Data) -> [ChargerInfo]? {
        do {
            let decoder = JSONDecoder()
            let info = try decoder.decode(Welcome.self, from: data)
            return welcomeToChargerInfo(data: info)
        } catch DecodingError.dataCorrupted(let context) {
            print("Data corrupted: \(context.debugDescription)")
        } catch DecodingError.keyNotFound(let key, let context) {
            print("Key '\(key.stringValue)' not found: \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            print("Value of type '\(type)' not found: \(context.debugDescription)")
        } catch DecodingError.typeMismatch(let type, let context) {
            print("Type mismatch for type '\(type)' : \(context.debugDescription)")
        } catch {
            print("Decoding error: \(error.localizedDescription)")
        }
        return nil
    }
    
    func welcomeToChargerInfo(data: Welcome) -> [ChargerInfo] {
        var info: [ChargerInfo] = []
        data.data.forEach { result in
            info.append(ChargerInfo(placeName: result.stnPlace, address: result.stnAddr, rapid: result.rapidCnt, slow: result.slowCnt))}
        return info
    }
}
