//
//  Member.swift
//  Argonaut
//
//  Created by Vincent Coetzee on 31/10/21.
//

import Foundation

///
/// Made as Encodable so JSONEncoder can be used on it. For more detail see Squad
///
public struct SquadMember: Encodable,Decodable
    {
    ///
    ///
    /// Define various pieces of static information that will be used when generating random squad members.
    ///
    ///
    private static let kPossibleMemberFirstNames = ["Radiation","Powerful","Super","Active","Perfect","Super","Mega","Light","Sound","Energy","Wave","Elastic","Strong"]
    private static let kPossibleMemberSecondNames = ["Red","Man","Woman","Kid","Master","Mistress","Green","Yellow","Pink","Purple","Orange"]
    private static let kPossibleMemberSecretFirstNames = ["Peter","Petra","Alan","Vanessa","Veronica","Betty","Graham","June","Jennifer","Sharon","Catherine","Elizabeth","John","Paul"]
    private static let kPossibleMemberSecretLastNames = ["Jones","DeWet","Marks","Cleary","Brown","Bowden","Greene","Rickman","Jackson","Deneuve","Taylor","Peters","Ponpal","Boxster"]
    private static let kPossibleMemberFirstPowers = ["Radiation","Sound","Energy","Light","Fire","Wave","Earth","Air","Rope","Rubber","Concrete","Wood","Stone","Steel","Engine"]
    private static let kPossibleMemberLastPowers = ["Controller","Master","Cycler","Generator","Twister","Manager","Sender","Slapper","Finder","Forcer","Manipulator","Receiver","Reviver","Starter","Stopper"]
    private static let kMinimumPowerCount = 2
    private static let kMaximumPowerCount = 5
    private static let kMinimumAge = 16
    private static let kMaximumAge = 40
    
    internal static func makeRandomSquadMember() -> SquadMember
        {
        let name = self.pickString(from: self.kPossibleMemberFirstNames) + " " + self.pickString(from: self.kPossibleMemberSecondNames)
        let age = Int.random(in: Self.kMinimumAge...Self.kMaximumAge)
        let secretIdentity = self.pickString(from: self.kPossibleMemberSecretFirstNames) + " " + self.pickString(from: self.kPossibleMemberSecretLastNames)
        var powers = Array<String>()
        for _ in 0..<Int.random(in: Self.kMinimumPowerCount..<Self.kMaximumPowerCount)
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
        
    ///
    ///
    /// Fields needed by a squad member
    ///
    /// 
    public let name: String
    public let age: Int
    public let secretIdentity: String
    public let powers: Array<String>
    
    ///
    /// Convenience method for having a look at a squad member during testing
    ///
    internal func dump()
        {
        print("SQUAD MEMBER:\n")
        print("NAME: \(self.name)")
        print("AGE: \(self.age)")
        print("SECRET IDENTITY: \(self.secretIdentity)")
        print("powers: \(self.powers)")
        }
    }

public typealias SquadMembers = Array<SquadMember>
