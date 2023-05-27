//
//  Location.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 27/05/23.
//

import CoreLocation

struct Location {
    
    // MARK: Variables
    let title: String
    let latitude: Double
    let longitude: Double
    
    static let locations = [
        Location(title: "Surat Central", latitude: 21.17166655418573, longitude: 72.83602523109121),
        Location(title: "D-Mart, Sarthana", latitude: 21.23182311198691, longitude: 72.90418609028158),
        Location(title: "Ahmedabad", latitude: 23.04303359583795, longitude: 72.56283750215869),
        Location(title: "Chicago, IL", latitude: 41.883229, longitude: -87.632398),
        Location(title: "New York, NY", latitude: 40.713054, longitude: -74.007228),
        Location(title: "Los Angeles, CA", latitude: 34.052238, longitude: -118.243344),
        Location(title: "My House", latitude: 21.213337, longitude: 72.890363),
    ]
    
}


