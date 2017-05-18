//
//  Property.swift
//  MortgageCalculator
//
//  Created by Ekta Sorathia on 5/6/17.
//  Copyright © 2017 Gaurav Chodwadia. All rights reserved.
//

import Foundation

class Property: NSObject, NSCoding {
    var propertyPrice: Double = 0.0
    var apr: Double = 0.0
    var term: Double = 0.0
    var monthlyPmt: Double = 0.0
    var downPymt: Double = 0.0
    
    var address1: String = ""
    var city: String = ""
    var state:String = ""
    var zip: String=""
    var latitude: Double=0
    var longitude: Double=0
    
    override init(){
        
    }

    func setPropertyPrice(propPrice : Double){
        self.propertyPrice = propPrice
    }
    
    func setDownPmtPrice(downPaymnt : Double){
        self.downPymt = downPaymnt
    }
    
    func setAPR(apr : Double){
        self.apr = apr
    }
    
    func setTerm(term : Double){
        self.term = term
    }
    
    func setMonthlyPmt(monthlyPmt : Double){
        self.monthlyPmt = monthlyPmt
    }
    
    func getPropertyPrice() -> Double{
        return self.propertyPrice
    }
    
    func getDownPmt() -> Double{
        return self.downPymt
    }
    
    func getAPR() -> Double{
        return self.apr
    }
    
    func getTerm() -> Double{
        return self.term
    }
    
    func getMonthlyPmt() -> Double{
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
    
    func getAddress()->String{
        return self.address1
    }
    func getCity() -> String{
        return self.city
    }
    func getState() -> String{
        return self.state
    }
    func getZip() -> String{
        return self.zip
    }
    func getLatitude() -> Double{
        return self.latitude
    }
    func getLongitude() -> Double{
        return self.longitude
    }
    
    struct PropertyKey{
        static let propertyPrice = "propertyPrice"
        static let apr = "apr"
        static let term = "term"
        static let monthlyPmt = "monthlyPmt"
        static let downPmt = "downPmt"
        
        static let address1 = "address1"
        static let city = "city"
        static let state = "state"
        static let zip="zip"
        static let latitude="latitude"
        static let longitude="longitude"
    }
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("properties")
    
    init(propertyPrice: Double, apr: Double, term: Double, monthlyPmt: Double, downPmt: Double, address1: String?, city: String?, state: String?, zip: String?, latitude: Double?, longitude: Double?) {
        
        self.propertyPrice = propertyPrice
        self.apr = apr
        self.term = term
        self.downPymt = downPmt
        self.monthlyPmt = monthlyPmt
        self.address1 = address1!
        self.city = city!
        self.state = state!
        self.zip = zip!
        self.latitude = latitude!
        self.longitude = longitude!
        
    }
    
    
    
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(propertyPrice,forKey: PropertyKey.propertyPrice)
        aCoder.encode(apr, forKey: PropertyKey.apr)
        aCoder.encode(term, forKey: PropertyKey.term)
        aCoder.encode(monthlyPmt, forKey: PropertyKey.monthlyPmt)
        aCoder.encode(downPymt, forKey: PropertyKey.downPmt)
        aCoder.encode(address1, forKey: PropertyKey.address1)
        aCoder.encode(city, forKey: PropertyKey.city)
        aCoder.encode(state, forKey: PropertyKey.state)
        aCoder.encode(zip, forKey: PropertyKey.zip)
        aCoder.encode(latitude, forKey: PropertyKey.latitude)
        aCoder.encode(longitude,forKey: PropertyKey.longitude)
        
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        let propertyPrice = aDecoder.decodeDouble(forKey:PropertyKey.propertyPrice)
        let apr = aDecoder.decodeDouble(forKey: PropertyKey.apr)
        let term = aDecoder.decodeDouble(forKey: PropertyKey.term)
        let monthlyPmt = aDecoder.decodeDouble(forKey: PropertyKey.monthlyPmt)
        let downPmt = aDecoder.decodeDouble(forKey: PropertyKey.downPmt)
        let address1 = aDecoder.decodeObject(forKey: PropertyKey.address1) as? String
        let city = aDecoder.decodeObject(forKey: PropertyKey.city) as? String
        let state = aDecoder.decodeObject(forKey: PropertyKey.state) as? String
        let zip = aDecoder.decodeObject(forKey: PropertyKey.zip)
        let latitude = aDecoder.decodeDouble(forKey: PropertyKey.latitude)
        let longitude = aDecoder.decodeDouble(forKey: PropertyKey.longitude)
        
        self.init(propertyPrice: propertyPrice, apr: apr, term: term, monthlyPmt: monthlyPmt, downPmt:downPmt , address1: address1!,city:city!, state:state!, zip:zip as! String, latitude: latitude , longitude:longitude)
    }
    
}
