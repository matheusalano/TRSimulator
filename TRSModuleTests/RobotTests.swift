import XCTest

@testable import TRSModule

final class RobotTests: XCTestCase {
    
    private var sut: Robot!
    private var table: TableMock!

    override func setUpWithError() throws {
        table = TableMock(size: 0)
        sut = Robot(table: table, direction: .north, initialPosition: Position(x: 2, y: 2))
    }

    func testMoveValid() {
        table.positionValid = true
        sut.move()
        XCTAssertEqual(sut.position, Position(x: 2, y: 3))
    }

    func testMoveInvalid() {
        table.positionValid = false
        sut.move()
        XCTAssertEqual(sut.position, Position(x: 2, y: 2))
    }
    
    func testTurnLeft() {
        sut.turnLeft()
        XCTAssertEqual(sut.direction, .west)
    }
    
    func testTurnRight() {
        sut.turnRight()
        XCTAssertEqual(sut.direction, .east)
    }
    
    func testReport() {
        XCTAssertEqual(sut.report(), "2,2,NORTH")
    }
}

private final class TableMock: TableProtocol {
    
    var positionValid = true
    
    init(size: Int) {}
    
    func isPositionValid(_ position: Position) -> Bool {
        positionValid
    }
    
    func report(with robot: RobotProtocol?) -> String { "" }
}
