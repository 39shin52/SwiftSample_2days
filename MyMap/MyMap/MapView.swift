//
//  MapView.swift
//  MyMap
//
//  Created by Itou Shingo on 2022/08/10.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    let searchKey: String
    let mapType: MKMapType
    let geoCoder = CLGeocoder()
    
    
    
    // MapViewの作成
    func makeUIView(context: Context) -> MKMapView {
        MKMapView()
    }
    // MapViewの更新、再描画
    func updateUIView(_ uiView: MKMapView, context: Context) {
//        print(searchKey)
        
        uiView.mapType = mapType
        
        geoCoder.geocodeAddressString(
            searchKey,
            completionHandler: {
            (placemarks, error) in
            if let unwrapPlacemarks = placemarks,
               let firstPlacemark = unwrapPlacemarks.first,
               let location = firstPlacemark.location {
                let targetCoordinate = location.coordinate
                print(targetCoordinate)
                
                let pin = MKPointAnnotation()
                
                pin.coordinate = targetCoordinate
                pin.title = searchKey
                uiView.addAnnotation(pin)
                uiView.region = MKCoordinateRegion(
                    center: targetCoordinate,
                    latitudinalMeters: 500.0,
                    longitudinalMeters: 500.0
                )
            }
        })
        
//        別の書き方
//        geoCoder.geocodeAddressString(
//            searchKey,
//            completionHandler: {
//                (placemarks, error) in
//                if let unwrapPkacemarks = placemarks {
//                    if let firtPlacemark = unwrapPkacemarks.first {
//                        if let location = firtPlacemark.location {
//                            let targetCoordinate = location.coordinate
//                            print(targetCoordinate)
//                        }
//                    }
//                }
//            })
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(searchKey: "東京タワー", mapType: .standard)
    }
}
