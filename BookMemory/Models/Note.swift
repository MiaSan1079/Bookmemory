import Foundation
import SwiftData

@Model
class Note: Identifiable {
    var title: String
    var content: String
    var createdAt: Date
    var imageData: Data?

    init(title: String, content: String, imageData: Data? = nil) {
        self.title = title
        self.content = content
        self.createdAt = Date()
        self.imageData = imageData
    }
}
