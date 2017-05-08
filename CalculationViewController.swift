//
//  CalculationViewController.swift
//  MortgageCalculator
//
//  Created by Gaurav Chodwadia on 5/4/17.
//  Copyright © 2017 Gaurav Chodwadia. All rights reserved.
//

import UIKit

class CalculationViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Properties
    
    
    @IBOutlet weak var PropertyPriceTextField: UITextField!
    @IBOutlet weak var DownPaymentTextField: UITextField!
    @IBOutlet weak var APRSlider: UISlider!
    @IBOutlet weak var APRValLabel: UILabel!
    @IBOutlet weak var LoanTermsSegments: UISegmentedControl!
    @IBOutlet weak var MPValLabel: UILabel!
    var property = Property()
    var currencyFormatter = NumberFormatter()
    override func viewDidLoad() {
        super.viewDidLoad()

        PropertyPriceTextField.delegate = self
        DownPaymentTextField.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: UITextFieldDelegates
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    
    @IBAction func sliderValueChange(_ sender: UISlider) {
        var currentValue = Float(sender.value)
        let y = Double(round(100*currentValue)/100)
        let apr = String(format: "%.2f", currentValue)
        APRValLabel.text = apr
        property.setAPR(apr: currencyFormatter.number(from: apr) as! Float)
        print(property)
    }
    
    @IBAction func getSelectedLoanTerm(_ sender: UISegmentedControl) {
        
        var selectedIndex = sender.selectedSegmentIndex
        if selectedIndex == 0{
            property.setTerm(term: 15)
        }else{
            property.setTerm(term: 30)
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: Actions
    
    @IBAction func CalculateMP(_ sender: Any) {
        calculateMonthlyPayment()
    }
    
    
    //MARK: Private Methods
    private func calculateMonthlyPayment(){
        
        property.setPropertyPrice(propPrice: currencyFormatter.number(from: PropertyPriceTextField.text!) as! Float)
        property.setDownPmtPrice(downPaymnt: currencyFormatter.number(from: DownPaymentTextField.text!) as! Float)
        
        let propPrice = property.getPropertyPrice()
        let downPmt = property.getDownPmt()
        let apr = property.getAPR()
        var term = property.getTerm()
        if term==0{
            term = 15
        }
        if downPmt < propPrice {
            var p = propPrice - downPmt
            var r = apr/1200
            var n = term * 12
            var calculate = p * r * pow((1+r),n)
            var calc = calculate / (pow((1+r),n)-1)
            let monthlyPmt = String(format: "%.2f", calc)
            property.setMonthlyPmt(monthlyPmt: currencyFormatter.number(from: monthlyPmt) as! Float)
            MPValLabel.text = "$" + monthlyPmt
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       // super.prepare(for: segue, sender: sender)
        print(segue.identifier)
        
        if let destinationViewController = segue.destination as? PropertyViewController {
            destinationViewController.property = self.property
        }        //controller.property = property
    }
    
    
}
