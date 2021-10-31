//
//  ArgonautTests.swift
//  ArgonautTests
//
//  Created by Vincent Coetzee on 31/10/21.
//

import XCTest
@testable import Argonaut

class ArgonautTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testRandomSquadMemberGeneration()
        {
        let count = Int.random(in: 0..<10)
        var members = Array<SquadMember>()
        for _ in 0..<count
            {
            members.append(SquadMember.makeRandomSquadMember())
            }
        for member in members
            {
            member.dump()
            }
        XCTPass("Creating random squad members passed")
        }

}
