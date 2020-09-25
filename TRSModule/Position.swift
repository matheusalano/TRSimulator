import Foundation

public struct Position {
    var x: Int
    var y: Int
    
    public init(x: Int = 0, y: Int = 0) {
        self.x = x
        self.y = y
    }
}

extension Position {
    
    func nextPosition(from direction: Direction) -> Position {
        switch direction {
        case .north:
            return Position(x: x, y: y + 1)
        case .south:
            return Position(x: x, y: y - 1)
        case .east:
            return Position(x: x + 1, y: y)
        case .west:
            return Position(x: x - 1, y: y)
        }
    }
}
