import SwiftUI
import MapKit

@available(iOS 13.0, *)
public struct MapSwifty: UIViewRepresentable {
    var minZoom: Double?
    var maxZoom: Double?
    var mapType: MKMapType
    var userTrackingMode: MKUserTrackingMode
    var showsUserLocation: Bool
    var isRotateEnabled: Bool

    // MARK: Helpers
    public init(minZoom: Double? = nil, maxZoom: Double? = nil, mapType: MKMapType = .standard, userTrackingMode: MKUserTrackingMode = .none, showsUserLocation: Bool = false, isRotateEnabled: Bool = false) {
        self.minZoom = minZoom
        self.maxZoom = maxZoom
        self.mapType = mapType
        self.userTrackingMode = userTrackingMode
        self.showsUserLocation = showsUserLocation
        self.isRotateEnabled = isRotateEnabled
    }

    public func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.isRotateEnabled = isRotateEnabled
        mapView.showsUserLocation = showsUserLocation
        mapView.userTrackingMode = userTrackingMode

        if let minZ = self.minZoom, let maxZ = self.maxZoom {
            let zoomRange = MKMapView.CameraZoomRange(minCenterCoordinateDistance: minZ, maxCenterCoordinateDistance: maxZ)
            mapView.cameraZoomRange = zoomRange
        }

        mapView.mapType = mapType
        return mapView
    }

    public func updateUIView(_ uiView: MKMapView, context: Context) {
        // Update the view if needed
    }

    public func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(parent: self)
    }
}

@available(iOS 13.0, *)
extension MapSwifty {
    public class MapCoordinator: NSObject, MKMapViewDelegate {
        public let parent: MapSwifty

        public init(parent: MapSwifty) {
            self.parent = parent
        }

        // MARK: Helpers
        // MARK: didUpdate userLocation
        public func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            // Implement as needed
        }

        // MARK: didUpdate region
        public func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
            // Implement as needed
        }

        public func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            // Implement as needed
        }
    }
}

