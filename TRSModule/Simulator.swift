import Foundation

public final class Simulator<R: RobotProtocol, T: TableProtocol> {
    
    private var robot: R?
    
    private let table: T
    
    public init(tableSize: Int) {
        table = T(size: tableSize)
    }
    
    public func place(position: Position, direction: Direction) {
        guard table.isPositionValid(position) else { return }
        
        robot = R(table: table, direction: direction, initialPosition: position)
    }
    
    public func move() {
        robot?.move()
    }
    
    public func turnLeft() {
        robot?.turnLeft()
    }
    
    public func turnRight() {
        robot?.turnRight()
    }
    
    public func report() -> String? {
        print(table.report(with: robot))
        return robot?.report()
    }
}
