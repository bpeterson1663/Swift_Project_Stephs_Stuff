//
//  ReportTableViewController.swift
//  stephsApp
//
//  Created by Brady Peterson on 2/12/16.
//  Copyright © 2016 BJP. All rights reserved.
//

import UIKit
import MessageUI

class ReportTableViewController: UITableViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var reportList: UITableView!
  
   
 
    override func viewDidLoad() {
        super.viewDidLoad()
                if NSUserDefaults.standardUserDefaults().objectForKey("report") != nil {
            
            report = NSUserDefaults.standardUserDefaults().objectForKey("report") as! [String]
            
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return report.count
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = report[indexPath.row]
        
        cell.textLabel?.numberOfLines = 0;
       
        
        
        //cell.textLabel?.LineBreakMode = UILineBreakMode.WordWrap;
        
        return cell
        
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            
            report.removeAtIndex(indexPath.row)
            
            NSUserDefaults.standardUserDefaults().setObject(report, forKey: "report")
            
           reportList.reloadData()
        }
        
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        reportList.reloadData()
        
    }
    
 
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
     
    
    @IBAction func sendEmail(sender: AnyObject) {
        
        sendEmail()
        
        
    }
    
    
    func sendEmail() {
        let testingHTML = report.joinWithSeparator("</tr></td><tr><td>")
        
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["stephanie.e.johnson@nordstrom.com"])
            mail.setMessageBody("<table><tr><td>" + testingHTML + "</tr></td></table>", isHTML: true)
            
            presentViewController(mail, animated: true, completion: nil)
        } else {
            // show failure alert
        }
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
}
