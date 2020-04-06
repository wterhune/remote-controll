//
//  DVRViewController.swift
//  RemoteControll
//
//  Created by Wisa Terhune on 2/25/20.
//  Copyright © 2020 Wisa Terhune. All rights reserved.
//

import UIKit

class DVRViewController: UIViewController {

    
    @IBOutlet weak var DVRPowerStatus: UILabel!
    @IBOutlet weak var stateStatus: UILabel!
    
    @IBOutlet weak var play: UIButton!
    @IBOutlet weak var stop: UIButton!
    @IBOutlet weak var paused: UIButton!
    @IBOutlet weak var fastForward: UIButton!
    @IBOutlet weak var fastRewind: UIButton!
    @IBOutlet weak var record: UIButton!
    
    @IBOutlet weak var power: UISwitch!
    
    
    @IBAction func switchToTV(sender: UIBarButtonItem) {
              dismiss(animated: true, completion: nil)
          }
    
    @IBAction func playButton(_ sender: UIButton) {
        if (stateStatus.text != "Record"){
            stateStatus.text = "Play"
            paused.isEnabled = true
            fastForward.isEnabled = true
            fastRewind.isEnabled = true
        }else{
            popUpMessage(sender: sender, state: "Play")
        }
    }
    
    @IBAction func stopButton(_ sender: UIButton) {
        stateStatus.text = "Stop"
        
    }
    
    @IBAction func pausedButton(_ sender: UIButton) {
        if (stateStatus.text == "Play" && stateStatus.text != "Record"){
            stateStatus.text = "Pause"
        }else{
            popUpMessage(sender:sender, state:"Pause")
        }
    }
    
    
    @IBAction func fastRewindButton(_ sender: UIButton) {
        if(stateStatus.text == "Play" && stateStatus.text != "Record"){
            stateStatus.text = "Fast Rewind"
        }else{
            popUpMessage(sender:sender, state:"Fast Rewind")
        }
    }
    
    
    @IBAction func fastForwardButton(_ sender: UIButton) {
        if(stateStatus.text == "Play" && stateStatus.text != "Record"){
            stateStatus.text = "Fast Forward"
        }else{
            popUpMessage(sender:sender,state: "Forward")
        }
    }
    
    @IBAction func recordButton(_ sender: UIButton) {
        if(stateStatus.text == "Stop"){
            stateStatus.text = "Record"
        }else{
            popUpMessage(sender: sender, state: "Record")
        }
    }
    
    func forcedState(given: String){
        stateStatus.text = "Stop"
        stateStatus.text = given
    }
    
    func popUpMessage(sender: UIButton, state: String){
        let alert = UIAlertController(title: "Invalid Mode", message: "Cannot \(sender.currentTitle!) while \(stateStatus.text!)", preferredStyle: .alert)
        
        let alertForCancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        let alertForForce = UIAlertAction(title: "Force", style: .destructive, handler: {(action: UIAlertAction) in self.forcedState(given:state)})
        
        alert.addAction(alertForForce)
        alert.addAction(alertForCancel)
        
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func powerSwitch(_ sender: UISwitch) {
        DVRPowerStatus.text = (sender.isOn ? "On" : "Off")
        power.setOn(sender.isOn, animated: true)
        DVRPowerStatus.text = "On"
        if sender.isOn == false {
            DVRPowerStatus.text = "Off"
            stateStatus.text = ""
            play.isEnabled = false
            stop.isEnabled = false
            paused.isEnabled = false
            fastForward.isEnabled = false
            fastRewind.isEnabled = false
            record.isEnabled = false
        }else{
            DVRPowerStatus.text = "On"
            stateStatus.text = "Stop"
            play.isEnabled = true
            stop.isEnabled = true
            paused.isEnabled = true
            fastForward.isEnabled = true
            fastRewind.isEnabled = true
            record.isEnabled = true
            
    }

}
}
