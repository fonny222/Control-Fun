//
//  ViewController.swift
//  Control Fun
//
//  Created by Christopher Fontana on 2/7/17.
//  Copyright © 2017 Christopher Fontana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var leftSwitch: UISwitch!
    @IBOutlet weak var rightSwitch: UISwitch!
    @IBOutlet weak var doSomethingButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderLabel.text = "50"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    /* This adds an action method to our controller class to give up control so that the
        keyboard will go away
     we had to select the text field then drag a line from "did end on exiting to this function
 */
    @IBAction func textFieldDoneEditing(sender: UITextField){
        sender.resignFirstResponder()
    }
    
    @IBAction func onTapGestureRecognized(_ sender: Any) {
        nameField.resignFirstResponder()
        numberField.resignFirstResponder()
    }
    
    // this is the slider action
    @IBAction func onSliderChanged(_ sender: UISlider) {
        sliderLabel.text = "\(lroundf(sender.value))"
    }


    @IBAction func onSwitchChanged(_ sender: UISwitch) {
        let setting = sender.isOn
        leftSwitch.setOn(setting, animated: true)
        rightSwitch.setOn(setting, animated: true)
    }
    
    
    @IBAction func toggleControls(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            // "switches is selected
            leftSwitch.isHidden = false
            rightSwitch.isHidden = false
            doSomethingButton.isHidden = true} else {
            leftSwitch.isHidden = true
            rightSwitch.isHidden = true
            doSomethingButton.isHidden = false
            }
    }
    
    
    
    @IBAction func onButtonPressed(_ sender: UIButton) {
        
        let controller = UIAlertController(title: "Are You Sure?", message:nil, preferredStyle: .actionSheet)
        
        let yesAction = UIAlertAction(title: "Yes I'm sure!", style: .destructive, handler: {action in
            let msg = self.nameField.text!.isEmpty
            ?"You can breathe easy, everything went OK."
            : "you can breath easy, \(self.nameField.text)," + "everything went OK."
            let controller2 = UIAlertController(title:"Something Was Done", message: msg,preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Phew!", style: .cancel, handler: nil)
            controller2.addAction(cancelAction)
            self.present(controller2,animated: true, completion: nil)
        })
        
        let noAction = UIAlertAction(title: "No way!", style: .cancel, handler: nil)
        
        controller.addAction(yesAction)
        controller.addAction(noAction)
        
        if let ppc = controller.popoverPresentationController {
            ppc.sourceView = sender
            ppc.sourceRect = sender.bounds
        }
        
        present(controller,animated: true, completion: nil)
    }
    
    
    
    
}

