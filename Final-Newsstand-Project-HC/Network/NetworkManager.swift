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
    var baseURL = "https://api.producthunt.com/v1/"
    var token = apiKey
    
    func getNews(_ completion: @escaping (Result<[News]>) -> Void){
        let newsRequest = makeRequest(for: .articles)
    }
    
    func getArticle(){
        
    }
    
    enum EndPoints {
        case articles
        func getPath(){
            
        }
        
        func getHTTPMethod() -> String {
          return "GET"
        }
        
        func getHeaders(){
            
        }
        
        func getParams(){
            
        }
        
        func paramsToString(){
            
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
        request.allHTTPHeaderFields = endPoint.getHeaders(token: token)

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
