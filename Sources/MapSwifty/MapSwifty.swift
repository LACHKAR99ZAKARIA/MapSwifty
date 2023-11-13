import SwiftUI
import MapKit

@available(iOS 13.0, *)
public struct MapSwifty: UIViewRepresentable {
    public let mapView = MKMapView()
    var minZoom: Double?
    var maxZoom: Double?

    // MARK: Helpers
    public init(minZoom: Double? = nil, maxZoom: Double? = nil) {
        self.minZoom = minZoom
        self.maxZoom = maxZoom
    }
    public func makeUIView(context: Context) -> MKMapView {
        mapView.delegate = context.coordinator
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        if let minZ = self.minZoom , let maxZ = self.maxZoom {
            let zoomRange = MKMapView.CameraZoomRange(minCenterCoordinateDistance: minZ, maxCenterCoordinateDistance: maxZ)
            mapView.cameraZoomRange = zoomRange
        }
        mapView.mapType = .standard
        return mapView
    }

    public func updateUIView(_ uiView: MKMapView, context: Context) {
    }

    public func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(parent: self)
    }
}

@available(iOS 13.0, *)
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
