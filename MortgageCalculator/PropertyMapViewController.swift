//
//  PropertyMapViewController.swift
//  MortgageCalculator
//
//  Created by Ekta Sorathia on 5/16/17.
//  Copyright © 2017 Gaurav Chodwadia. All rights reserved.
//

import UIKit
import MapKit

class PropertyMapViewController: UIViewController {
    var resultSearchController:UISearchController? = nil
    let locationManager = CLLocationManager()
    @IBOutlet weak var  mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let locationSearchTable = storyboard!.instantiateViewController(withIdentifier: "LocationSearchTableTableViewController") as! LocationSearchTableTableViewController
        resultSearchController = UISearchController(searchResultsController: locationSearchTable)
        resultSearchController?.searchResultsUpdater = locationSearchTable
        let searchBar = resultSearchController!.searchBar
        searchBar.sizeToFit()
        searchBar.placeholder = "Search for places"
        navigationItem.titleView = resultSearchController?.searchBar
        resultSearchController?.hidesNavigationBarDuringPresentation = false
        resultSearchController?.dimsBackgroundDuringPresentation = true
        definesPresentationContext = true
        locationSearchTable.mapView = mapView
        locationManager.delegate = self
        requestLocationAccess()
        if let savedProperty = loadProperties() {
            
            for i in 0 ..< savedProperty.count {
                var local_prop = savedProperty[i]
                let annotation = MKPointAnnotation()
                annotation.coordinate = CLLocationCoordinate2D(latitude: local_prop.latitude, longitude: local_prop.longitude)
                annotation.title = local_prop.address1
                mapView.addAnnotation(annotation)
            }
        }

        // Do any additional setup after loading the view.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
     
    */
    
    func requestLocationAccess() {
        let status = CLLocationManager.authorizationStatus()
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            return
            
        case .denied, .restricted:
            print("location access denied")
            
        default:
            locationManager.requestWhenInUseAuthorization()
        }
        
        
    }


}

extension PropertyMapViewController : CLLocationManagerDelegate {
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestLocation()
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let span = MKCoordinateSpanMake(0.05, 0.05)
            let region = MKCoordinateRegion(center: location.coordinate, span: span)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("error:: (error)")
    }
    
    func loadProperties() ->[Property]? {
        print(Property.ArchiveURL.path)
        
        return NSKeyedUnarchiver.unarchiveObject(withFile: Property.ArchiveURL.path) as? [Property]
        //return store!
    }
}
