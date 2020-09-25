import XCTest

@testable import TRSModule

final class PositionTests: XCTestCase {
    
    var sut: Position!
    
    override func setUpWithError() throws {
        sut = Position(x: 2, y: 2)
    }

    func testNextFromNorth() {
        XCTAssertEqual(sut.nextPosition(from: .north), Position(x: 2, y: 3))
    }

    func testNextFromSouth() {
        XCTAssertEqual(sut.nextPosition(from: .south), Position(x: 2, y: 1))
    }
    
    func testNextFromEast() {
        XCTAssertEqual(sut.nextPosition(from: .east), Position(x: 3, y: 2))
    }
    
    func testNextFromWest() {
        XCTAssertEqual(sut.nextPosition(from: .west), Position(x: 1, y: 2))
    }
}
