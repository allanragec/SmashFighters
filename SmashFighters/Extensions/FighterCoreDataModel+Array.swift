extension Sequence where Iterator.Element == FighterCoreDataModel {
    func toModels() -> [Fighter] {
        map {
            Fighter(
                objectID: $0.id ?? "",
                name: $0.name ?? "",
                universe: $0.universe ?? "",
                price: $0.price ?? "",
                popular: $0.popular,
                rate: Int($0.rate),
                downloads: $0.downloads ?? "",
                description: $0.desc ?? "",
                createdAt: $0.createdAt ?? "",
                imageURL: $0.imageURL ?? ""
            )
        }
    }
}
