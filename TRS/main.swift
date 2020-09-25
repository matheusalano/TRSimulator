import Foundation
import TRSModule

let simulator = Simulator<Robot, Table>(tableSize: 5)

enum InputSource: String {
    case file = "1", menu = "2"
}

func getInputSource() -> InputSource {
    print("Input source options:")
    print("1 - File")
    print("2 - Interactive menu")

    print("Enter the input's number:")
    guard
        let line = readLine(),
        let option = InputSource(rawValue: line) else { return getInputSource() }
    
    return option
}

func executeCommand(_ command: String) {
    if command.hasPrefix("PLACE") {
        let params = command.dropFirst("PLACE ".count).split(separator: ",").map({ String($0) })
        assert(params.count == 3)
        guard let x = Int(params[0]), let y = Int(params[1]), let dir = Direction(rawValue: params[2].lowercased()) else {
            print("Invalid command: \(command)")
            return
        }
        simulator.place(position: Position(x: x, y: y), direction: dir)
    } else {
        switch command {
        case "MOVE":
            simulator.move()
        case "LEFT":
            simulator.turnLeft()
        case "RIGHT":
            simulator.turnRight()
        case "REPORT":
            print(simulator.report() ?? "")
        default:
            print("Invalid command: \(command)")
        }
    }
}

func startFromFile() {
    print("Enter file's full path:")
    guard let path = readLine() else { return startFromFile() }
    
    let file = try! String(contentsOfFile: path, encoding: .utf8)
    let rows = file.components(separatedBy: "\n")
    
    for row in rows {
        executeCommand(row)
    }
}

func startFromMenu() {
    var input: String?
    
    repeat {
        print("Enter command (or 0 to exit):")
        input = readLine()
        if let command = input {
            executeCommand(command)
        }
    } while (input != "0");
}

let option = getInputSource()

switch option {
case .file:
    startFromFile()
case .menu:
    startFromMenu()
}
