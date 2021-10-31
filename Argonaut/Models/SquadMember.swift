//
//  Member.swift
//  Argonaut
//
//  Created by Vincent Coetzee on 31/10/21.
//

import Foundation

internal struct SquadMember
    {
    private static let kPossibleMemberFirstNames = ["Radiation","Powerful","Super","Active","Perfect","Super","Mega","Light","Sound","Energy","Wave","Elastic","Strong"]
    private static let kPossibleMemberSecondNames = ["Red","Man","Woman","Kid","Master","Mistress","Green","Yellow","Black","White","Orange"]
    private static let kPossibleMemberSecretFirstNames = ["Peter","Petra","Alan","Vanessa","Veronica","Betty","Graham","June","Jennifer","Sharon","Catherine","Elizabeth","John","Paul"]
    private static let kPossibleMemberSecretLastNames = ["Jones","DeWet","Marks","Cleary","Brown","Bowden","Greene","Black","Jackson","Deneuve","Taylor","Peters","Poenpal","Boxster"]
    private static let kPossibleMemberFirstPowers = ["Radiation","Sound","Energy","Light","Fire","Wave","Earth","Air","Rope","Rubber","Concrete","Wood","Stone","Steel","Engine"]
    private static let kPossibleMemberLastPowers = ["Controller","Master","Cycler","Generator","Twister","Manager","Sender","Slapper","Finder","Forcer","Manipulator","Receiver","Reviver","Starter","Stopper"]
    
    internal static func makeRandomSquadMember() -> SquadMember
        {
        let name = self.pickString(from: self.kPossibleMemberFirstNames) + " " + self.pickString(from: self.kPossibleMemberSecondNames)
        let age = Int.random(in: 16...50)
        let secretIdentity = self.pickString(from: self.kPossibleMemberSecretFirstNames) + " " + self.pickString(from: self.kPossibleMemberSecretLastNames)
        var powers = Array<String>()
        for _ in 0..<Int.random(in: 0..<4)
            {
            let power = self.pickString(from: kPossibleMemberFirstPowers) + " " + self.pickString(from: self.kPossibleMemberLastPowers)
            powers.append(power)
            }
        return(SquadMember(name: name, age: age, secretIdentity: secretIdentity, powers: powers))
        }
        
    private static func pickString(from: Array<String>) -> String
        {
        let index = Int.random(in: 0..<from.count)
        let string = from[index]
        return(string)
        }
        
    internal let name: String
    internal let age: Int
    internal let secretIdentity: String
    internal let powers: Array<String>
    
    internal func dump()
        {
        print("SQUAD MEMBER:\n")
        print("NAME: \(self.name)")
        print("AGE: \(self.age)")
        print("SECRET IDENTITY: \(self.secretIdentity)")
        print("powers: \(self.powers)")
        }
    }

internal typealias SquadMembers = Array<SquadMember>
