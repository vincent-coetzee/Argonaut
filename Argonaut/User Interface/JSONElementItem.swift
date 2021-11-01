//
//  JSONElementItem.swift
//  Argonaut
//
//  Created by Vincent Coetzee on 31/10/21.
//

import AppKit

///
///
/// A JSONElementItem wraps a particular piece of JSON data in a way that
/// is appropriate for it to be formatted and displayed. The reason only
/// Objects, Arrays, Strings, Numbers and Nulls are handled is because those
/// are the primary types that constutitute JSON. There is also a Group items
/// for displaying groups of elements.
///
///
internal class JSONElementItem
    {
    internal class func element(with name: String,from element: Any) -> JSONElementItem
        {
        if element is Group
            {
            return(JSONGroupItem(name: name,group: element as! Group))
            }
        else if element is NSDictionary
            {
            return(JSONObjectItem(name: name,dictionary: element as! NSDictionary))
            }
        else if element is NSArray
            {
            return(JSONArrayItem(name: name,array: element as! NSArray))
            }
        else if element is NSString
            {
            return(JSONStringItem(name: name,string: element as! NSString))
            }
        else if element is NSNumber
            {
            return(JSONNumberItem(name: name,number: element as! NSNumber))
            }
        else if element is NSNull
            {
            return(JSONNullItem(name: name))
            }
        else
            {
            fatalError("This should not happen because it means the response from the server violated the definition of JSON.")
            }
        }

    internal var typeIcon: NSImage
        {
        fatalError("This should have been overridden in a subclass.")
        }
        
    internal var value: String
        {
        ""
        }
        
    internal var childCount: Int
        {
        0
        }
        
    internal var isExpandable: Bool
        {
        false
        }
        
    internal var name: String = ""
        
    internal init(name: String)
        {
        self.name = name
        }
        
    internal func child(atIndex: Int) -> JSONElementItem
        {
        fatalError("This should not have been called on this class.")
        }
    }

internal typealias JSONElementItems = Array<JSONElementItem>
