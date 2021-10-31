//
//  Squad.swift
//  Argonaut
//
//  Created by Vincent Coetzee on 31/10/21.
//

import Foundation

public struct Squad: Encodable
    {
    private static let kSquadPart1Names = ["Magic","Power","Control","Mega","Epsilon","Alpha","Go","Force"]
    private static let kSquadPart2Names = ["Squad","Group","Crew","People","Force"]
    private static let kHomeTownNames = ["Mega City","Little Place","Big Rock","Little Rock","Smallville","Townsville","Placeville","Peace Town","Magic Rock","Big Falls","Little Falls","Little River","Big River","Rock River"]
    
    internal static func makeRandomSquad() -> Squad
        {
        let name = self.pickString(from: self.kSquadPart1Names) + " " + self.pickString(from: self.kSquadPart2Names)
        let homeTown = self.pickString(from: self.kHomeTownNames)
        let active = Int.random(in: 0...1) == 0
        let memberCount = Int.random(in: 0..<6)
        var members = SquadMembers()
        for _ in 0..<memberCount
            {
            members.append(SquadMember.makeRandomSquadMember())
            }
        return(Squad(squadName: name, formed: Date.randomPast, homeTown: homeTown, active: active, members: members))
        }
        
    private static func pickString(from: Array<String>) -> String
        {
        let index = Int.random(in: 0..<from.count)
        let string = from[index]
        return(string)
        }
        
    internal let squadName: String
    internal let formed: Date
    internal let homeTown: String
    internal let active: Bool
    internal let members: SquadMembers
    
    ///
    /// Convenience method for having a look at a squad during testing
    ///
    internal func dump()
        {
        print("\nSQAD:\n")
        print("NAME: \(self.squadName)")
        print("FORMED: \(self.formed)")
        print("HOMETOWN: \(self.homeTown)")
        print("ACTIVE: \(self.active)")
        for member in self.members
            {
            member.dump()
            }
        }
    }
