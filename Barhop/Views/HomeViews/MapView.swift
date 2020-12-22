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
    var geopoints : [String : GeoPoint]
    
    func makeCoordinator() -> mapView.Coordinator {
        
        return mapView.Coordinator(parent1: self)
    }
    
    
    let map = MKMapView()
    let manager = CLLocationManager()
    
    func makeUIView(context: UIViewRepresentableContext<mapView>) -> MKMapView {
        
        manager.delegate = context.coordinator
        manager.startUpdatingLocation()
        map.showsUserLocation = true
        let center = CLLocationCoordinate2D(latitude: 29.883539, longitude: -97.939423)
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 1000, longitudinalMeters: 1000)
        map.region = region
        manager.requestWhenInUseAuthorization()
        return map
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<mapView>) {
        
        for i in geopoints {
            
            if i.key != name{
             
                let point = MKPointAnnotation()
                point.coordinate = CLLocationCoordinate2D(latitude: i.value.latitude, longitude: i.value.longitude)
                point.title = i.key
                uiView.removeAnnotations(uiView.annotations)
                uiView.addAnnotation(point)
            
            //basically global location sharing when new user enter the app that device location will be shared to all other devices connected to the app
                
            }

        }
        
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
            
            db.collection("locations").document("sharing").setData(["updates" : [self.parent.name :  GeoPoint(latitude: (last?.coordinate.latitude)!, longitude: (last?.coordinate.longitude)!)]], merge: true) { (err) in
                
                if err != nil {
                    
                    print((err?.localizedDescription)!)
                    return
                }
                print("success")
                
            }
        }
    }
}

class observer : ObservableObject {
    
    @Published var data = [String : Any]()
    
    init() {
        
        let db = Firestore.firestore()
        
        db.collection("locations").document("sharing").addSnapshotListener { (snap, err) in
            
            if err != nil {
                
                print((err?.localizedDescription)!)
                return
            }
        
            let updates = snap?.get("updates") as! [String : GeoPoint]
            
            self.data["data"] = updates
        }
    }
}


