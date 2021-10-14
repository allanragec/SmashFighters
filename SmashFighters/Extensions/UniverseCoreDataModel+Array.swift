extension Sequence where Iterator.Element == UniverseCoreDataModel {
    func toModels() -> [Universe] {
        map {
            Universe(
                objectID: $0.id ?? "",
                name: $0.name ?? "",
                description: $0.desc ?? ""
            )
        }
    }
}
