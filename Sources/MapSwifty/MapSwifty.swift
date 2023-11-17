import SwiftUI
import MapKit

@available(iOS 13.0, *)
public struct MapSwifty: UIViewRepresentable {
    @Binding var coordinates: [CLLocationCoordinate2D]?
    @Binding var userLocation: CLLocationCoordinate2D?
    var minZoom: Double?
    var maxZoom: Double?
    var userTrackingMode: MKUserTrackingMode
    var showsUserLocation: Bool
    var isRotateEnabled: Bool
    var mapType: MKMapType

    // MARK: Helpers
    public init(coordinates: Binding<[CLLocationCoordinate2D]?> = .constant(nil),
                userLocation: Binding<CLLocationCoordinate2D?> = .constant(nil),
                minZoom: Double? = nil,
                maxZoom: Double? = nil,
                userTrackingMode: MKUserTrackingMode = .none,
                showsUserLocation: Bool = false,
                isRotateEnabled: Bool = false,
                mapType: MKMapType = .standard) {
        self._coordinates = coordinates
        self._userLocation = userLocation
        self.minZoom = minZoom
        self.maxZoom = maxZoom
        self.userTrackingMode = userTrackingMode
        self.showsUserLocation = showsUserLocation
        self.isRotateEnabled = isRotateEnabled
        self.mapType = mapType
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

        // Add code to update map based on provided coordinates
        if let coordinates = self.coordinates {
            updateMap(with: coordinates, mapView: mapView)
        }

        return mapView
    }

    public func updateUIView(_ uiView: MKMapView, context: Context) {
        // Update other properties if needed
        uiView.isRotateEnabled = isRotateEnabled
        uiView.showsUserLocation = showsUserLocation
        uiView.userTrackingMode = userTrackingMode

        if let coordinates = self.coordinates {
            updateMap(with: coordinates, mapView: uiView)
        }

        // Update user location if provided
        if let userLocation = self.userLocation {
            uiView.setCenter(userLocation, animated: true)
        }
    }

    private func updateMap(with coordinates: [CLLocationCoordinate2D], mapView: MKMapView) {
        // Add code to update the map based on the provided coordinates
        // For example, you can add annotations or overlays
        mapView.removeAnnotations(mapView.annotations)
        let annotations = coordinates.map { coordinate in
            MKPointAnnotation(__coordinate: coordinate)
        }
        mapView.addAnnotations(annotations)
    }

    public func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(parent: self)
    }
}

@available(iOS 13.0, *)
extension MapSwifty {
    public class MapCoordinator: NSObject, MKMapViewDelegate {
        public var parent: MapSwifty

        public init(parent: MapSwifty) {
            self.parent = parent
        }

        // MARK: Implement MKMapViewDelegate methods as needed
    }
}




