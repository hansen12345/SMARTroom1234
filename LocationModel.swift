//
//  LocationModel.swift
//  Final306Project
//
//  Created by Alex Hansen on 4/4/17.
//  Copyright © 2017 PNGapps. All rights reserved.
//

import Foundation

class LocationModel: NSObject {
    
    var room: String?
    var custID: String?
    var roomID: String?
    var compName: String?
    var compStatus: String?
    
    override init() {
        
    }
    
    init(room: String, custID: String, roomID: String, compName: String, compStatus: String) {
        self.room = room
        self.custID = custID
        self.roomID = roomID
        self.compName = compName
        self.compStatus = compStatus
        
    }
    
    override var description: String {
        return "room: \(room), custID: \(custID), roomID: \(roomID), compName: \(compName), compStatus: \(compStatus)"
    }
    
    
}
