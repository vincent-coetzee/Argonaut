//
//  Optional+Extensions.swift
//  Argonaut
//
//  Created by Vincent Coetzee on 31/10/21.
//

import Foundation

extension Optional
    {
    ///
    /// Tests this optional to see whether it is nil or not and returns
    /// true of false accordingly. Convenience method.
    ///
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
    ///
    /// See above comment
    /// 
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
