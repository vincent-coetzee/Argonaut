//
//  RemoteServer.swift
//  Argonaut
//
//  Created by Vincent Coetzee on 31/10/21.
//

import Foundation
    
internal typealias ResponseClosure = (RequestResult) -> Void

///
///
/// A RemoteServer encapsulates the interface to the remote HHTP server.
///
/// 
internal class RemoteServer
    {
    internal static let kServerURL  = "https://httpbin.org/anything/post"
    
    internal func sendQuery(_ query: Query,closure: @escaping ResponseClosure)
        {
        var urlRequest = URLRequest(url: query.request.url)
        urlRequest.httpMethod = query.request.method
        urlRequest.httpBody = query.request.payload
        query.request.headers.append((key: "Content-Type",value: "application/json; utf-8"))
        query.request.headers.append((key: "Accept",value: "application/json"))
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
                    ///
                    ///
                    /// Get a binary packet back from server, first decode it to extract the "data" field.
                    ///
                    ///
                    let result = try JSONDecoder().decode(QueryResult.self, from: data)
                    ///
                    ///
                    /// Now convert the string field in "data" to binary
                    ///
                    if let incomingData = result.data.data(using: .utf8)
                        {
                        ///
                        ///
                        /// Deserialize the binary "data" into a dictionary ready for conversion to display items
                        ///
                        ///
                        let incoming = try JSONSerialization.jsonObject(with: incomingData, options: [])
                        if let dictionary = incoming as? NSDictionary
                            {
                            let response = Response(rawJSON: dictionary)
                            query.response = response
                            closure(.success(query))
                            }
                        else
                            {
                            closure(.invalidResponseFormat)
                            }
                        }
                    else
                        {
                        closure(.convertingToJSONFailed)
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
