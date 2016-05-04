//
//  ReportViewController.swift
//  stephsApp
//
//  Created by Brady Peterson on 2/12/16.
//  Copyright © 2016 BJP. All rights reserved.
//

import UIKit

var report = [String]()
var departmentSelectionHTML: String?

class ReportCreatorViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var departmentPicker: UIPickerView!
    var departmentSelection: String?
    
    
    @IBOutlet weak var rewards: UITextField!
    
    @IBOutlet weak var comments: UITextField!
    
    @IBOutlet weak var tripDrivers: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    

    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    @IBOutlet weak var teachingTopicControler: UISegmentedControl!
    @IBOutlet weak var tenTenController: UISegmentedControl!
    @IBOutlet weak var redBookCompController: UISegmentedControl!
    
   
    var teachingTopicAns = "Yes"
    var tenTenAns = "Yes"
    var redBookCompAns = "Yes"
    var dateSubmit = ""
    
    
    var pickerData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Necessary when hitting the return key in the field
        self.rewards.delegate = self
        self.comments.delegate = self
        self.tripDrivers.delegate = self
        
        self.departmentPicker.delegate = self
        self.departmentPicker.dataSource = self
    
        //Add Data to departmentPicker
        pickerData = ["Jewelry | Watches", "Beauty", "Indi | Studio | Via C", "Accessories | Handbags | Sunglasses", "Men's Clothing | Furnishings", "Women's Shoes", "TBD | Dresses", "POV | Petites | Encore", "Men's Sportswear", "Men's Shoes", "Lingerie | Legwear | Women's Avtive", "Kidswear | Kid's Shoes", "YC | Trend"]
        
        //Dismisses Keyboad when tapped outside of keyboard
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
      
        //Date Picker Value
        
     
        
    }
    //When Submit Button is hit
    @IBAction func submit(sender: AnyObject) {
        
        // First we need to create a new instance of the NSDateFormatter
        let dateFormatter = NSDateFormatter()
        // Now we specify the display format, e.g. "27-08-2015
        dateFormatter.dateFormat = "MM-dd-YYYY"
        // Now we get the date from the UIDatePicker and convert it to a string
        let strDate = dateFormatter.stringFromDate(datePicker.date)
        // Finally we set the text of the label to our new string with the date
        dateSubmit = strDate
        
        report.append("Department: " + departmentSelection!  + " | Date: " + dateSubmit + " | Teaching Topic: " + teachingTopicAns + " | 10 - 10: " + tenTenAns + " | RedBook Completion: " + redBookCompAns + " | Rewards: " + rewards.text! + " | Comments: " + comments.text! + " | Trip Drivers: " + tripDrivers.text!)
        rewards.text = ""
        comments.text = ""
        tripDrivers.text = ""
        
   
        print(report)
        NSUserDefaults.standardUserDefaults().setObject(report, forKey: "report")
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Next Three Functions are Funcitons for Department Picker
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if( row == 0){
            departmentSelection = "Jewelry-Watches"
            departmentSelectionHTML = "<td><b>Department:</b> Jewelry-Watches</td>"
        }
        else if(row == 1){
            departmentSelection = "Beauty"
        }
        else if(row == 2){
            departmentSelection = "Indi-Studio-Via C"
        }
        else if(row == 3){
            departmentSelection = "Accessories-Handbags-Sunglasses"
        }
        else if(row == 4){
            departmentSelection = "Men's Clothing-Furnishings"
        }
        else if(row == 5){
            departmentSelection = "Women's Shoes"
        }
        else if(row == 6){
            departmentSelection = "TBD-Dresses"
        }
        else if(row == 7){
            departmentSelection = "POV-Petites-Encore"
        }
        else if(row == 8){
            departmentSelection = "Men's Sportswear"
        }
        else if(row == 9){
            departmentSelection = "Men's Shoes"
        }
        else if(row == 10){
            departmentSelection = "Lingerie-Legwear-Women's Avtive"
        }
        else if(row == 11){
            departmentSelection = "Kidswear-Kid's Shoes"
        }
        else if(row == 12){
            departmentSelection = "YC-Trend"
        }
        
        return pickerData[row]
    }
    //Dismisses Keyboard
    func DismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    //Dismisses Keyboard when return is hit
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
        
    }
    //Scroll Function
    override func viewWillLayoutSubviews(){
        super.viewWillLayoutSubviews()
        
        scrollView.contentSize = CGSizeMake(375, 870)
    }
    
    @IBAction func teachingTopic(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            teachingTopicAns = "Yes"
        }
        else if sender.selectedSegmentIndex == 1{
            teachingTopicAns = "No"
        }
    }
    
    
    @IBAction func tenTen(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            tenTenAns = "Yes"
        }
        else if sender.selectedSegmentIndex == 1{
            tenTenAns = "No"
        }
        
    }
   
    @IBAction func redBookComp(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            redBookCompAns = "Yes"
        }
        else if sender.selectedSegmentIndex == 1{
            redBookCompAns = "No"
        }
    }
    
   
    
}
