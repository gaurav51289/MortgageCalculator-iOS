//
//  PropertyViewController.swift
//  MortgageCalculator
//
//  Created by Ekta Sorathia on 5/7/17.
//  Copyright © 2017 Gaurav Chodwadia. All rights reserved.
//


import UIKit
import os.log
import MapKit

class PropertyViewController: UIViewController{
    
    @IBOutlet weak var isPropertySaved: UILabel!
    @IBOutlet weak var address2: UITextField!
    @IBOutlet weak var address1: UITextField!
    
    @IBOutlet weak var CityTextField: UITextField!
    @IBOutlet weak var SearchLocation: UISearchBar!
    var address: String = ""
    var city: String = ""
    var state: String=""
    var zip:String=""
    
    @IBOutlet weak var ZipTextField: UITextField!
    @IBOutlet weak var StateTextField: UITextField!
    var property: Property!
    weak var delegate: CalculationViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        //address2.delegate = self as! UITextFieldDelegate
        //address1.delegate=self as! UITextFieldDelegate
        //CityTextField.delegate=self as! UITextFieldDelegate
//StateTextField.delegate=self as! UITextFieldDelegate
        //ZipTextField.delegate=self as! UITextFieldDelegate
        print(property.apr)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveProperty(_ sender: Any) {
        if address1.text != ""  && CityTextField.text != "" && StateTextField.text != "" && ZipTextField.text != "" {
            let location = "\(address1.text) \(CityTextField.text) \(StateTextField.text) \(ZipTextField.text)"
            self.address = address1.text!
            self.city = CityTextField.text!
            self.state = StateTextField.text!
            self.zip = ZipTextField.text!
            var geocoder = CLGeocoder()
            geocoder.geocodeAddressString(location) { (placemarks, error) in
                // Process Response
                self.processResponse(withPlacemarks: placemarks, error: error)
            }
        }
    }
    
    private func processResponse(withPlacemarks placemarks: [CLPlacemark]?, error: Error?) {
        // Update View
        
        if let error = error {
            print("Unable to Forward Geocode Address (\(error))")
            var locationText = "Unable to Find Location for Address"
            
        } else {
            var location: CLLocation?
            
            if let placemarks = placemarks, placemarks.count > 0 {
                location = placemarks.first?.location
            }
            
            if let location = location {
                let coordinate = location.coordinate
                property.setAddress(addr: self.address)
                property.setCity(city: self.city)
                property.setState(state: self.state)
                property.setZipCode(zip: self.zip)
                property.setLatitude(lat: coordinate.latitude)
                property.setLongitude(longitude: coordinate.longitude)
                isPropertySaved.text="Property saved successfully!!!"
            } else {
                print("No Matching Location")
            }
        }
    }

    
   
}
