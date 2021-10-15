//
//  FighterModelTests.swift
//  SmashFightersTests
//
//  Created by Allan Melo on 11/10/21.
//

import XCTest
@testable import SmashFighters

class FighterModelTests: XCTestCase {
    func testFilterFighters_WhenThereIsNoRestriction_ShouldReturnAllFighters() {
        let fighters: [Fighter] = [
            .fixture(name: "A"),
            .fixture(name: "B"),
            .fixture(name: "C")
        ]
        
        let filteredFighters = fighters.filter(
            rate: 5,
            sortOption: .ascending,
            minimumPrice: 0,
            maximumPrice: 1000
        )
        
        XCTAssertEqual(fighters, filteredFighters)
    }
    
    func testFilterFighters_WhenRateFilterExcludesOne_ShouldOnlyReturnsCorrectFighters() {
        let fighters: [Fighter] = [
            .fixture(name: "A", rate: 4),
            .fixture(name: "B", rate: 5),
            .fixture(name: "C", rate: 5)
        ]
        
        let filteredFighters = fighters.filter(
            rate: 5,
            sortOption: .ascending,
            minimumPrice: 0,
            maximumPrice: 1000
        )
        
        let expectedFighters: [Fighter] = [
            .fixture(name: "B", rate: 5),
            .fixture(name: "C", rate: 5)
        ]
        
        XCTAssertEqual(expectedFighters, filteredFighters)
    }
    
    func testFilterFighters_WhenPriceFilterExcludesTwo_ShouldOnlyReturnsTheCorrectFighter() {
        let fighters: [Fighter] = [
            .fixture(name: "A", price: "100"),
            .fixture(name: "B", price: "200"),
            .fixture(name: "C", price: "300")
        ]
        
        let filteredFighters = fighters.filter(
            rate: 5,
            sortOption: .ascending,
            minimumPrice: 199,
            maximumPrice: 201
        )
        
        let expectedFighters: [Fighter] = [
            .fixture(name: "B", price: "200")
        ]
        
        XCTAssertEqual(expectedFighters, filteredFighters)
    }
    
    func testFilterFighters_WhenOrderDescending_ShouldReturnsInCorrectOrder() {
        let fighters: [Fighter] = [
            .fixture(name: "A"),
            .fixture(name: "B"),
            .fixture(name: "C")
        ]
        
        let filteredFighters = fighters.filter(
            rate: 5,
            sortOption: .descending,
            minimumPrice: 0,
            maximumPrice: 1000
        )
        
        let expectedFighters: [Fighter] = [
            .fixture(name: "C"),
            .fixture(name: "B"),
            .fixture(name: "A")
        ]
        
        XCTAssertEqual(expectedFighters, filteredFighters)
    }
    
    func testFilterFighters_WhenOrderByDownloads_ShouldReturnsInCorrectOrder() {
        let fighters: [Fighter] = [
            .fixture(name: "A", downloads: "1"),
            .fixture(name: "B", downloads: "3"),
            .fixture(name: "C", downloads: "5")
        ]
        
        let filteredFighters = fighters.filter(
            rate: 5,
            sortOption: .downloads,
            minimumPrice: 0,
            maximumPrice: 1000
        )
        
        let expectedFighters: [Fighter] = [
            .fixture(name: "C", downloads: "5"),
            .fixture(name: "B", downloads: "3"),
            .fixture(name: "A", downloads: "1")
        ]
        
        XCTAssertEqual(expectedFighters, filteredFighters)
    }
    
    func testFilterFighters_WhenOrderByRate_ShouldReturnsInCorrectOrder() {
        let fighters: [Fighter] = [
            .fixture(name: "A", rate: 1),
            .fixture(name: "B", rate: 3),
            .fixture(name: "C", rate: 5)
        ]
        
        let filteredFighters = fighters.filter(
            rate: 5,
            sortOption: .rate,
            minimumPrice: 0,
            maximumPrice: 1000
        )
        
        let expectedFighters: [Fighter] = [
            .fixture(name: "C", rate: 5)
        ]
        
        XCTAssertEqual(expectedFighters, filteredFighters)
    }
    
}

extension Fighter {
    static func fixture(
        objectID: String = "",
        name: String = "",
        universe: String = "",
        price: String = "",
        popular: Bool = false,
        rate: Int = 5,
        downloads: String = "",
        description: String = "",
        createdAt: String = "",
        imageURL:String = ""
    ) -> Fighter {
        .init(
            objectID: objectID,
            name: name,
            universe: universe,
            price: price,
            popular: popular,
            rate: rate,
            downloads: downloads,
            description: description,
            createdAt: createdAt,
            imageURL: imageURL
        )
    }
}
