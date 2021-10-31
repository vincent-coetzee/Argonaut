//
//  Optional+Extensions.swift
//  Argonaut
//
//  Created by Vincent Coetzee on 31/10/21.
//

import Foundation

extension Optional
    {
    internal var isNil: Bool
        {
        switch(self)
            {
            case .none:
                return(true)
            case .some(_):
                return(false)
            }
        }
        
    internal var isNotNil: Bool
        {
        switch(self)
            {
            case .none:
                return(false)
            case .some(_):
                return(true)
            }
        }
    }
