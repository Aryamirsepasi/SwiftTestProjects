//
//  Untitled.swift
//  Apex Predators
//
//  Created by Arya Mirsepasi on 24.09.25.
//

import Foundation
import SwiftUI
import MapKit

enum APType: String, Decodable, CaseIterable, Identifiable {
    var id: APType { self }
    
    case all
    case land
    case air
    case sea
    
    var backgroundColor: Color {
        switch self {
        case .land:
            return Color.brown
        case .air:
            return Color.blue
        case .sea:
            return Color.cyan
        case .all:
            return Color.gray
        }
    }
    
    var icon: String {
        switch self{
            
        case .all:
            "square.stack.3d.up.fill"
        case .land:
            "leaf.fill"
        case .air:
            "wind"
        case .sea:
            "drop.fill"
        }
    }
        
}

struct ApexPredator: Decodable, Identifiable {
    let id: Int
    let name: String
    let type: APType
    let latitude: Double
    let longitude: Double
    let movies: [String]
    
    var image: String {
        name.lowercased().replacingOccurrences(of: " ", with: "")
    }
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    struct MovieScene: Decodable, Identifiable {
        let id: Int
        let movie: String
        let sceneDescription: String
    }
    

    
    let movieScenes: [MovieScene]
    let link: String
}
