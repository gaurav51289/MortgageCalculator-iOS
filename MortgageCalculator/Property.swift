//
//  Property.swift
//  MortgageCalculator
//
//  Created by Ekta Sorathia on 5/6/17.
//  Copyright © 2017 Gaurav Chodwadia. All rights reserved.
//

import Foundation

class Property{
    var propertyPrice: Float = 0.0
    var apr: Float = 0.0
    var term: Float = 0.0
    var monthlyPmt: Float = 0.0
    var downPymt: Float = 0.0
    
    var address1: String = ""
    var city: String = ""
    var state:String = ""
    var zip: String=""
    var latitude: Double=0
    var longitude: Double=0
    //var latitude: Double
    //var longitude: Double
    
    
    
   /* init(address: String, city: String, state: String, zipcode: String){
        self.address = address
        self.city = city
        self.state = state
        self.zipcode = zipcode
    }*/
    
    
    func setPropertyPrice(propPrice : Float){
        self.propertyPrice = propPrice
    }
    
    func setDownPmtPrice(downPaymnt : Float){
        self.downPymt = downPaymnt
    }
    
    func setAPR(apr : Float){
        self.apr = apr
    }
    
    func setTerm(term : Float){
        self.term = term
    }
    
    func setMonthlyPmt(monthlyPmt : Float){
        self.monthlyPmt = monthlyPmt
    }
    
    func getPropertyPrice() -> Float{
        return self.propertyPrice
    }
    
    func getDownPmt() -> Float{
        return self.downPymt
    }
    
    func getAPR() -> Float{
        return self.apr
    }
    
    func getTerm() -> Float{
        return self.term
    }
    
    func getMonthlyPmt() -> Float{
        return self.monthlyPmt
    }
    
    func setAddress(addr: String){
        self.address1 = addr
    }
    
    func setCity(city: String){
        self.city = city
    }
    
    func setState(state: String){
        self.state = state
    }
    
    func setZipCode(zip : String){
        self.zip = zip
    }
    
    func setLatitude(lat: Double){
        self.latitude = lat
    }
    
    func setLongitude(longitude: Double){
        self.longitude = longitude
    }
    
}
