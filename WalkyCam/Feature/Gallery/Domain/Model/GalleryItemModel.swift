import Foundation

struct GalleryItemModel: Hashable {
    let id: String
    let tag: FileTag
    let status: FileStatus
    let basePath: String
    let viewPath: String
    let creationDate: Date
    
    public init(
        id: String,
        tag: FileTag,
        status: FileStatus,
        basePath: String,
        viewPath: String,
        creationDate: Date
    ) {
        self.id = id
        self.tag = tag
        self.status = status
        self.basePath = basePath
        self.viewPath = viewPath
        self.creationDate = creationDate
    }
    
    public enum FileStatus: String {
        case active = "active"
        case inactive = "inactive"
    }
    
    public enum FileTag: String {
        case model = "3d model"
        case image = "image"
        case video = "video"
    }
    
    public enum FileType: String {
        case obj
        case jpg
        case png
        case stl
        case unkwown
    }
}
