


import SwiftUI
import MapKit

let mapView = MKMapView(frame: UIScreen.main.bounds)

struct MapView: UIViewRepresentable {
    

  func makeUIView(context: Context) -> MKMapView {
    return mapView
  }

  func updateUIView(_ uiView: MKMapView, context: Context) {
  }

  // Acts as the MapView delegate
  class Coordinator: NSObject, MKMapViewDelegate {
    var parent: MapView

    init(_ parent: MapView) {
      self.parent = parent
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
      if overlay is MKPolygon {
        let polygonView = MKPolygonRenderer(overlay: overlay)
        polygonView.strokeColor = .magenta
        return polygonView
      }
      return MKOverlayRenderer()
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
      let annotationView = CategoryAnnotationView(annotation: annotation, reuseIdentifier: "Category")
      annotationView.canShowCallout = true
      return annotationView
    }
  }

  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }
}

struct ContentView: View {
    @State var mapBoundary = false
    @State var mapOverlay = false
    @State var mapPins = false
    @State var mapCharacterLocation = false
    @State var mapRoute = false
    @State var stateInformaton: [[String: String]]?
    @State var carbonLevelCommercial = "22.3"
    @State var carbonLevelIndustrial = "40.2"
    @State var carbonLevelResidential = "64.4"
    @State var carbonLevelTransportation = "80.3"
    @State var carbonLevelElectricPower = "100.8"
    
    
    var body: some View {
        NavigationView {
            MapView()
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarItems(leading:
            HStack {
                
                Button("TogglePins") {
                    self.mapPins.toggle()
                    self.updateMapOverlayViews()
                }
                .foregroundColor(mapPins ? .white : .red)
                .background(mapPins ? Color.green : Color.clear)

                
            }
        )
    }
  }

    func addOverlay() {
    // TODO: Implement
    }

    func addCateogoryPins() {
    // 1

        var stateInformationCalifornia = [
            ["name": "Commercial",
             "location": "{-35.259253,174.068681}",
             "type": "1",
             "subtitle": carbonLevelCommercial],
            ["name": "Industrial",
             "location": "{-35.259253,173.5}",
             "type": "1",
             "subtitle": carbonLevelIndustrial],
            ["name": "Residential",
             "location": "{-35.259253,173.3}",
             "type": "1",
             "subtitle": carbonLevelResidential],
            ["name": "Transportation",
             "location": "{-35.259253,174.2}",
             "type": "1",
             "subtitle": carbonLevelTransportation],
            ["name": "Electric Power",
             "location": "{-35.0,173.5}",
             "type": "1",
             "subtitle": carbonLevelElectricPower]
        ]
    
//        guard let categories = Category.plist("StateCoords") as?
//            [[String: String]] else { return }

        // 2
        
        NetworkManager().fetchPing { (pingdata) in
            print(pingdata.datetime)
//              DispatchQueue.main.async {
//                self?.tableView.reloadData()
//              }
        
            for category in stateInformationCalifornia {
                let coordinate: CLLocationCoordinate2D = Category.parseCoord(dict: category, fieldName: "location")
                let title: String = category["name"] as! String
                let typeRawValue: Int = 1
                let type: CategoryType = CategoryType(rawValue: typeRawValue) ?? .misc
                let subtitle: String = category["subtitle"]!
                // 3
                let annotation = CategoryAnnotation(coordinate: coordinate, title: title, subtitle: subtitle, type: type)
                
                mapView.addAnnotation(annotation)
            }
        }
    }

    func addRoute() {
    // TODO: Implement
    }

    func addBoundary() {
    // TODO: Implement
    }

    func addCharacterLocation() {
    // TODO: Implement
    }

    func updateMapOverlayViews() {
        mapView.removeAnnotations(mapView.annotations)
        mapView.removeOverlays(mapView.overlays)

        if mapBoundary { addBoundary() }
        if mapOverlay { addOverlay() }
        if mapPins { addCateogoryPins() }
        if mapCharacterLocation { addCharacterLocation() }
        if mapRoute { addRoute() }
    }
}


