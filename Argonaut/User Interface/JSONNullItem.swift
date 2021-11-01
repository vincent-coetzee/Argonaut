//
//  JSONNullItem.swift
//  Argonaut
//
//  Created by Vincent Coetzee on 31/10/21.
//

import Cocoa

internal class JSONNullItem: JSONElementItem
    {
    internal override var typeIcon: NSImage
        {
        NSImage(named: "JSONIconNull")!
        }
    }
