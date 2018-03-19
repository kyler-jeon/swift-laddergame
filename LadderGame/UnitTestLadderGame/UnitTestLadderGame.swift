//
//  UnitTestLadderGame.swift
//  UnitTestLadderGame
//
//  Created by rhino Q on 2018. 3. 16..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//
/* 사다리 step4
 1. Input.validCheck()
 
 2. LadderGame 초기화 후
 
 2.1 - LadderGame.names
 
 2.2 - LadderGame.heightOfLadder
 */
import XCTest
@testable import LadderGame

class UnitTestLadderGame: XCTestCase {
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func test_ladderGame_height(){
        let names = ["linseang","rhino","mason","drake"]
        let heightOfLadder = 5
        let ladderGame = LadderGame(names, heightOfLadder)
        let ladderGameDTO = ladderGame.sendLadderGameDTO()
        XCTAssertEqual(ladderGameDTO.heightOfLadder, heightOfLadder, "should be equal")
    }
    
    func test_ladderGame_names(){
        let names = ["linseang","rhino","mason","drake"]
        let heightOfLadder = 5
        let ladderGame = LadderGame(names, heightOfLadder)
        let ladderGameDTO = ladderGame.sendLadderGameDTO()
        var players = [LadderPlayer]()
        for name in names {
            players.append(LadderPlayer(name: name))
        }
        
        for i in 0..<players.count {
            XCTAssertEqual(ladderGameDTO.names[i].name, players[i].name, "should be eaual")
        }
    }
    
    func test_ladderGame_numberOfLadder(){
        let names = ["linseang","rhino","mason","drake"]
        let heightOfLadder = 5
        var ladderGame = LadderGame(names, heightOfLadder)
        var players = [LadderPlayer]()
        for name in names {
            players.append(LadderPlayer(name: name))
        }
        
        // makeLadder() 테스트 준비
        ladderGame.makeLadder()
        let ladderGameDTO = ladderGame.sendLadderGameDTO()

        
        // makeLadder() 후 numberOfLadder 테스트
        //  ladderGame.ladderGameDTO.numberOfLadder  와 ( heightOfLadder + names.count ) / 2
        XCTAssertEqual(ladderGameDTO.numberOfLadder, (heightOfLadder + names.count) / 2, "should be equal")
    }
    
    func test_ladderGame_ladderMatrix_count_all(){
        let names = ["linseang","rhino","mason","drake"]
        let heightOfLadder = 5
        var ladderGame = LadderGame(names, heightOfLadder)
        var players = [LadderPlayer]()
        for name in names {
            players.append(LadderPlayer(name: name))
        }
        
        // makeLadder() 테스트 준비
        ladderGame.makeLadder()
        let ladderGameDTO = ladderGame.sendLadderGameDTO()
        
        // makeLadder() 후 ladderMatrix 테스트
        var allCount = 0
        for row in ladderGameDTO.ladderMatrix{
            for _ in row {
                allCount += 1
            }
        }
        //  ladderGame.ladderGameDTO.ladderMatrix의 크기와 heightOfLadder * (names.count - 1)
        XCTAssertEqual(allCount, heightOfLadder * ( names.count - 1 ), "Should be equal")
    }
    
    func test_ladderGame_ladderMatrix_count_true(){
        let names = ["linseang","rhino","mason","drake"]
        let heightOfLadder = 5
        var ladderGame = LadderGame(names, heightOfLadder)
        var players = [LadderPlayer]()
        for name in names {
            players.append(LadderPlayer(name: name))
        }
        
        // makeLadder() 테스트 준비
        ladderGame.makeLadder()
        let ladderGameDTO = ladderGame.sendLadderGameDTO()
        
        // makeLadder() 후 ladderMatrix 테스트
        var trueCount = 0
        for row in ladderGameDTO.ladderMatrix{
            for col in row {
                if col == true { trueCount += 1 }
            }
        }
        //  ladderGame.ladderGameDTO.ladderMatirx의 true의 개수가 ( heightOfLadder + names.count ) / 2 와 같은지
        XCTAssertEqual(trueCount, (heightOfLadder + names.count ) / 2, "Should be equal")
        
    }
    
    func test_fail_validChecker_checkHeight_nil(){
        XCTAssertEqual(ValidChecker.checkHeight(nil), 0, "should be 0")
    }
    
    func test_fail_validChecker_checkHeight_empty(){
        XCTAssertEqual(ValidChecker.checkHeight(""), 0, "should be 0")
    }
    
    func test_fail_validChecker_checkHeight_unableCastringInt(){
        XCTAssertEqual(ValidChecker.checkHeight("sdf"), 0, "should be 0")
    }
    
    func test_success_validChecker_checkHeight_ableCastringInt(){
        XCTAssertEqual(ValidChecker.checkHeight("1"), 1, "should be 1")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
}