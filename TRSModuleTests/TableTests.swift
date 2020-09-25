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
    
    func testReport() {
        let robot = RobotMock(table: sut, direction: .north, initialPosition: Position(x: 3, y: 2))
        XCTAssertEqual(sut.report(with: robot), "_ _ _ _ _ \n_ _ _ _ _ \n_ _ _ R _ \n_ _ _ _ _ \n_ _ _ _ _ \n")
    }
}

private final class RobotMock: RobotProtocol {
    var position: Position
    
    init(table: TableProtocol, direction: Direction, initialPosition: Position) {
        self.position = initialPosition
    }
    
    func move() {}
    
    func turnLeft() {}
    
    func turnRight() {}
    
    func report() -> String { "" }
}
