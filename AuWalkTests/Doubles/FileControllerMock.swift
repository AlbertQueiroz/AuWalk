@testable import AuWalk
import Foundation

final class FileControllerMock: FileControllerProtocol {

    var createFileMock: Bool = false
    var updateFileMock: Bool = false
    var retrieveFileMock: Data?

    func createFile(with data: Data, name: String) -> Bool {
        createFileMock
    }
    
    func updateFile(at path: String, data: Data) -> Bool {
        updateFileMock
    }
    
    func retrieveFile(at path: String) -> Data? {
        retrieveFileMock
    }
}
