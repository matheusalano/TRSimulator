import XCTest

@testable import TRSModule

final class TableTests: XCTestCase {
    
    var sut: Table!

    override func setUpWithError() throws {
        sut = Table(size: 5)
    }

    func testBoundaries() throws {
        XCTAssertEqual(sut.maxX, 4)
        XCTAssertEqual(sut.maxY, 4)
    }

    func testPositionValid() {
        XCTAssertTrue(sut.isPositionValid(Position(x: 0, y: 1)))
        XCTAssertTrue(sut.isPositionValid(Position(x: 4, y: 4)))
        
        XCTAssertFalse(sut.isPositionValid(Position(x: 0, y: -1)))
        XCTAssertFalse(sut.isPositionValid(Position(x: 1, y: 5)))
    }
}
