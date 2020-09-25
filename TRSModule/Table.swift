import Foundation

public protocol TableProtocol: AnyObject {
    init(size: Int)
    
    func isPositionValid(_ position: Position) -> Bool
    func report(with robot: RobotProtocol?) -> String
}

public final class Table: TableProtocol {
    //MARK: Internal constants
    
    let maxX: Int
    let maxY: Int
    
    //MARK: Initializers
    
    public init(size: Int) {
        maxX = size - 1
        maxY = size - 1
    }
    
    //MARK: Internal functions
    
    public func isPositionValid(_ position: Position) -> Bool {
        position.x >= 0 && position.x <= maxX &&
        position.y >= 0 && position.y <= maxY
    }
    
    public func report(with robot: RobotProtocol?) -> String {
        var map = ""
        
        for y in stride(from: maxY, to: -1, by: -1) {
            for x in 0...maxX {
                if let position = robot?.position {
                    if x == position.x && y == position.y {
                        map.append("R ")
                    } else {
                        map.append("_ ")
                    }
                } else {
                    map.append("_ ")
                }
            }
            map.append("\n")
        }
        
        return map
    }
}
