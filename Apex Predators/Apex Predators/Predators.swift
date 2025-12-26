//
//  Predators.swift
//  Apex Predators
//
//  Created by Arya Mirsepasi on 24.09.25.
//

import Foundation

class Predators {
    var allPredators: [ApexPredator] = []
    var apexPredators: [ApexPredator] = []
    
    init () {
        decodeApexPredatorData()
    }
    
    func decodeApexPredatorData() {
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                allPredators = try decoder.decode([ApexPredator].self, from: data)
                apexPredators = allPredators
                
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
    }
    
    func search(for searchTerm: String) -> [ApexPredator] {
        if searchTerm.isEmpty {
            return apexPredators
        } else {
            return apexPredators.filter {
                predator in
                predator.name.localizedCaseInsensitiveContains(searchTerm)
            }
        }
    }
    
    func sort( by alphabetical: Bool) {
        apexPredators.sort {
            predator1, predator2 in
            if alphabetical {
                return predator1.name < predator2.name
            } else {
                return predator1.id < predator2.id
            }
        }
    }
    
    func filter(by type: APType){
        if type == .all {
            apexPredators = allPredators
        } else {
            apexPredators = allPredators.filter{
                predator in
                predator.type == type
            }
        }
    }
}
