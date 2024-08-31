struct ServiceDetailsItemModel: Hashable {
    let title: String
    let value: String
    let image: String?
    
    public init(
        title: String,
        value: String,
        image: String? = nil
    ) {
        self.title = title
        self.value = value
        self.image = image
    }
}
