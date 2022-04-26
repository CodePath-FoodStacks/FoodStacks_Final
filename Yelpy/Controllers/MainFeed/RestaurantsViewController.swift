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
    
    var r: Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
//        //configureOutlets()
//        // 11) purposely wait until last minute to configure this to explain to students delegation!
//        // step 10) is running the app
//        mapHome.delegate = self
    }
    
    // Add image to MapView Annotation
    

    
    // ––––– LAB 6 TODO: Configure outlets :)
//    func configureOutlets() {
//        nameLabel.text = r.name
//        reviewsLabel.text = String(r.reviews)
//        starImage.image = Stars.dict[r.rating]! // LOOK AT THIS LINE
//        headerImage.af.setImage(withURL: r.imageURL!)
//
//        // Extra: Add tint opacity to image to make text stand out
//        let tintView = UIView()
//        tintView.backgroundColor = UIColor(white: 0, alpha: 0.3) //change to your liking
//        tintView.frame = CGRect(x: 0, y: 0, width: headerImage.frame.width, height: 20/100)
//
//        headerImage.addSubview(tintView)
//
//        // MARK: Lab 6 set region for map to be coordinates of restaurant
//        // 1) get longitude and latitude from coordinates property
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
//        mapView.setRegion(restaurantRegion, animated: true)
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
//        mapView.addAnnotation(annotation)
//
//
//    }
    
//    // MARK: 8) Configure annotation view using protocol method
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//
//        return mapView.dequeueReusableAnnotationView(withIdentifier: "removeMe")
//
//    }
//
//    // MARK: 12) action to execute when user taps annotation views accessory buttons
//    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
//        // 14) performSegue to PostImageVC
//
//    }
//
//    // MARK: 19) Conform to PostImageViewDelegate protocol
//    func imageSelected(controller: PostImageViewController, image: UIImage) {
//        // 9) Add info button to annotation view
//        let annotationViewButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
//        annotationViewButton.setImage(image, for: .normal)
//
//        //self.annotationView?.leftCalloutAccessoryView = annotationViewButton
//
//    }
    

}
    
    
    
    
        
//    // Outlets
//    @IBOutlet weak var tableView: UITableView!
//    var restaurantsArray: [Restaurant] = []
//
//    @IBOutlet weak var searchBar: UISearchBar!
//    var filteredRestaurants: [Restaurant] = []
//
//    // Variable inits
//    var animationView: AnimationView?
//    var refresh = true
//
//    let yelpRefresh = UIRefreshControl()
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        startAnimations()
//        // Table View
//        tableView.visibleCells.forEach { $0.showSkeleton() }
//        tableView.delegate = self
//        tableView.dataSource = self
//
//        // Search Bar delegate
//        searchBar.delegate = self
//
//
//        // Get Data from API
//        getAPIData()
//
//        yelpRefresh.addTarget(self, action: #selector(getAPIData), for: .valueChanged)
//        tableView.refreshControl = yelpRefresh
//    }
//
//
//    @objc func getAPIData() {
//
//        API.getRestaurants() { (restaurants) in
//            guard let restaurants = restaurants else {
//                return
//            }
//
//            self.restaurantsArray = restaurants
//            self.filteredRestaurants = restaurants
//            self.tableView.reloadData()
//
//            // MARK: LAB6 Checking for coordinates
////            for rest in self.restaurantsArray {
////                 print("COORDINATES", rest.coordinates)
////             }
//
//            Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.stopAnimations), userInfo: nil, repeats: false)
//
//            self.yelpRefresh.endRefreshing()
//
//        }
//    }
//
//



//extension RestaurantsViewController: SkeletonTableViewDataSource {
//
//
//    func startAnimations() {
//        // Start Skeleton
//        view.isSkeletonable = true
//
//        animationView = .init(name: "4762-food-carousel")
//        // Set the size to the frame
//        //animationView!.frame = view.bounds
//        animationView!.frame = CGRect(x: view.frame.width / 3 , y: 156, width: 100, height: 100)
//
//        // fit the
//        animationView!.contentMode = .scaleAspectFit
//        view.addSubview(animationView!)
//
//        // 4. Set animation loop mode
//        animationView!.loopMode = .loop
//
//        // Animation speed - Larger number = faste
//        animationView!.animationSpeed = 5
//
//        //  Play animation
//        animationView!.play()
//
//    }
//
//
//    @objc func stopAnimations() {
//        // ----- Stop Animation
//        animationView?.stop()
//        // ------ Change the subview to last and remove the current subview
//        view.subviews.last?.removeFromSuperview()
//        view.hideSkeleton()
//        refresh = false
//    }
//
//
//    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
//        return "RestaurantCell"
//    }
//
//}
//
//// ––––– TableView Functionality –––––
//extension RestaurantsViewController: UITableViewDelegate, UITableViewDataSource {
//
//
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return filteredRestaurants.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        // Create Restaurant Cell
//        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell") as! RestaurantCell
//        // Set cell's restaurant
//        cell.r = filteredRestaurants[indexPath.row]
//
//        // Initialize skeleton view every time cell gets initialized
//        cell.showSkeleton()
//
//        // Stop animation after like .5 seconds
//        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { (timer) in
//            cell.stopSkeletonAnimation()
//            cell.hideSkeleton()
//        }
//
//
//        return cell
//    }
//
//
//    // ––––– TODO: Send restaurant object to DetailViewController
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let cell = sender as! UITableViewCell
//        if let indexPath = tableView.indexPath(for: cell) {
//            let r = filteredRestaurants[indexPath.row]
//            let detailViewController = segue.destination as! RestaurantDetailViewController
//            detailViewController.r = r
//        }
//
//    }
//
//}
//
//
//// ––––– UI SearchBar Functionality –––––
//extension RestaurantsViewController: UISearchBarDelegate {
//
//    // Search bar functionality
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        if searchText != "" {
//            filteredRestaurants = restaurantsArray.filter { (r: Restaurant) -> Bool in
//              return r.name.lowercased().contains(searchText.lowercased())
//            }
//        }
//        else {
//            filteredRestaurants = restaurantsArray
//        }
//        tableView.reloadData()
//    }
//
//
//    // Show Cancel button when typing
//    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
//       self.searchBar.showsCancelButton = true
//    }
//
//    // Logic for searchBar cancel button
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//       searchBar.showsCancelButton = false // remove cancel button
//       searchBar.text = "" // reset search text
//       searchBar.resignFirstResponder() // remove keyboard
//       filteredRestaurants = restaurantsArray // reset results to display
//       tableView.reloadData()
//    }
//
//
//
//}
//
//
//
//
//
