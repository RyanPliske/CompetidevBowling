import XCTest
@testable import BowlingCalculator

class BowlingModelTests: XCTestCase {
    
    var testObject: BowlingModel!
    let mockDelegate = MockBowlingModelDelegate()
    
    override func setUp() {
        super.setUp()
        testObject = BowlingModel()
        testObject.delegate = mockDelegate
    }
    
    func testWhenBowlingModelInitialized_FramesArrayIsEmpty() {
        XCTAssertTrue(testObject.frames.isEmpty)
    }
    
    func testWhenAddCalled_ThenFrameCountIsOne() {
        testObject.addScore(8)
        
        XCTAssertEqual(testObject.frames.count, 1)
        XCTAssertEqual(testObject.totalScore, 0)
    }
    
    func testWhenAddCalled_Twice_AndScoreForFramesAreLessThan10_ThenFrameCountIsStillOne() {
        testObject.addScore(8)
        
        XCTAssertEqual(testObject.frames.count, 1)
        XCTAssertEqual(testObject.totalScore, 0)
        
        testObject.addScore(1)
        
        XCTAssertEqual(testObject.frames.count, 1)
        XCTAssertEqual(testObject.totalScore, 9)
    }
    
    func testWhenAddCalled_Thrice_AndScoreForFramesAreLessThan10_ThenFrameCountIsTwo() {
        testObject.addScore(8)
        
        XCTAssertEqual(testObject.frames.count, 1)
        XCTAssertEqual(testObject.totalScore, 0)
        
        testObject.addScore(1)
        
        XCTAssertEqual(testObject.frames.count, 1)
        XCTAssertEqual(testObject.totalScore, 9)
        
        testObject.addScore(3)
        
        XCTAssertEqual(testObject.frames.count, 2)
        XCTAssertEqual(testObject.totalScore, 9)
    }
    
    func testWhenAddCalled_FourTimes_AndScoreForFramesAreLessThan10_ThenFrameCountIsTwo() {
        testObject.addScore(8)
        
        XCTAssertEqual(testObject.frames.count, 1)
        XCTAssertEqual(testObject.totalScore, 0)
        
        testObject.addScore(1)
        
        XCTAssertEqual(testObject.frames.count, 1)
        XCTAssertEqual(testObject.totalScore, 9)
        
        testObject.addScore(3)
        
        XCTAssertEqual(testObject.frames.count, 2)
        XCTAssertEqual(testObject.totalScore, 9)
        
        testObject.addScore(3)
        
        XCTAssertEqual(testObject.frames.count, 2)
        XCTAssertEqual(testObject.totalScore, 15)
    }
    
    func testWhenAddCalled_AndScoreOfBall1ForFrame1_IsTen_ThenScoreLimitReachForFrame() {
        testObject.addScore(10)
        
        XCTAssertTrue((testObject.frames.first! as Frame).scoreLimitReached)
        XCTAssertEqual(testObject.totalScore, 0)
    }
    
    func testWhenAddCalled_AndScoreOf1ForFrame1_IsTen_And_AddScoreCalled_ThenNumberOfFramesIsTwo() {
        testObject.addScore(10)
        
        XCTAssertTrue((testObject.frames.first! as Frame).scoreLimitReached)
        XCTAssertEqual(testObject.totalScore, 0)
        
        testObject.addScore(9)
        
        XCTAssertEqual(testObject.frames.count, 2)
        XCTAssertEqual(testObject.totalScore, 10)
    }
    
    func testWhenAddCalled_AndScoreOf1And2_IsTen_And_AddScoreCalled_ThenNumberOfFramesIsTwo() {
        testObject.addScore(8)
        
        XCTAssertEqual(testObject.frames.count, 1)
        XCTAssertEqual(testObject.totalScore, 0)
        
        testObject.addScore(2)
        
        XCTAssertEqual(testObject.frames.count, 1)
        XCTAssertEqual(testObject.totalScore, 10)
        
        XCTAssertTrue((testObject.frames.first! as Frame).scoreLimitReached)
        
        testObject.addScore(9)
        
        XCTAssertEqual(testObject.frames.count, 2)
        XCTAssertEqual(testObject.totalScore, 10)
    }
    
    func testWhenAddCalled_AndScoreIsGreatherThan10_ThenReturnError() {
        testObject.addScore(-1)
    }
    
}

class MockBowlingModelDelegate: BowlingModelDelegate {
    var displayMessageCalled = false
    
    func displayMessage(message: String) {
        displayMessageCalled = true
    }
}
