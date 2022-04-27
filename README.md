# FoodStacks

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
iOS app to help users decide where to eat out.

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:Food/Restaurant**
- **Mobile:Yes**
- **Story:Useful app to food lover**
- **Market:Restaurant**
- **Habit:Eating**
- **Scope:Merced**

## Product Spec

### Build Progress
<img src="http://g.recordit.co/KmtsZEAY3O.gif">

### 1. User Stories

**Required Must-have Stories**

* -[ ] User home screen
   * -[x] Login/sign up
* -[x] Map display
    * -[x] Shows name/location of restaurants
    * -[ ] User's current location
* -[x] "Find Where to eat" button
    * -[x] Takes all restaurante within location range, and decides one to eat at
* -[ ] Location range
    * -[ ] Default range 10-15 miles from user location
* -[ ] Screen that displays decided place to eat
    * -[ ] Location
    * -[ ] Contact info
    * -[ ] Operating Hours

**Optional Nice-to-have Stories**

* -[ ] Information of Restuarants
    * -[ ] Operating Hours
    * -[ ] Photos
    * -[ ] Location
    * -[ ] Contact info
    * -[ ] Reviews(?)
        * -[ ] Likes
        * -[ ] Feedback
* -[ ] Filter Options
    * -[ ] Favorite/prefferred restaurrants
    * -[ ] Extend/limit location range
    * -[ ] Food categories
        * -[ ] Types of cuisine(i.e., American, Mexican, Asian, etc.)
        * -[ ] Price range
        * -[ ] Dining experience
            * -[ ] Fast food vs. dine-in
            * -[ ] Take-out options
* -[ ] Collaborative
    * -[ ] Several users contribute with filters
        * -[ ] Requires user creation/login

### 2. Screen Archetypes

* Loading Screen (Splash Page)
   * [list associated required story here]
   * a lauch screen with logo "FoodStacks"
* Login Screen (Login/Register)
   * list associated required story here
   * Request username and password 
* Find a Place Screen (Creation)
   * [list associated required story here]
   * button to generate a restaurant to go eat 
* Place Screen (Detail)
   * [list associated required story here]
   * having restaurant GPS and detail 
* Filter Screen (Creation)
   * list associated required story here
   * option to select the type of food and condition you want to eat 

*Shown in the sketch and wireframe

### 3. Navigation

**Tab Navigation** (Tab to Screen)
* the back symbol: allow users to go back to the previous page
* the three bar tab: will lead to the filter of your food option
* fill out your first tab: tab sign in will lead to the home screen to find restaurant button
* fill out your second tab: the selected restaurant pop up, which include the GPS location and store details
* fill out your third tab: click on the restaurant image that lead to the full detail

**Flow Navigation** (Screen to Screen)

* Loading Screen
   * Login Screen
* Login Screen
   * Find a Place Screen
* Find a Place Screen
   * Place Screen
   * Filter Screen
   * Login Screen
* Place Screen
   * Find a Place Screen
* Filter Screen
   * Find a Place Screen

*Shown in the GIF: http://g.recordit.co/WC6ZOyn2bB.gif
 

## Wireframes
<img src="https://i.imgur.com/Rm5TA3c.png" width=200><img src="https://i.imgur.com/j3ioINf.png" width=200><img src="https://i.imgur.com/pQlDxqg.png" width=200>
<img src="https://i.imgur.com/bRmoXNI.png" width=200><img src="https://i.imgur.com/NZfeZYm.png" width=200><img src="https://i.imgur.com/D1s3O56.png" width=200>

### [BONUS] Digital Wireframes & Mockups
Digital Wireframe: https://www.figma.com/file/XklBhdDw58CgKC8nIYOb9f/FoodStacks-Mockup?node-id=0%3A1


### [BONUS] Interactive Prototype
Interactive Prototype GIF: http://g.recordit.co/WC6ZOyn2bB.gif

## Schema 
### Models
| Property |  Type |Description |
| -------- | ------ | --------- |
|userId   |Pointer to User|For User Login/Logout|
|restId |String |Restaurant Name|
|restImage|File      |Photo of Restaurant Logo|
|restLocation|Pointer to API|Unique Location of Restaurant|
|userLocation|Pointer to API|Where the User is Currently|
|restContact|String|Written Restaurant Contact Information|
|restHours|String|Written Restaurant Hours Display|
|restAdress|String|The Written Address of Restaurant|
|tag/filter|String|Narrows Down Options of Restaurants|
|map|File/Pointer to API|Displays GPS Location|
|rangeFilter|Integer/Number|The Distance Range from User Location to All Available Restaurants|
|userPassword|Pointer to User|Secures the User Account|
### Networking
#### List of network requests by screen 
* Login Screen
   * Create/Post: User can create an account.  
```
  let user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text

        
        user.signUpInBackground{(success, error) in
            if success{
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            else{
                print("Error: \(error?.localizedDescription)")
            }
        }
```    
   * Read/Get: User can login/logout, receives user information.
```
let username = usernameField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            else{
                print("Error: \(error?.localizedDescription)")
            }
        }
```
    

//i just add for you but you should edit to make sure it match to our property name 
 
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let parseConfig = ParseClientConfiguration {
                    $0.applicationId = "Wd3jAu5MAM8qntnuejHbzreswChuxnQyKrVkg3ew" // <- UPDATE
                    $0.clientKey = "gynDLyTYaI6md59t3HCGprHQtnBmdJDMmfmQ12X6" // <- UPDATE
                    $0.server = "https://parseapi.back4app.com"
            }
            Parse.initialize(with: parseConfig)
            // --- end copy
        return true
    }
    
* Home Screen 
   * Read/Get: Retrieves location of user and location of restaurant.
   * Read/Get: Selects a random restaurant.
   
 
  
   Code: 
        
        let apikey = "gjSp5LrrEi9tJFLQALnw-RdZSRy-TLiJsfPM09LzFMNpMnmSHQZ2n2R_f3ptONYEalxMIudE9avxn_bQvvDZJc1zpPdfPDOvdh08RlT8vZGbqFx3dbtkuliMwATHXnYx"
        let url = URL(string: "https://api.yelp.com/v3/transactions/delivery/search?latitude=\(lat)&longitude=\(long)")!
        
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        
        request.setValue("Bearer \(apikey)", forHTTPHeaderField: "Authorization")
        
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                let restDict = dataDictionary["businesses"] as! [[String: Any]]
                
                let restaurants = restDict.map({ Restaurant.init(dict: $0) })
            
                return completion(restaurants)
                
                }
            } 
            task.resume()   
        
    
* Restaurant Information Screen
   * Read/Get: Restaurant contact, hours, address, and GPS

Code:

  

        var restaurant : [String:Any]!
        print(movie["restId"])
        
        restId.text = restaurant["restId"] as? String
        restId.sizeToFit()
        
        restHours.text = restaurant["hour"] as? String
        restHours.sizeToFit()
        
        restAddress.text = restaurant["address"] as? String
        restAddress.sizeToFit()
        
        restContact.text = restaurant["contact"] as? String
        restContact.sizeToFit()
        //get the restImage URL 
        ...
     
    }
    
* Filter Screen
   * Create/Post: Restaurant contact, hours, address, and GPS location
   * Read/Get: Range, type of restaurant, and cuisine types
   * Delete: Deletes/unfavorite restaurants
 
 ```
@IBAction func favoriteRestaurant(_ sender: Any) {
            let tobeFavorited = !favorited
            if(tobeFavorited) {
                RestaurantAPICaller.client?.favoriteRestaurant(restId: restId, success: {
                    self.setFavorite(true)
                }, failure: { (error) in
                    print("Favorite did not successed: \(error)")
                })
            } else {
                RestaurantAPICaller.client?.unfavoriteRestaurant(restId: restId, success: {
                    self.setFavorite(false)
                }, failure: { (error) in
                    print("Unfavorited did not succeed: \(error)")
                })
            }
        }
```


##### OPTIONAL: List endpoints if using existing API such as Yelp
* Google Maps API/MapKit

* Yelp API
   * Base URL- rs8INeaXGjCD5mlaCV1b865zxjzzbUMW-6qI0BMB-E2fIwSr484Sjnnk7H9_ozJaivyKlah76l5_fIJWJv1hBdiwWMTqlDwkTA54vaul7FeunnCqgiBugt0XNMpDYnYx

| HTTP Verb |  Endpoint |Description |
| -------- | ------ | --------- |
|  GET | /city|  get all resturant in the city range|
|  GET | /name|  get all restaurant name as restId|
|  GET | /address|  get all resturant in the region address|
