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

class RestaurantsViewController: UIViewController {
        
    // Outlets
    @IBOutlet weak var tableView: UITableView!
    var restaurantsArray: [Restaurant] = []
    
    @IBOutlet weak var mapView: MKMapView!

    var filteredRestaurants: [Restaurant] = []

    // Variable inits
    var animationView: AnimationView?
    var refresh = true
    
    let yelpRefresh = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startAnimations()
        // Table View
        tableView.visibleCells.forEach { $0.showSkeleton() }
        tableView.delegate = self
        tableView.dataSource = self
        
        // Search Bar delegate
        //searchBar.delegate = self
    
        // Get Data from API
        getAPIData()
        
        yelpRefresh.addTarget(self, action: #selector(getAPIData), for: .valueChanged)
        tableView.refreshControl = yelpRefresh
        
        let latitude = 34.052235
        let longitude = -118.243683
        
        let restaurantRegion = MKCoordinateRegion(center: CLLocationCoordinate2DMake(latitude, longitude), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))

        // 4) set region in mapView to be that of restaurants
        self.mapView.setRegion(restaurantRegion, animated: true)
    
    }
    
    

    @objc func getAPIData() {
       
        API.getRestaurants() { (restaurants) in
            guard let restaurants = restaurants else {
                return
            }
            
            self.restaurantsArray = restaurants
            self.filteredRestaurants = restaurants
            self.tableView.reloadData()
            
            // MARK: LAB6 Checking for coordinates
//            for rest in self.restaurantsArray {
//                 print("COORDINATES", rest.coordinates)
//             }
            
            Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.stopAnimations), userInfo: nil, repeats: false)
        
            self.yelpRefresh.endRefreshing()
            
        }
    }

    @IBAction func onLogout(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("didLogout"), object: nil)
    }
    
    
    

//    @IBAction func fetch(for segue: UIStoryboardSegue ,sender: Any) {
//
//    let fetchRandom = sender as! UIButton
//
//    self.performSegue(withIdentifier: "test1", sender: fetchRandom)
//
//        if segue.identifier == "test1" {
//
//        let random = Int.random(in: 1..<15)
//        let r = filteredRestaurants[random]
//                     let detailViewController = segue.destination as! RestaurantDetailViewController
//                     detailViewController.r = r
//
//        }
//
//
//
//    }
    
    

}





extension RestaurantsViewController: SkeletonTableViewDataSource {
    
    
    func startAnimations() {
        // Start Skeleton
        view.isSkeletonable = true
        
        animationView = .init(name: "4762-food-carousel")
        // Set the size to the frame
        //animationView!.frame = view.bounds
        animationView!.frame = CGRect(x: view.frame.width / 3 , y: 156, width: 100, height: 100)

        // fit the
        animationView!.contentMode = .scaleAspectFit
        view.addSubview(animationView!)
        
        // 4. Set animation loop mode
        animationView!.loopMode = .loop

        // Animation speed - Larger number = faste
        animationView!.animationSpeed = 5

        //  Play animation
        animationView!.play()
        
    }
    

    @objc func stopAnimations() {
        // ----- Stop Animation
        animationView?.stop()
        // ------ Change the subview to last and remove the current subview
        view.subviews.last?.removeFromSuperview()
        view.hideSkeleton()
        refresh = false
    }
    

    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "RestaurantCell"
    }
    
    
    
    
    
    
}

// ––––– TableView Functionality –––––
extension RestaurantsViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredRestaurants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create Restaurant Cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell") as! RestaurantCell
        // Set cell's restaurant
        cell.r = filteredRestaurants[indexPath.row]
        
        // Initialize skeleton view every time cell gets initialized
        cell.showSkeleton()
        
        // Stop animation after like .5 seconds
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { (timer) in
            cell.stopSkeletonAnimation()
            cell.hideSkeleton()
        }
        
        
        return cell
    }
    
    

    // ––––– TODO: Send restaurant object to DetailViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      let cell = sender as! UITableViewCell
      if let indexPath = tableView.indexPath(for: cell) {


            //let random = Int.random(in: 1..<15)


          let r = filteredRestaurants[indexPath.row]
            let detailViewController = segue.destination as! RestaurantDetailViewController
            detailViewController.r = r


    }

 }
}

// ––––– UI SearchBar Functionality –––––
extension RestaurantsViewController: UISearchBarDelegate {

    // Search bar functionality
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


    // Show Cancel button when typing
//    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
//       self.searchBar.showsCancelButton = true
//    }

    // Logic for searchBar cancel button
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//       searchBar.showsCancelButton = false // remove cancel button
//       searchBar.text = "" // reset search text
//       searchBar.resignFirstResponder() // remove keyboard
//       filteredRestaurants = restaurantsArray // reset results to display
//       tableView.reloadData()
//    }



}






