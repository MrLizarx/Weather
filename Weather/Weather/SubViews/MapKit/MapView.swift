//
//  MapView.swift
//  Weather
//
//  Created by Micle on 24.06.2021.
//
import MapKit
import SwiftUI



struct MapView: UIViewRepresentable {
    
    @Binding var centerCoordinate: CLLocationCoordinate2D
    var annotation:MKPointAnnotation
   
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }
    
    
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent:MapView
        init(_ parent:MapView) {
            self.parent = parent
        }
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            parent.centerCoordinate = mapView.centerCoordinate
        }
    }
    
    
    
    
    
    func updateUIView(_ view: MKMapView, context: Context) {
        
        let annotation = self.annotation
        view.removeAnnotations(view.annotations)
        view.addAnnotation(annotation)
    }
    
    
}

extension MKPointAnnotation {
    static var example: MKPointAnnotation {
        let annotation = MKPointAnnotation()
        annotation.title = "Zaporizhia"
        annotation.subtitle = "Sweet home"
        annotation.coordinate = CLLocationCoordinate2D(latitude: 47.8167, longitude: 35.1833)
        return annotation
    }
}



struct MapView_Previews:PreviewProvider {
    static var previews: some View {
        MapView(centerCoordinate: .constant(MKPointAnnotation.example.coordinate),annotation: MKPointAnnotation.example)
    }
}
