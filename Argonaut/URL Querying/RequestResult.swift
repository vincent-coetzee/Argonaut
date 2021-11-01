//
//  RequestResult.swift
//  Argonaut
//
//  Created by Vincent Coetzee on 31/10/21.
//

import Foundation

///
/// A holder for errors and results
/// 
internal enum RequestResult: Error
    {
    case encodingFailed(Error)
    case invalidURL(String)
    case serverError(Error)
    case jsonDecodingFailed(Error)
    case invalidResponseFormat
    case success(Query)
    case convertingToJSONFailed
    case unknownError
    
    internal var errorMessage: String
        {
        switch(self)
            {
            case .encodingFailed(let error):
                return("Encoding the query to JSON failed with error: \(error)")
            case .invalidURL(let string):
                return("The URL '\(string)' is invalid.")
            case .serverError(let error):
                return("The server returned an error of: \(error)")
            case .jsonDecodingFailed(let error):
                return("An error occurred decoding the payload into JSON: \(error)")
            case .invalidResponseFormat:
                return("The data returned by the server is not in a valid format")
            case .convertingToJSONFailed:
                return("Converting the random query to JSON failed")
            case .unknownError:
                fallthrough
            default:
                return("An unknown error occurred")
            }
        }
    }
