import XCTest

@testable import TRSModule

final class DirectionTests: XCTestCase {
    
    var sut: Direction!

    func testLeftFromNorth() {
        sut = .north
        XCTAssertEqual(sut.turnLeft(), .west)
    }
    
    func testLeftFromSouth() {
        sut = .south
        XCTAssertEqual(sut.turnLeft(), .east)
    }
    
    func testLeftFromEast() {
        sut = .east
        XCTAssertEqual(sut.turnLeft(), .north)
    }
    
    func testLeftFromWest() {
        sut = .west
        XCTAssertEqual(sut.turnLeft(), .south)
    }
    
    func testRightFromNorth() {
        sut = .north
        XCTAssertEqual(sut.turnRight(), .east)
    }
    
    func testRightFromSouth() {
        sut = .south
        XCTAssertEqual(sut.turnRight(), .west)
    }
    
    func testRightFromEast() {
        sut = .east
        XCTAssertEqual(sut.turnRight(), .south)
    }
    
    func testRightFromWest() {
        sut = .west
        XCTAssertEqual(sut.turnRight(), .north)
    }
}
