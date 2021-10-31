//
//  RemoteServer.swift
//  Argonaut
//
//  Created by Vincent Coetzee on 31/10/21.
//

import Foundation
    
internal typealias ResponseClosure = (RequestResult) -> Void

internal class RemoteServer
    {
    internal static let kServerURL  = "https://httpbin.org/anything/post"
    
    internal func sendQuery(_ query: Query,closure: @escaping ResponseClosure)
        {
        var urlRequest = URLRequest(url: query.request.url)
        urlRequest.httpMethod = query.request.method
        urlRequest.httpBody = query.request.payload
        urlRequest.setValue("application/json; utf-8",forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json",forHTTPHeaderField: "Accept")
        ///
        /// This is executed on a background thread in any event so we will
        /// not explicitly send it to another thread.
        ///
        let dataTask = URLSession.shared.dataTask(with: urlRequest)
            {
            data,response,error in
            if let error = error
                {
                closure(.serverError(error))
                }
            else if let data = data
                {
                do
                    {
                    let incoming = try JSONSerialization.jsonObject(with: data, options: [])
                    if let dictionary = incoming as? NSDictionary
                        {
                        let response = Response(json: dictionary)
                        query.response = response
                        closure(.success(query))
                        }
                    else
                        {
                        closure(.invalidResponseFormat)
                        }
                    }
                catch let jsonError
                    {
                    closure(.jsonDecodingFailed(jsonError))
                    }
                }
            }
        dataTask.resume()
        }
    }
