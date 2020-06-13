//
//  MapView.swift
//  Barhop
//
//  Created by Zoe Schmitt on 1/30/20.
//  Copyright © 2020 Zoe Schmitt. All rights reserved.
//

import SwiftUI
import Mapbox
import Combine

extension MGLPointAnnotation {
    convenience init(title: String, coordinate: CLLocationCoordinate2D) {
        self.init()
        self.title = title
        self.coordinate = coordinate
    }
}

struct MapView: UIViewRepresentable {
    @Binding var annotations: [MGLPointAnnotation]
   

    private let mapView: MGLMapView = MGLMapView(frame: .zero, styleURL: URL(string: "mapbox://styles/zoeschmitt/ckb1eu1ye02v61imja1o6vjaj"))
    
    // MARK: - Configuring UIViewRepresentable protocol
    
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MGLMapView {
        
        mapView.delegate = context.coordinator
        return mapView
    }
    
    func updateUIView(_ uiView: MGLMapView, context: UIViewRepresentableContext<MapView>) {
        updateAnnotations()
    }
    
    func makeCoordinator() -> MapView.Coordinator {
        Coordinator(self)
    }
    
    // MARK: - Configuring MGLMapView
    
    func styleURL(_ styleURL: URL) -> MapView {
        mapView.styleURL = styleURL
        return self
    }
    
    func centerCoordinate(_ centerCoordinate: CLLocationCoordinate2D) -> MapView {
        mapView.centerCoordinate = centerCoordinate
        return self
    }

    func zoomLevel(_ zoomLevel: Double) -> MapView {
        mapView.zoomLevel = zoomLevel
       
        return self
    }
    
    
    
    private func updateAnnotations() {
        if let currentAnnotations = mapView.annotations {
            mapView.removeAnnotations(currentAnnotations)
        }
        mapView.addAnnotations(annotations)
    }
    
    // MARK: - Implementing MGLMapViewDelegate
    
    final class Coordinator: NSObject, MGLMapViewDelegate {
         @ObservedObject var store = DataStore()
        var control: MapView
        
        init(_ control: MapView) {
            self.control = control
        }
        
        func mapView(_ mapView: MGLMapView, didFinishLoading style: MGLStyle) {
            
            mapView.showsUserLocation = store.currentUser.showLocation
           
        }
        
        func mapView(_ mapView: MGLMapView, viewFor annotation: MGLAnnotation) -> MGLAnnotationView? {
            return nil
        }
         
        func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
            return true
        }
        
    }
    
}

