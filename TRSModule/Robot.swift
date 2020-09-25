import Foundation

public protocol RobotProtocol: AnyObject {
    var position: Position { get }
    
    init(table: TableProtocol, direction: Direction, initialPosition: Position)
    
    func move()
    func turnLeft()
    func turnRight()
    func report() -> String
}

public final class Robot: RobotProtocol {
    //MARK: Internal variables
    
    var direction: Direction
    weak var table: TableProtocol?
    
    //MARK: Public variables
    
    public var position: Position
    
    //MARK: Initializers
    
    public init(table: TableProtocol, direction: Direction, initialPosition: Position) {
        self.table = table
        self.direction = direction
        position = initialPosition
    }
    
    //MARK: Public functions
    
    public func move() {
        let possibleNextPosition = position.nextPosition(from: direction)
        
        if table?.isPositionValid(possibleNextPosition) == true {
            position = possibleNextPosition
        }
    }
    
    public func turnLeft() {
        direction = direction.turnLeft()
    }
    
    public func turnRight() {
        direction = direction.turnRight()
    }
    
    public func report() -> String {
        "\(position.x),\(position.y),\(direction.rawValue.uppercased())"
    }
}
