extension Sequence where Iterator.Element == Fighter {
    func filter(rate: Int, sortOption: FilteredValues.SortOptions, minimumPrice: Double, maximumPrice: Double) -> [Fighter] {
        filter { fighter in
            let fighterPrice = Double(fighter.price) ?? 0
            return (fighter.rate == rate) &&
            (fighterPrice >= minimumPrice) &&
            (fighterPrice <= maximumPrice)
        }.sorted { fighter1, fighter2 in
            switch sortOption {
            case .rate:
                return fighter1.rate > fighter2.rate
            case .ascending:
                return fighter1.name < fighter2.name
            case .descending:
                return fighter1.name > fighter2.name
            case .downloads:
                return fighter1.downloads > fighter2.downloads
            }
        }
    }
}
