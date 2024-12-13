//
//  MapViewModel.swift
//  Object3
//
//  Created by Jeanpiere Laura on 10/12/24.
//

import Foundation
import Observation
import MapKit
import _MapKit_SwiftUI

@Observable
final class MapViewModel {
    
    var coordinates : CLLocationCoordinate2D
    var distance : Double
    
    var camera : MapCamera {
        MapCamera(centerCoordinate: coordinates, distance: distance)
    }
    
    var initialPosition : MapCameraPosition {
        MapCameraPosition.camera(camera)
    }
    
    init(coordinates: CLLocationCoordinate2D, distance: Double) {
        self.coordinates = coordinates
        self.distance = distance
    }
    
    
}
