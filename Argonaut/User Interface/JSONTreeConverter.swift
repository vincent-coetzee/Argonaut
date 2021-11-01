//
//  JSONTreeConverter.swift
//  Argonaut
//
//  Created by Vincent Coetzee on 31/10/21.
//

import Foundation

internal struct JSONTreeConverter
    {
    private let group: Group
    
    init(group: Group)
        {
        self.group = group
        }
        
    internal mutating func convertToElementTree() -> JSONElementItems
        {
        var elements: JSONElementItems = []
        elements.append(JSONGroupItem(name: group.key, group: group))
        return(elements)
        }
    }
