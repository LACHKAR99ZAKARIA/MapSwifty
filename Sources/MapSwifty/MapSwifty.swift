import SwiftUI
import MapKit

@available(iOS 13.0, *)
class MapSettings: ObservableObject {
    @Published var mapType: MKMapType = .standard
}

@available(iOS 13.0, *)
public struct MapSwifty: UIViewRepresentable {
    @ObservedObject var mapSettings = MapSettings()

    var minZoom: Double?
    var maxZoom: Double?
    var userTrackingMode: MKUserTrackingMode
    var showsUserLocation: Bool
    var isRotateEnabled: Bool

    // MARK: Helpers
    public init(minZoom: Double? = nil, maxZoom: Double? = nil, userTrackingMode: MKUserTrackingMode = .none, showsUserLocation: Bool = false, isRotateEnabled: Bool = false) {
        self.minZoom = minZoom
        self.maxZoom = maxZoom
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

        mapView.mapType = mapSettings.mapType
        return mapView
    }

    public func updateUIView(_ uiView: MKMapView, context: Context) {
        if let oldMinZoom = context.coordinator.parent.minZoom,
           let oldMaxZoom = context.coordinator.parent.maxZoom,
           let newMinZoom = self.minZoom,
           let newMaxZoom = self.maxZoom,
           oldMinZoom.isEqual(to: newMinZoom),
           oldMaxZoom.isEqual(to: newMaxZoom),
           context.coordinator.parent.userTrackingMode == self.userTrackingMode,
           context.coordinator.parent.showsUserLocation == self.showsUserLocation,
           context.coordinator.parent.isRotateEnabled == self.isRotateEnabled,
           context.coordinator.parent.mapSettings.mapType == self.mapSettings.mapType {
            // Aucun changement dans les paramètres
            return
        }

        // Mettez à jour la vue avec les nouveaux paramètres
        uiView.isRotateEnabled = self.isRotateEnabled
        uiView.showsUserLocation = self.showsUserLocation
        uiView.userTrackingMode = self.userTrackingMode

        if let minZ = self.minZoom, let maxZ = self.maxZoom {
            let zoomRange = MKMapView.CameraZoomRange(minCenterCoordinateDistance: minZ, maxCenterCoordinateDistance: maxZ)
            uiView.cameraZoomRange = zoomRange
        }

        uiView.mapType = mapSettings.mapType

        // Mettez également à jour les propriétés de coordination si nécessaire
        context.coordinator.parent.minZoom = self.minZoom
        context.coordinator.parent.maxZoom = self.maxZoom
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


