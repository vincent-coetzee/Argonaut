//
//  Group.swift
//  Argonaut
//
//  Created by Vincent Coetzee on 1/11/21.
//

import Foundation

///
///
/// A Group holds a collection of other elements, grouping them for display purposes.
/// Technically they are not a JSON element so they get displayed as a JSONGroupItem
/// purely for the purpose of convenience.
///
/// 
internal class Group
    {
    internal let key: String
    internal let kids: NSMutableDictionary
    
    init(key: String)
        {
        self.key = key
        self.kids = NSMutableDictionary()
        }
        
    internal func addChild(_ child: Any,atKey key: String)
        {
        self.kids[key] = child
        }
        
    internal func addChild(_ group: Group)
        {
        self.kids[group.key] = group
        }
    }
