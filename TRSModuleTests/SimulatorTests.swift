import XCTest

@testable import TRSModule

final class SimulatorTests: XCTestCase {
    
    private var sut: Simulator<RobotMock, TableMock>!

    override func setUpWithError() throws {
        sut = Simulator(tableSize: 5)
    }

    func testInitTable() {
        XCTAssertEqual(sut.table.size, 5)
    }
    
    func testPlaceValid() {
        sut.table.positionValid = true
        sut.place(position: Position(x: 2, y: 2), direction: .north)
        XCTAssertNotNil(sut.robot)
        XCTAssertTrue(sut.robot?.table === sut.table)
        XCTAssertEqual(sut.robot?.position, Position(x: 2, y: 2))
        XCTAssertEqual(sut.robot?.direction, .north)
    }

    func testPlaceInvalid() {
        sut.table.positionValid = false
        sut.place(position: Position(x: 2, y: 2), direction: .north)
        XCTAssertNil(sut.robot)
    }
    
    func testMove() {
        sut.table.positionValid = true
        sut.place(position: Position(x: 2, y: 2), direction: .north)
        sut.move()
        XCTAssertTrue(sut.robot?.moveCalled == true)
    }
    
    func testLeft() {
        sut.table.positionValid = true
        sut.place(position: Position(x: 2, y: 2), direction: .north)
        sut.turnLeft()
        XCTAssertTrue(sut.robot?.leftCalled == true)
    }
    
    func testRight() {
        sut.table.positionValid = true
        sut.place(position: Position(x: 2, y: 2), direction: .north)
        sut.turnRight()
        XCTAssertTrue(sut.robot?.rightCalled == true)
    }
    
    func testReport() {
        sut.table.positionValid = true
        sut.place(position: Position(x: 2, y: 2), direction: .north)
        XCTAssertEqual(sut.report(), "report_mock")
    }
}

private final class TableMock: TableProtocol {
    
    var positionValid = true
    var size: Int
    
    init(size: Int) {
        self.size = size
    }
    
    func isPositionValid(_ position: Position) -> Bool {
        positionValid
    }
    
    func report(with robot: RobotProtocol?) -> String { "" }
}

private final class RobotMock: RobotProtocol {
    var position: Position
    var table: TableProtocol
    var direction: Direction
    
    var moveCalled = false
    var leftCalled = false
    var rightCalled = false
    
    init(table: TableProtocol, direction: Direction, initialPosition: Position) {
        self.position = initialPosition
        self.table =  table
        self.direction = direction
    }
    
    func move() {
        moveCalled = true
    }
    
    func turnLeft() {
        leftCalled = true
    }
    
    func turnRight() {
        rightCalled = true
    }
    
    func report() -> String { "report_mock" }
}
