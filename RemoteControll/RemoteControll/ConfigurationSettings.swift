//
//  ConfigurationSettings.swift
//  RemoteControll
//
//  Created by Wisa Terhune on 3/3/20.
//  Copyright © 2020 Wisa Terhune. All rights reserved.
//

//import Foundation

import UIKit
class ConfigurationSettings: NSObject {
    
    private var id: Int
    private var configurationChannelLabel:String
    private var configurationChannelNumber: Int
  
    init(idIn:Int, configurationChannelNumberIn:Int,
         configurationChannelLabelIn: String){
        id  =  idIn
        configurationChannelLabel = configurationChannelLabelIn
        configurationChannelNumber = configurationChannelNumberIn
    }
    
    func getId()->Int{
        return  id
    }
    
    func setIdNum(idIn:Int){
        id  = idIn
    }
    
    func getconfigurationChannelNumber()->Int{
        return configurationChannelNumber
    }
    
    func setconfigurationChannelNumber(configurationChannelNumberIn:Int){
      configurationChannelNumber = configurationChannelNumberIn
    }
    
    func getconfigurationChannelLabel()->String{
        return  configurationChannelLabel
    }
    
    func setChannelLabel(configurationChannelLabelIn:String){
        configurationChannelLabel = configurationChannelLabelIn;
    }
    
    func savedChannel(funcObj: ConfigurationSettings, idIn: Int, configurationChannelNumberIn: Int, configurationChannelLabelIn: String){
        funcObj.id = idIn
        funcObj.configurationChannelNumber = configurationChannelNumberIn
        funcObj.configurationChannelLabel = configurationChannelLabelIn
    }
    
}


