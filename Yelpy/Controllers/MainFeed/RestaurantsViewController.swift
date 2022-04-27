//
//  ViewController.swift
//  Yelpy
//
//  Created by Memo on 5/21/20.
//  Copyright © 2020 memo. All rights reserved.
//

import UIKit
import AlamofireImage
import Lottie
import SkeletonView
import MapKit

class RestaurantsViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapHome: MKMapView!
    var annotationView: MKAnnotationView!
    
    // Initialize restaurant variable
    var r: Restaurant!
    
        
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//
//        let latitude = r.coordinates["latitude"]!
//        let longitude = r.coordinates["longitude"]!
//
//        // 2) initialize coordinate point for restaurant
//        let locationCoordinate = CLLocationCoordinate2DMake(CLLocationDegrees.init(latitude), CLLocationDegrees.init(longitude))
//
//        // 3) initialize region object using restaurant's coordinates
//        let restaurantRegion = MKCoordinateRegion(center: CLLocationCoordinate2DMake(latitude, longitude), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
//
//        // 4) set region in mapView to be that of restaurants
//        mapHome.setRegion(restaurantRegion, animated: true)
//
//
//        configureOutlets()
//        // 11) purposely wait until last minute to configure this to explain to students delegation!
//        // step 10) is running the app
//        mapHome.delegate = self
//    }
//
//
//
//
//    // ––––– LAB 6 TODO: Configure outlets :)
//    func configureOutlets() {
//
//        let latitude = r.coordinates["latitude"]!
//        let longitude = r.coordinates["longitude"]!
//
//        // 2) initialize coordinate point for restaurant
//        let locationCoordinate = CLLocationCoordinate2DMake(CLLocationDegrees.init(latitude), CLLocationDegrees.init(longitude))
//
//        // 3) initialize region object using restaurant's coordinates
//        let restaurantRegion = MKCoordinateRegion(center: CLLocationCoordinate2DMake(latitude, longitude), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
//
//        // 4) set region in mapView to be that of restaurants
//        mapHome.setRegion(restaurantRegion, animated: true)
//
//        // 5) instantiate annotation object to show pin on map
//        let annotation = MKPointAnnotation()
//
//        // 6) set annotation's properties
//        annotation.coordinate = locationCoordinate
//        annotation.title = r.name
//
//
//        // 7) drop pin on map using restaurant's coordinates
//        mapHome.addAnnotation(annotation)
//
//
//    }
//
//
//    // Unwind segue after user finishes uploading image for map annotation
//
//    var restaurantsArray: [Restaurant] = []
//
//
}
