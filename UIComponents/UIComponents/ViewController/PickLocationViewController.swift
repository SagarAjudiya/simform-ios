//
//  PickLocationViewController.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 27/05/23.
//

import UIKit
import MapKit

class PickLocationViewController: BaseViewController {

    // MARK: IBOutlets
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var locationPicker: UIPickerView!
    
    // MARK: Variables
    private enum Const {
        static let numberOfComponents = 2
        static let topRect = 25.0
        static let bottomRect = 25.0
        static let leftRect = 25.0
        static let rightRect = 25.0
        static let renderLinewidth = 5.0
    }
    
    // MARK: View Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    // MARK: SetUp Views
    private func setupViews() {
        CLLocationHelper.shared.checkLocationServices()
        mapView.delegate = self
        locationPicker.delegate = self
    }
    
}

// MARK: Extension PickLocationViewController
extension PickLocationViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        Const.numberOfComponents
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        Location.locations.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        Location.locations[row].title
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedSourceOption = Location.locations[pickerView.selectedRow(inComponent: 0)]
        let selectedDestinationOption = Location.locations[pickerView.selectedRow(inComponent: 1)]
        
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: selectedSourceOption.latitude, longitude: selectedSourceOption.longitude)))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: selectedDestinationOption.latitude, longitude: selectedDestinationOption.longitude)))
        request.transportType = [.walking, .automobile]
        
        let directions = MKDirections(request: request)
        directions.calculate { (response, error) in
            guard let response = response else { return }
            guard let route = response.routes.first else { return }
            
            self.mapView.removeOverlays(self.mapView.overlays)
            self.mapView.addOverlay(route.polyline)
            
            let routeRect = route.polyline.boundingMapRect
            let routeRectPadding = self.mapView.mapRectThatFits(routeRect, edgePadding: UIEdgeInsets(top: Const.topRect, left: Const.leftRect, bottom: Const.bottomRect, right: Const.rightRect))
            self.mapView.setRegion(MKCoordinateRegion(routeRectPadding), animated: true)
        }
    }
    
}

// MARK: Extension
extension PickLocationViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = .blue
        renderer.lineWidth = Const.renderLinewidth
        return renderer
    }
    
}


