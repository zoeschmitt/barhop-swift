//
//  MapView.swift
//  Barhop
//
//  Created by Zoe Schmitt on 1/30/20.
//  Copyright © 2020 Zoe Schmitt. All rights reserved.
//

import SwiftUI
import Combine
import MapKit
import Firebase


struct mapView: UIViewRepresentable {
    
    var name = ""
    
    func makeCoordinator() -> mapView.Coordinator {
        
        return mapView.Coordinator(parent1: self)
    }
    
    
    let map = MKMapView()
    let manager = CLLocationManager()
    
    func makeUIView(context: UIViewRepresentableContext<mapView>) -> MKMapView {
        
        manager.delegate = context.coordinator
        manager.startUpdatingLocation()
        map.showsUserLocation = true
        manager.requestWhenInUseAuthorization()
        return map
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<mapView>) {
        
    }
    
    class Coordinator : NSObject, CLLocationManagerDelegate {
        
        var parent : mapView
        
        init(parent1 : mapView) {
            
            parent = parent1
        }
        
        func locationManagerDidPauseLocationUpdates(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            
            if status == .denied {
                
                print("Denied")
            }
            if status == .authorizedWhenInUse {
                
                print("Authorized")
            }
        }
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            
            let last = locations.last
            
            let db = Firestore.firestore()
            
            db.collection("locations").document("sharing").setData(["updates" : [self.parent.name :  GeoPoint(latitude: (last?.coordinate.latitude)!, longitude: (last?.coordinate.longitude)!)]]) { (err) in
                
                if err != nil {
                    
                    print((err?.localizedDescription)!)
                    return
                }
                print("success")
                
            }
        }
    }
    
}


