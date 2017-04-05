//
//  oneRoompage.swift
//  Final306Project
//
//  Created by Paolo Garcia  on 2/1/17.
//  Copyright © 2017 PNGapps. All rights reserved.
//

import UIKit
import SwiftyJSON

class oneRoompage: UIViewController {
    
    
    @IBOutlet var roomName: UILabel!
    
    //switches for components
    @IBOutlet var switch1: UISwitch!
    @IBOutlet var switch2: UISwitch!
    @IBOutlet var switch3: UISwitch!
    @IBOutlet var switch4: UISwitch!
    @IBOutlet var switch5: UISwitch!
    
    //Label for components
    @IBOutlet var comp1: UILabel!
    @IBOutlet var comp2: UILabel!
    @IBOutlet var comp3: UILabel!
    @IBOutlet var comp4: UILabel!
    @IBOutlet var comp5: UILabel!
    
    
    //Consumption output
    @IBOutlet var output1: UILabel!
    @IBOutlet var output2: UILabel!
    @IBOutlet var output3: UILabel!
    @IBOutlet var output4: UILabel!
    @IBOutlet var output5: UILabel!
    
    var numberOfRows = 0
    var roomsArray = [[String]]()
    //DATA TEST
    var intPassed = Int()
    var emID = Int()
    @IBAction func defaultRoom(_ sender: Any) {
        
        switch1.setOn(false, animated: true)
        switch2.setOn(false, animated: true)
        switch3.setOn(false, animated: true)
        switch4.setOn(false, animated: true)
        switch5.setOn(false, animated: true)
       
        
        if (switch1.isOn) {
            roomsArray[intPassed][1] = "ON"
        } else {
            roomsArray[intPassed][1] = "OFF"
        }
        if (switch2.isOn) {
            roomsArray[intPassed][2] = "ON"
        } else {
            roomsArray[intPassed][2] = "OFF"
        }
        if (switch3.isOn) {
            roomsArray[intPassed][3] = "ON"
        } else {
            roomsArray[intPassed][3] = "OFF"
        }
        if (switch4.isOn) {
            roomsArray[intPassed][4] = "ON"
        } else {
            roomsArray[intPassed][4] = "OFF"
        }
        if (switch5.isOn) {
            roomsArray[intPassed][4] = "ON"
        } else {
            roomsArray[intPassed][4] = "OFF"
        }
    }
    
    @IBAction func submitDataButton(_ sender: Any) {
        let documentsDirectoryPathString = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let documentsDirectoryPath = NSURL(string: documentsDirectoryPathString)!
        
        var jsonFilePath = documentsDirectoryPath.appendingPathComponent("results.json")
        let fileManager = FileManager.default
        var isDirectory: ObjCBool = false
        
        // creating a .json file in the Documents folder
        if !fileManager.fileExists(atPath: (jsonFilePath?.absoluteString)!, isDirectory: &isDirectory) {
            let created = fileManager.createFile(atPath: (jsonFilePath?.absoluteString)!, contents: nil, attributes: nil)
            if created {
                print("File created ")
            } else {
                print("Couldn't create file for some reason")
            }
        } else {
            print("File already exists")
        }
        
        if (switch1.isOn) {
            roomsArray[intPassed][1] = "ON"
        } else {
            roomsArray[intPassed][1] = "OFF"
        }
        if (switch2.isOn) {
            roomsArray[intPassed][2] = "ON"
        } else {
            roomsArray[intPassed][2] = "OFF"
        }
        if (switch3.isOn) {
            roomsArray[intPassed][3] = "ON"
        } else {
            roomsArray[intPassed][3] = "OFF"
        }
        if (switch4.isOn) {
            roomsArray[intPassed][4] = "ON"
        } else {
            roomsArray[intPassed][4] = "OFF"
        }
        if (switch5.isOn) {
            roomsArray[intPassed][5] = "ON"
        } else {
            roomsArray[intPassed][5] = "OFF"
        }
        
        print(roomsArray)
        
        /* creating an array of test data
        var newRoomArray = [String]()
        for i in 0 ..< 100 {
            newRoomArray.append("Test\(i)")
        }*/
        
        // creating JSON out of the above array
        var jsonData: NSData!
        do {
            jsonData = try JSONSerialization.data(withJSONObject: roomsArray, options: JSONSerialization.WritingOptions()) as NSData!
            let jsonString = String(data: jsonData as Data, encoding: String.Encoding.utf8)
            NSLog(jsonString!)
        } catch let error as NSError {
            print("Array to JSON conversion failed: \(error.localizedDescription)")
        }
        
        // Write that JSON to the file created earlier
        jsonFilePath = documentsDirectoryPath.appendingPathComponent("results.json")
        do {
            let file = try FileHandle(forWritingTo: jsonFilePath!)
            file.write(jsonData as Data)
            print("JSON data was written to the file successfully!")
        } catch let error as NSError {
            print("Couldn't write to file: \(error.localizedDescription)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //DATA TEST
        NSLog("!!!!!!!!!!!!!!!!!!!!\(intPassed)")
        
        parseJSON()
    }
    
    func parseJSON() {
        let path : String = Bundle.main.path(forResource: "newResults", ofType: "json") as String!
        let roomData = NSData(contentsOfFile: path) as NSData!
        let readableJSON = JSON(data: roomData as! Data, options: JSONSerialization.ReadingOptions.mutableContainers, error: nil)
        
        numberOfRows = readableJSON[0].count
        print("???rows\(numberOfRows)")
        for row in 1...numberOfRows {
            var Room = "comp"
            Room += "\(row)"
            var counter = 0
            let id = readableJSON[counter][Room]["customer_id"].string as String!
            if (id == "\(emID)") {
                let arrayName = readableJSON[counter][Room]["room_name"].string as String!
                let array1 = readableJSON[counter][Room]["component_name"].string as String!
                let array2 = readableJSON[counter][Room]["component_status"].string as String!
                
                roomsArray.append([arrayName!, array1!, array2!])
            }
            counter += 1
        }
        
        NSLog("!!!!!room \(roomsArray)")
        
        roomName.text = roomsArray[intPassed][0]
        print("\(intPassed)")
        var counterComp = 0;
        if (roomsArray.count >= 1) {
            comp1.text = roomsArray[counterComp][1]
            if (roomsArray[counterComp][2] == "ON") {
                switch1.setOn(true, animated: true)
            } else {
                switch1.setOn(false, animated: true)
            }
            counterComp += 1
            if (roomsArray.count >= 2) {
                comp2.text = roomsArray[counterComp][1]
                if (roomsArray[counterComp][2] == "ON") {
                    switch2.setOn(true, animated: true)
                } else {
                    switch2.setOn(false, animated: true)
                }
                counterComp += 1
                if (roomsArray.count >= 3) {
                    comp3.text = roomsArray[counterComp][1]
                    if (roomsArray[counterComp][2] == "ON") {
                        switch3.setOn(true, animated: true)
                    } else {
                        switch3.setOn(false, animated: true)
                    }
                    counterComp += 1
                    if (roomsArray.count >= 4) {
                        comp4.text = roomsArray[counterComp][1]
                        if (roomsArray[counterComp][2] == "ON") {
                            switch4.setOn(true, animated: true)
                        } else {
                            switch4.setOn(false, animated: true)
                        }
                        counterComp += 1
                        if (roomsArray.count >= 5) {
                            comp5.text = roomsArray[counterComp][1]
                            if (roomsArray[counterComp][2] == "ON") {
                                switch5.setOn(true, animated: true)
                            } else {
                                switch5.setOn(false, animated: true)
                            }
                            counterComp += 1
                        }
                        else {
                            switch5.isHidden = true
                            comp5.isHidden = true
                            output5.isHidden = true
                        }
                    } else {
                        switch4.isHidden = true
                        switch5.isHidden = true
                        comp4.isHidden = true
                        comp5.isHidden = true
                        output4.isHidden = true
                        output5.isHidden = true
                    }
                    
                } else {
                    switch3.isHidden = true
                    switch4.isHidden = true
                    switch5.isHidden = true
                    comp3.isHidden = true
                    comp4.isHidden = true
                    comp5.isHidden = true
                    output3.isHidden = true
                    output4.isHidden = true
                    output5.isHidden = true
                }
            }else {
                switch2.isHidden = true
                switch3.isHidden = true
                switch4.isHidden = true
                switch5.isHidden = true
                comp2.isHidden = true
                comp3.isHidden = true
                comp4.isHidden = true
                comp5.isHidden = true
                output2.isHidden = true
                output3.isHidden = true
                output4.isHidden = true
                output5.isHidden = true
            }
        }
        
        /*
        if (roomsArray[intPassed][3] == "on") {
            switch3.setOn(true, animated: true)
        } else {
            switch3.setOn(false, animated: true)
        }
        if (roomsArray[intPassed][4] == "on") {
            switch4.setOn(true, animated: true)
        } else {
            switch4.setOn(false, animated: true)
        }
        if (roomsArray[intPassed][5] == "on") {
            switch5.setOn(true, animated: true)
        } else {
            switch5.setOn(false, animated: true)
        }
         */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
