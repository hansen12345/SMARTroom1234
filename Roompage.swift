//
//  Roompage.swift
//  Final306Project
//
//  Created by Paolo Garcia  on 1/19/17.
//  Copyright © 2017 PNGapps. All rights reserved.
//

import UIKit
import SwiftyJSON

class RoomPage: UITableViewController {
    
    var numberOfRows = 0
    var roomsArray = [String]()
    var compareArray = [String]()
    var roomInt = Int()
    var roomInt2 = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        parseJSON()
    }
    
    func parseJSON() {
        let path : String = Bundle.main.path(forResource: "newResults", ofType: "json") as String!
        let roomData = NSData(contentsOfFile: path) as NSData!
        let readableJSON = JSON(data: roomData as! Data, options: JSONSerialization.ReadingOptions.mutableContainers, error: nil)
        
        numberOfRows = readableJSON[0].count
        roomInt2 = 1
        
        for i in 1...numberOfRows {
            
            var Room = "comp"
            var nextRoom = "comp"
            Room += "\(i)"
            nextRoom += "\(i+1)"
            
            var roomCount = 0
            
            let emID = readableJSON[roomCount][Room]["customer_id"].string as String!
            let hasComponents = readableJSON[roomCount][Room]["room_name"].string as String!
            
            //print("employee ID \(emID)")
            //print("ROOM Int 2 \(roomInt2)")
            
            if (emID == "\(roomInt2)") {
                roomInt = roomInt2
                let rooms = readableJSON[roomCount][Room]["room_name"].string as String!
                
                print("HEY \(rooms)")
                compareArray.append(rooms!)
                roomsArray.append(rooms!)
                /*
                if (hasComponents == compareArray[roomCount]) {
                    roomsArray.append(rooms!)
                }
                */
            }
            roomCount += 1
        }
        print("ROOMS FOR THE COMP\(roomsArray)")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return roomsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) 
        //print(indexPath.row)
        cell.textLabel?.text = roomsArray[indexPath.row]
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = tableView.indexPathForSelectedRow
        let index = indexPath?.row
        let myVC = segue.destination as! oneRoompage
        myVC.intPassed = index!
        myVC.emID = roomInt2
        NSLog("YO \(myVC.intPassed)")
        
    }

}
