//
//  ViewController.swift
//  RemoteControll
//
//  Created by Wisa Terhune on 2/9/20.
//  Copyright © 2020 Wisa Terhune. All rights reserved.
//

import UIKit

var favoriteChannelOne = ConfigurationSettings(idIn: 1, configurationChannelNumberIn: 20, configurationChannelLabelIn: "Disney")
var favoriteChannelTwo = ConfigurationSettings(idIn: 2, configurationChannelNumberIn: 25, configurationChannelLabelIn: "ABC")
var favoriteChannelThree = ConfigurationSettings(idIn: 3, configurationChannelNumberIn: 30, configurationChannelLabelIn: "PBS")
var favoriteChannelFour = ConfigurationSettings(idIn: 4, configurationChannelNumberIn: 35, configurationChannelLabelIn: "HBO")

class ViewController: UIViewController {
    
    @IBOutlet weak var zero: UIButton!
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var nine: UIButton!
    @IBOutlet weak var channelUp: UIButton!
    @IBOutlet weak var channelDown: UIButton!
    @IBOutlet weak var favChannels: UISegmentedControl!
    @IBOutlet weak var clearButton: UIButton!
    

    @IBOutlet weak var volumeDisplay: UILabel!
    @IBOutlet weak var powerDisplay: UILabel!
    @IBOutlet weak var channelDisplay: UILabel!
    
    @IBOutlet weak var powerSwitch: UISwitch!
    @IBOutlet weak var volumeSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
       }

    @IBAction func powerSwitch(_ sender: UISwitch) {
        powerDisplay.text = (sender.isOn ? "On" : "Off")
        powerSwitch.setOn(sender.isOn, animated: true)
        powerDisplay.text = "On"
        if sender.isOn == false {
            powerDisplay.text = "Off"
            volumeSlider.isEnabled = false
            zero.isEnabled = false
            one.isEnabled = false
            two.isEnabled = false
            three.isEnabled = false
            four.isEnabled = false
            five.isEnabled = false
            six.isEnabled = false
            seven.isEnabled = false
            eight.isEnabled = false
            nine.isEnabled = false
            channelDown.isEnabled = false
            channelUp.isEnabled = false
            favChannels.isEnabled = false
            clearButton.isEnabled = false
        }else{
            powerDisplay.text = "On"
            volumeSlider.isEnabled = true
            zero.isEnabled = true
            one.isEnabled = true
            two.isEnabled = true
            three.isEnabled = true
            four.isEnabled = true
            five.isEnabled = true
            six.isEnabled = true
            seven.isEnabled = true
            eight.isEnabled = true
            nine.isEnabled = true
            channelDown.isEnabled = true
            channelUp.isEnabled = true
            favChannels.isEnabled = true
            volumeDisplay.text = ""
            channelDisplay.text = ""
            clearButton.isEnabled = true
        }
    }
    

    @IBAction func volumeChanged(_ sender: UISlider) {
        volumeDisplay.text = "\(Int(sender.value))"
    }
    
    
    var channelArray = [String]()
    @IBAction func channelButtonPressed(_ sender: UIButton) {
        
        let channel: String = sender.currentTitle!

        if (channelArray.count == 0 || channelArray.count == 1)
        {
            channelArray.append(channel)
        }

        if (channelArray.count == 2)
        {
            let newChannel = channelArray[0] + channelArray[1]
            if newChannel == "00" {
                channelDisplay.text = ""
                channelArray.removeAll()
            } else {
                channelDisplay.text = newChannel
                channelArray.removeAll()
            }
        }
        else if (channelArray.count == 3)
        {
            channelDisplay.text = ""
            channelArray.removeAll()
        }
        
    }
    
    
    @IBAction func clearChannel(_ sender: UIButton) {
        channelArray.removeAll()
        channelDisplay.text = ""
        volumeDisplay.text = ""
        
    }
    
    @IBAction func addChannel(_ sender: UIButton) {
        let display = (Int)(channelDisplay.text!)
        if display! + 1 > 99 {
            channelArray.removeAll()
        }else{
            let addedChannel = display! + 1
            channelDisplay.text = "\(addedChannel)"
        }
        
    }
    

    @IBAction func subtractChannel(_ sender: UIButton) {
        let display = (Int)(channelDisplay.text!)
        if (display! - 1 < 1 || display! - 1 > 99){
            channelDisplay.text = "00"
            channelArray.removeAll()
        }else{
            let subtractedChannel = display! - 1
            channelDisplay.text = "\(subtractedChannel)"
        }
    }
    
    
    @IBAction func favChannelSelected(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            channelDisplay.text = "15"
        case 1:
            channelDisplay.text = "20"
        case 2:
            channelDisplay.text = "30"
        case 3:
            channelDisplay.text = "55"
        default:
            break
        }
    
    }
    
    @IBAction func FavoriteChannelSegment(_ sender:UISegmentedControl) {
        let configurationFavoriteChannel = sender.selectedSegmentIndex
        switch (configurationFavoriteChannel){
        case 0:
            channelDisplay.text = String(favoriteChannelOne.getconfigurationChannelNumber())
            break;
        case 1:
            channelDisplay.text = String(favoriteChannelTwo.getconfigurationChannelNumber())
            break;
        case 2:
            channelDisplay.text = String(favoriteChannelThree.getconfigurationChannelNumber())
            break;
        case 3:
            channelDisplay.text = String(favoriteChannelFour.getconfigurationChannelNumber())
            break;
        default:
            break
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
       favChannels.setTitle(favoriteChannelOne.getconfigurationChannelLabel(), forSegmentAt: 0)
       favChannels.setTitle(favoriteChannelTwo.getconfigurationChannelLabel(), forSegmentAt: 1)
       favChannels.setTitle(favoriteChannelThree.getconfigurationChannelLabel(), forSegmentAt: 2)
       favChannels.setTitle(favoriteChannelFour.getconfigurationChannelLabel(), forSegmentAt: 3)
    }
    

    
    
}


