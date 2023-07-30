//
//  MapViewViewController.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 26/05/23.
//

import UIKit
import MapKit

class MapViewViewController: BaseViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak private var mapView: MKMapView!
        
    // MARK: Variables
    private enum CLConst {
        static let maxCenterCoordinateDistance = 5000.0
        static let topRect = 25.0
        static let leftRect = 25.0
        static let rightRect = 25.0
        static let bottomRect = 25.0
        static let renderLinewidth = 5.0
    }
    
    private enum Latitude {
        static let initialLatitude = 21.213337
        static let centerLatitude = 500.0
        static let sourceLatitude = 21.213337
        static let destinationLatitude = 21.23182311198691
        static let latitudeDelta = 0.05
    }
    
    private enum Longitude {
        static let initialLongitude = 72.890363
        static let centerLongitude = 500.0
        static let sourceLongitude = 72.890363
        static let destinationLongitude = 72.90418609028158
        static let longitudeDelta = 0.05
    }
    
    private let locationManager = CLLocationManager()

    private var initialLocation = CLLocation(latitude: Latitude.initialLatitude, longitude: Longitude.initialLongitude)
    
    // MARK: View Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    // MARK: SetUp Views
    private func setupViews() {
        mapView.delegate = self
        CLLocationHelper.shared.checkLocationServices(locationCompletionHandler: { [weak self] (location) in
            let coordinate = location?.coordinate
            let spanDegree = MKCoordinateSpan(latitudeDelta: Latitude.latitudeDelta, longitudeDelta: Longitude.longitudeDelta)
            let region = MKCoordinateRegion(center: coordinate ?? CLLocationCoordinate2D(), span: spanDegree)

            self?.mapView.setRegion(region, animated: true)
            self?.mapView.showsUserLocation = true

            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate ?? CLLocationCoordinate2D()
            annotation.title = "You Are Here"
            self?.mapView.addAnnotation(annotation)
        })
        centerLocation()
//        cameraBoundary()  // comment because of show in one screen both location
        addAnnotation()
        getDirections()
    }
    
    // displat current location center
    private func centerLocation() {
        let region = MKCoordinateRegion(center: initialLocation.coordinate, latitudinalMeters: Latitude.centerLatitude, longitudinalMeters: Longitude.centerLongitude)
        mapView.setRegion(region, animated: true)
    }
    
    // set camera zomm boundary
    private func cameraBoundary() {
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: CLConst.maxCenterCoordinateDistance)
        mapView.setCameraZoomRange(zoomRange, animated: true)
    }
    
    // add annotation for location
    private func addAnnotation() {
        let annotations = Location.locations.map { location -> MKAnnotation in
            let annotation = MKPointAnnotation()
            annotation.title = location.title
            annotation.coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
            return annotation
        }
        mapView.addAnnotations(annotations)
    }
    
    // get directions for source and destination
    private func getDirections() {
        let request = MKDirections.Request()
        
        let sourcePlaceMark = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: Latitude.sourceLatitude, longitude: Longitude.sourceLongitude))
        request.source = MKMapItem(placemark: sourcePlaceMark)
       
        let destPlaceMark = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: Latitude.destinationLatitude, longitude: Longitude.destinationLongitude))
        request.destination = MKMapItem(placemark: destPlaceMark)
        
        request.transportType = [.automobile, .walking]
        
        let directions = MKDirections(request: request)
        directions.calculate(completionHandler: { response, error in
            guard let response = response else { return }
            guard let route = response.routes.first else { return }
            self.mapView.addOverlay(route.polyline, level: .aboveRoads)
            
            let routeRect = route.polyline.boundingMapRect
            let routeRectPadding = self.mapView.mapRectThatFits(routeRect, edgePadding: UIEdgeInsets(top: CLConst.topRect, left: CLConst.leftRect, bottom: CLConst.bottomRect, right: CLConst.rightRect))
            self.mapView.setRegion(MKCoordinateRegion(routeRectPadding), animated: true)
        })
    }

}

// MARK: Extension MKMapViewDelegate
extension MapViewViewController: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !annotation.isKind(of: MKUserLocation.self) else {
            return nil
        }

        let annotationIdentifier = Constant.String.annotationIdentifier
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier)

        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            annotationView?.canShowCallout = true
        } else {
            annotationView?.annotation = annotation
        }

        annotationView!.image = UIImage(named: "tab1")
        return annotationView
    }

    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        print("Callout Accessory Control Tapped")
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = .blue
        renderer.lineWidth = CLConst.renderLinewidth
        return renderer
    }

}
