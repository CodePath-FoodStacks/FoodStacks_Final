//
//  DetailViewController.swift
//  Yelpy
//
//  Created by Memo on 5/26/20.
//  Copyright © 2020 memo. All rights reserved.
//

import UIKit
import AlamofireImage
import MapKit
import Lottie
import SkeletonView

let annotation = MKPointAnnotation()

// NOTE: Once you go through the lab this error will dissapear
class RestaurantDetailViewController: UIViewController, MKMapViewDelegate, PostImageViewControllerDelegate {
    

    // ––––– TODO: Configure outlets
    // NOTE: Make sure to set images to "Content Mode: Aspect Fill" on the
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var starImage: UIImageView!
    @IBOutlet weak var reviewsLabel: UILabel!
    @IBOutlet weak var newRes: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    
    // LAB 6: Connect MapView + Add annotation view
    @IBOutlet weak var mapView: MKMapView!
    var annotationView: MKAnnotationView!

    var restaurantsArray: [Restaurant] = []
    let yelpRefresh = UIRefreshControl()
    
    // Initialize restaurant variable
    var r: Restaurant!
    
    //    var isClosed: Bool = false {
    //        didSet{
    //            if isClosed{
    //                hoursLabel.text = "Closed"
    //                hoursLabel.textColor = UIColor(red: 148/255, green: 23/255, blue: 147/255, alpha: 1)
    //            } else {
    //                hoursLabel.text = "Open Now"
    //                hoursLabel.textColor = UIColor(red: 66/255, green: 66/255, blue: 66/255, alpha: 1)
    //            }
    //        }
    //    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getAPIData()
        
        let latitude = r.coordinates["latitude"]!
        let longitude = r.coordinates["longitude"]!
        print("Hello, \(latitude)!")

        // 2) initialize coordinate point for restaurant
        let locationCoordinate = CLLocationCoordinate2DMake(CLLocationDegrees.init(latitude), CLLocationDegrees.init(longitude))

        // 3) initialize region object using restaurant's coordinates
        let restaurantRegion = MKCoordinateRegion(center: CLLocationCoordinate2DMake(latitude, longitude), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))

        // 4) set region in mapView to be that of restaurants
        mapView.setRegion(restaurantRegion, animated: true)
        
        
        configureOutlets()
        // 11) purposely wait until last minute to configure this to explain to students delegation!
        // step 10) is running the app
        mapView.delegate = self
    }
    
    
    @objc func getAPIData() {
       
        API.getRestaurants() { (restaurants) in
            guard let restaurants = restaurants else {
                return
            }
            
            self.restaurantsArray = restaurants
            //self.filteredRestaurants = restaurants
           // self.tableView.reloadData()
            
            // MARK: LAB6 Checking for coordinates
//            for rest in self.restaurantsArray {
//                 print("COORDINATES", rest.coordinates)
//             }
            
//            Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.stopAnimations), userInfo: nil, repeats: false)
        
            self.yelpRefresh.endRefreshing()
            
        }
    }

    // Add image to MapView Annotation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPostImageVC" {
            let postImageVC = segue.destination as! PostImageViewController
            // NOTE: PLEASE FOLLOW LAB BEFORE ASKING FOR HELP ON THIS
            postImageVC.delegate = self
        }
    }

    
    // ––––– LAB 6 TODO: Configure outlets :)
    func configureOutlets() {
        nameLabel.text = r.name
        reviewsLabel.text = String(r.reviews) + " reviews"
        starImage.image = Stars.dict[r.rating]! // LOOK AT THIS LINE
        headerImage.af.setImage(withURL: r.imageURL!)
        phoneNumberLabel.text = r.phone
        categoryLabel.text = r.mainCategory
        longitudeLabel.text = String(r.coordinates["longitude"]!)
        latitudeLabel.text = String(r.coordinates["latitude"]!)
        
        // Extra: Add tint opacity to image to make text stand out
        let tintView = UIView()
        tintView.backgroundColor = UIColor(white: 0, alpha: 0.3) //change to your liking
        tintView.frame = CGRect(x: 0, y: 0, width: headerImage.frame.width, height: 20/100)

        headerImage.addSubview(tintView)
        
        // MARK: Lab 6 set region for map to be coordinates of restaurant
        // 1) get longitude and latitude from coordinates property
        
        
        let latitude = r.coordinates["latitude"]!
        let longitude = r.coordinates["longitude"]!

        // 2) initialize coordinate point for restaurant
        let locationCoordinate = CLLocationCoordinate2DMake(CLLocationDegrees.init(latitude), CLLocationDegrees.init(longitude))

        // 3) initialize region object using restaurant's coordinates
        let restaurantRegion = MKCoordinateRegion(center: CLLocationCoordinate2DMake(latitude, longitude), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))

        // 4) set region in mapView to be that of restaurants
        mapView.setRegion(restaurantRegion, animated: true)
        
        // 5) instantiate annotation object to show pin on map
        //let annotation = MKPointAnnotation()

        // 6) set annotation's properties
        annotation.coordinate = locationCoordinate
        annotation.title = r.name
       

        // 7) drop pin on map using restaurant's coordinates
        mapView.addAnnotation(annotation)
        
        
    }
    
    // MARK: 8) Configure annotation view using protocol method
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        return mapView.dequeueReusableAnnotationView(withIdentifier: "removeMe")
        let reuseID = "myAnnotationView"
        print("mapView protocol called!")
        self.annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseID)
        if (annotationView == nil){
            // MARK: USE MKPinAnnotationView and NOT MKAnnotationView
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseID)
            annotationView?.canShowCallout = true

            // 9) Add info button to annotation view
            let annotationViewButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
            annotationViewButton.setImage(UIImage(named: "camera"), for: .normal)

            annotationView?.leftCalloutAccessoryView = annotationViewButton
        }
        return annotationView
    }
    
    // MARK: 12) action to execute when user taps annotation views accessory buttons
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        // 14) performSegue to PostImageVC
        self.performSegue(withIdentifier: "toPostImageVC", sender: nil)
        
    }
    
    // MARK: 19) Conform to PostImageViewDelegate protocol
    func imageSelected(controller: PostImageViewController, image: UIImage) {
        // 9) Add info button to annotation view
        let annotationViewButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        annotationViewButton.setImage(image, for: .normal)
        
        self.annotationView?.leftCalloutAccessoryView = annotationViewButton

    }
    
    
    
    
    
    // Unwind segue after user finishes uploading image for map annotation
    
    //var restaurantsArray: [Restaurant] = []
    
    @IBAction func randomize(_ sender: Any) {
        
        
        // 5) instantiate annotation object to show pin on map
        //let annotation = MKPointAnnotation()
        
        self.mapView.removeAnnotation(annotation)
        
        
        API.getRestaurants() { (restaurants) in
            guard let restaurants = restaurants else {
                return
            }
            
            let random = Int.random(in: 1..<15)
            
            
            self.restaurantsArray = restaurants
            
            self.nameLabel.text = self.restaurantsArray[random].name
            self.headerImage.af.setImage(withURL: self.restaurantsArray[random].imageURL!)
            self.starImage.image = Stars.dict[self.restaurantsArray[random].rating]!
            self.reviewsLabel.text = String(self.restaurantsArray[random].reviews) + " reviews"
            // do it here reviews
            self.phoneNumberLabel.text = String(self.restaurantsArray[random].phone)
            self.categoryLabel.text = String(self.restaurantsArray[random].mainCategory)
//            self.addressLabel.text = self.restaurantsArray[random].address
//            self.isClosed = restaurants[random].is_closed ?? false
            
            let latitude = self.restaurantsArray[random].coordinates["latitude"]!
            let longitude = self.restaurantsArray[random].coordinates["longitude"]!

            self.longitudeLabel.text = String(longitude)
            self.latitudeLabel.text = String(latitude)
            
            // 2) initialize coordinate point for restaurant
            let locationCoordinate = CLLocationCoordinate2DMake(CLLocationDegrees.init(latitude), CLLocationDegrees.init(longitude))

            // 3) initialize region object using restaurant's coordinates
            let restaurantRegion = MKCoordinateRegion(center: CLLocationCoordinate2DMake(latitude, longitude), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))

            // 4) set region in mapView to be that of restaurants
            self.mapView.setRegion(restaurantRegion, animated: true)
            
            // 6) set annotation's properties
            annotation.coordinate = locationCoordinate
            annotation.title = self.restaurantsArray[random].name

            // 7) drop pin on map using restaurant's coordinates
            self.mapView.addAnnotation(annotation)
            
            
            
            // MARK: 8) Configure annotation view using protocol method
            func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
                
                return mapView.dequeueReusableAnnotationView(withIdentifier: "removeMe")
                
            }
            
            // MARK: 12) action to execute when user taps annotation views accessory buttons
            func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
                // 14) performSegue to PostImageVC
                
            }
            
            // MARK: 19) Conform to PostImageViewDelegate protocol
            func imageSelected(controller: PostImageViewController, image: UIImage) {
                // 9) Add info button to annotation view
                let annotationViewButton = UIButton(frame: CGRect(x:0, y: 0, width: 50, height: 50))
                annotationViewButton.setImage(image, for: .normal)
                self.annotationView?.leftCalloutAccessoryView = annotationViewButton
            }
            
            
            // Unwind segue after user finishes uploading image for map annotation
//            @IBAction func unwind(_ seg: UIStoryboardSegue) {
//
//            }
        
    }

}
    
    @IBAction func onLogout(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("didLogout"), object: nil)
    }
}
