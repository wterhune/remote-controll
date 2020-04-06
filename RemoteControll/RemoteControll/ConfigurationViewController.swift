//
//  ConfigurationViewController.swift
//  RemoteControll
//
//  Created by Wisa Terhune on 3/1/20.
//  Copyright © 2020 Wisa Terhune. All rights reserved.
//

import UIKit

class ConfigurationViewController: UIViewController {
    
    @IBOutlet weak var Label: UITextField!
    
    @IBOutlet weak var Segment: UISegmentedControl!
    
    @IBOutlet weak var Stepper: UIStepper!
    
    @IBOutlet weak var ChannelDisplay: UILabel!
    
    @IBOutlet weak var Cancel: UIButton!
    
    @IBOutlet weak var Save: UIButton!
    
    var chosenChannel: ConfigurationSettings!
    var channelLabel: String = ""
    var currentChannel: Int = 0
    
    @IBAction func segmentedButtons(sender: UISegmentedControl) {
          let favoriteChannelInput = sender.selectedSegmentIndex
          switch (favoriteChannelInput) {
          case 0:
              chosenChannel = favoriteChannelOne
          case 1:
              chosenChannel = favoriteChannelTwo
          case 2:
              chosenChannel = favoriteChannelThree
          case 3:
              chosenChannel = favoriteChannelFour
          default:
              chosenChannel = favoriteChannelTwo
          }
      }
      
      @IBAction func stepper(sender: UIStepper) {
          sender.wraps = true
          sender.minimumValue = 1
          sender.maximumValue = 99
          ChannelDisplay.text = String(Int(sender.value))
      }
      
    @IBAction func save(sender: UIButton) {
        if (Label.text!.count < 1 || Label.text!.count > 4)  {
            let alertingMessage = UIAlertController(title: "Warning", message: "Label must be less than 4 characters", preferredStyle: UIAlertController.Style.alert)
            let alertActionToPress = UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil)
            alertingMessage.addAction(alertActionToPress)
            self.present(alertingMessage, animated: true, completion: nil)
            cancel()
            
        }else{
            switch (Segment.selectedSegmentIndex){
            case 0:
                favoriteChannelOne.setconfigurationChannelNumber(configurationChannelNumberIn: Int(ChannelDisplay.text!)!)
                favoriteChannelOne.setChannelLabel(configurationChannelLabelIn: String(Label.text!))
                break
            case 1:
                favoriteChannelTwo.setconfigurationChannelNumber(configurationChannelNumberIn: Int(ChannelDisplay.text!)!)
                favoriteChannelTwo.setChannelLabel(configurationChannelLabelIn: String(Label.text!))
                break
            case 2:
                favoriteChannelThree.setconfigurationChannelNumber(configurationChannelNumberIn: Int(ChannelDisplay.text!)!)
               favoriteChannelThree.setChannelLabel(configurationChannelLabelIn: String(Label.text!))
                break
            case 3:
                favoriteChannelFour.setconfigurationChannelNumber(configurationChannelNumberIn: Int(ChannelDisplay.text!)!)
                favoriteChannelFour.setChannelLabel(configurationChannelLabelIn: String(Label.text!))
                break;
            default: break
            }
        }
        
    }
      
      @IBAction func cancelButton(sender: UIButton) {
          cancel()
      }

    
    func cancel() {
        Label.text = ""
        Stepper.value = Stepper.minimumValue
        ChannelDisplay.text = "1"
        Segment.selectedSegmentIndex = 0
    }
    
  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

 
}
