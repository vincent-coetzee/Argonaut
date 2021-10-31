//
//  JSONTreeConverter.swift
//  Argonaut
//
//  Created by Vincent Coetzee on 31/10/21.
//

import Foundation

internal struct JSONTreeConverter
    {
    private let dictionary: NSDictionary
    
    init(dictionary: NSDictionary)
        {
        self.dictionary = dictionary
        }
        
    internal mutating func convertToElementTree() -> JSONElementItems
        {
        var elements: JSONElementItems = []
        for(key,value) in self.dictionary
            {
            let stringKey = key as! String
            switch(value)
                {
                case is NSDictionary:
                    elements.append(JSONObjectItem(name: stringKey,dictionary: value as! NSDictionary))
                case is NSArray:
                    elements.append(JSONArrayItem(name: stringKey,array: value as! NSArray))
                case is NSNumber:
                    elements.append(JSONNumberItem(name: stringKey,number: value as! NSNumber))
                case is NSString:
                    elements.append(JSONStringItem(name: stringKey,string: value as! NSString))
                case is NSNull:
                    elements.append(JSONNullItem(name: stringKey))
                default:
                    fatalError("This is not theoretically possible.")
                }
            }
        return(elements)
        }
    }
