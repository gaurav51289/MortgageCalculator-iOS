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
    }
    
    
    //MARK: Private Methods
    private func calculateMonthlyPayment(){
        
    }

}
