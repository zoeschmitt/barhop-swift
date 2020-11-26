//
//  Coordinator.swift
//  Barhop
//
//  Created by mac user on 8/25/20.
//  Copyright © 2020 Zoe Schmitt. All rights reserved.
//

import Foundation
import MapKit

final class Coordinator: NSObject, MKMapViewDelegate {
    
    var control: mapView
    
    init(_ control: mapView) {
        self.control = control
    }
    
    
    
}
