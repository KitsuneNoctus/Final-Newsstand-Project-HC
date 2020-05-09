//
//  NetworkManager.swift
//  Final-Newsstand-Project-HC
//
//  Created by Henry Calderon on 4/30/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import Foundation
class NetworkManager{
    let urlSession = URLSession.shared
//    let catArt = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=\(apiKey)"
    var baseURL = "https://newsapi.org/v2/"
    var token = apiKey
    
    func getNews(_ category:String, completion: @escaping (Result<[News]>) -> Void){
        let newsRequest = makeRequest(for: .articles(category: category))
        let task = urlSession.dataTask(with: newsRequest) { data, response, error in
            if let error = error {
                return completion(Result.failure(error))
            }
            
            guard let data = data else {
                return completion(Result.failure(EndPointError.noData))
            }
            print(data)
            
            guard let result = try? JSONDecoder().decode(NewsList.self, from: data) else{
                return completion(Result.failure(EndPointError.couldNotParse))
            }
//            print(result)
                        
            let news = result.articles
            
            DispatchQueue.main.async {
                completion(Result.success(news))
            }
        }
        
        task.resume()
    }

    
    enum EndPoints {
        case articles(category: String)
        case contents
        
        func getPath() -> String{
            switch self {
            case .articles:
                return "top-headlines"
            case .contents:
                return "top-headlines"
            }
        }
        
        func getHTTPMethod() -> String {
            return "GET"
        }
        
        func getHeaders(token: String) -> [String: String]{
            return [
                "Accept": "application/json",
                "Content-Type": "application/json",
                "Authorization": "X-Api-Key \(apiKey)",
                "Host": "newsapi.org"
            ]
        }
        
        func getParams() -> [String:String]{
            switch self {
            case .articles(let category):
                return[
                    "country":"us",
                    "category":category,
                    "apiKey":apiKey
                ]
            case .contents:
                return[
                    "i":"i"
                ]
            }
        }
        
        func paramsToString() -> String{
            let parameterArray = getParams().map { key, value in
                return "\(key)=\(value)"
            }
            
            return parameterArray.joined(separator: "&")
        }
    }
    
    private func makeRequest(for endPoint: EndPoints) -> URLRequest{
        // grab the parameters from the endpoint and convert them into a string
        let stringParams = endPoint.paramsToString()
        // get the path of the endpoint
        let path = endPoint.getPath()
        // create the full url from the above variables
        let fullURL = URL(string: baseURL.appending("\(path)?\(stringParams)"))!
        
        // build the request
        var request = URLRequest(url: fullURL)
        request.httpMethod = endPoint.getHTTPMethod()
        request.allHTTPHeaderFields = endPoint.getHeaders(token: apiKey)

        return request
    }
    
    //MARK: Result ENUM
    enum Result<T> {
     case success(T)
     case failure(Error)
    }
    
    //MARK: Endpoint Error ENUM
    enum EndPointError: Error {
      case couldNotParse
      case noData
    }
}
