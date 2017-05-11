//
//  PropertyDAO.swift
//  MortgageCalculator
//
//  Created by Ekta Sorathia on 5/9/17.
//  Copyright © 2017 Gaurav Chodwadia. All rights reserved.
//

import Foundation
import os.log

class PropertyDAO : NSObject, NSCoding {
    
    var propertyPrice: Float
    var apr: Float
    var term: Float
    var monthlyPmt: Float
    var downPmt: Float
    
    var address1: String
    var city: String
    var state:String
    var zip: String
    var latitude: Double
    var longitude: Double
    
    
    
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
    
    init(propertyPrice: Float, apr: Float, term: Float, monthlyPmt: Float, downPmt: Float, address1: String, city: String, state: String, zip: String, latitude: Double, longitude: Double) {
        self.propertyPrice = propertyPrice
        self.apr = apr
        self.term = term
        self.downPmt = downPmt
        self.monthlyPmt = monthlyPmt
        self.address1 = address1
        self.city = city
        self.state = state
        self.zip = zip
        self.latitude = latitude
        self.longitude = longitude
        
    }
    
    
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(propertyPrice,forKey: PropertyKey.propertyPrice)
        aCoder.encode(apr, forKey: PropertyKey.apr)
        aCoder.encode(term, forKey: PropertyKey.term)
        aCoder.encode(monthlyPmt, forKey: PropertyKey.monthlyPmt)
        aCoder.encode(downPmt, forKey: PropertyKey.downPmt)
        aCoder.encode(address1, forKey: PropertyKey.address1)
        aCoder.encode(city, forKey: PropertyKey.city)
        aCoder.encode(state, forKey: PropertyKey.state)
        aCoder.encode(zip, forKey: PropertyKey.zip)
        aCoder.encode(latitude, forKey: PropertyKey.latitude)
        aCoder.encode(longitude,forKey: PropertyKey.longitude)
        
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        let propertyPrice = aDecoder.decodeDouble(forKey:PropertyKey.propertyPrice)
        let apr = aDecoder.decodeObject(forKey: PropertyKey.apr)
        let term = aDecoder.decodeObject(forKey: PropertyKey.term)
        let monthlyPmt = aDecoder.decodeObject(forKey: PropertyKey.monthlyPmt)
        let downPmt = aDecoder.decodeObject(forKey: PropertyKey.downPmt)
        let address1 = aDecoder.decodeObject(forKey: PropertyKey.address1)
        let city = aDecoder.decodeObject(forKey: PropertyKey.city)
        let state = aDecoder.decodeObject(forKey: PropertyKey.state)
        let zip = aDecoder.decodeObject(forKey: PropertyKey.zip)
        let latitude = aDecoder.decodeObject(forKey: PropertyKey.latitude)
        let longitude = aDecoder.decodeDouble(forKey: PropertyKey.longitude)
        
        self.init(propertyPrice: Float(propertyPrice), apr: apr as! Float, term: term as! Float, monthlyPmt: monthlyPmt as! Float, downPmt:downPmt as! Float, address1: address1 as! String,city:city as! String, state:state as! String, zip:zip as! String, latitude: latitude as! Double, longitude:longitude)
    }
}
