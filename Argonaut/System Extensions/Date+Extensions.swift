//
//  Date+Extensions.swift
//  Argonaut
//
//  Created by Vincent Coetzee on 31/10/21.
//

import Foundation

extension Date
    {
    ///
    ///
    /// Generate a ( psuedo ) random date that is in the past.
    ///
    /// 
    public static var randomPast:Date
        {
        let day = Int.random(in: 1...27)
        let month = Int.random(in: 1...12)
        var components = Calendar.current.dateComponents([.year],from: Date())
        var year = components.year!
        let yearDelta = Int.random(in: 0..<20)
        year -= yearDelta
        components = DateComponents(year: year,month: month,day: day)
        let date = Calendar.current.date(from: components)!
        return(date)
        }
    }
