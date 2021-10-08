//
//  Stock.swift
//  AlertControllerExample
//
//  Created by Ashish Ashish on 10/7/21.
//

import Foundation
import RealmSwift

class Stock: Object {
    @objc dynamic var symbol : String = ""
    @objc dynamic var price : Float = 0.0
    @objc dynamic var volume : Int = 0
    
    override static func primaryKey() -> String? {
        return "symbol"
    }
}
