import SwiftUI
import MapKit

public struct MapSwifty: UIViewRepresentable {
    public let mapView = MKMapView()

    // MARK: Helpers
    public func makeUIView(context: Context) -> MKMapView {
        mapView.delegate = context.coordinator
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        // let zoomRange = MKMapView.CameraZoomRange(minCenterCoordinateDistance: 500, maxCenterCoordinateDistance: 20000)
        // mapView.cameraZoomRange = zoomRange
        mapView.mapType = .standard
        return mapView
    }

    public func updateUIView(_ uiView: MKMapView, context: Context) {
    }

    public func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(parent: self)
    }
}

extension MapSwifty {
    public class MapCoordinator: NSObject, MKMapViewDelegate {
        public let parent : MapSwifty
        public var userLocationCoordinate : CLLocationCoordinate2D?
        public var currentRegion: MKCoordinateRegion?
        public var previousSelectedIndex: Int?
        public init(parent: MapSwifty) {
            self.parent = parent
        }
        // MARK: Helpers
        // MARK: didUpdate userLocation
        public func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        }
        // MARK: didUpdate region
        public func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        }
        public func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
        }
    }
}
