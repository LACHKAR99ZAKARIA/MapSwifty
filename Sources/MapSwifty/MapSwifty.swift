import SwiftUI
import MapKit

struct MapSwifty: UIViewRepresentable {
    let mapView = MKMapView()

    // MARK: Helpers
    func makeUIView(context: Context) -> MKMapView {
        mapView.delegate = context.coordinator
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
//        let zoomRange = MKMapView.CameraZoomRange(minCenterCoordinateDistance: 500, maxCenterCoordinateDistance: 20000)
//        mapView.cameraZoomRange = zoomRange
        mapView.mapType = .standard
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
    }

    func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(parent: self)
    }
}

extension MapSwifty {
    class MapCoordinator: NSObject, MKMapViewDelegate {
        let parent : MapSwifty
        var userLocationCoordinate : CLLocationCoordinate2D?
        var currentRegion: MKCoordinateRegion?
        var previousSelectedIndex: Int?
        init(parent: MapSwifty) {
            self.parent = parent
        }
        // MARK: Helpers
        // MARK: didUpdate userLocation
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        }
        // MARK: didUpdate region
        func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        }
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
        }
    }
}
