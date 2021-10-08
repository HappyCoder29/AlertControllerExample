//
//  ViewController.swift
//  AlertControllerExample
//
//  Created by Ashish Ashish on 10/7/21.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    @IBOutlet weak var lblStock: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let stock = Stock()
        stock.symbol = "AMZN"
        stock.price = 3302.43
        stock.volume = 2311064
        
        do {
            let realm = try Realm()
            print(Realm.Configuration.defaultConfiguration.fileURL)
            try realm.write {
                realm.delete(stock)
            }
        }
        catch{
            print("Error in adding to database \(error)")
        }
        
        
        
        
    }

    @IBAction func addAlertController(_ sender: Any) {
        var globalTxtField: UITextField?
       
        let alertController = UIAlertController(title: "Add Stock Symbol", message: "Stock Symbol", preferredStyle: .alert)
        
        let OKButton = UIAlertAction(title: "OK", style: .default) { action in
            print(" I am inside OK Button")
            self.lblStock.text = globalTxtField?.text
            
        }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel) { action in
            print(" I am inside cancel button")
        }
        
        alertController.addAction(OKButton)
        alertController.addAction(cancelButton)
        
        alertController.addTextField { stockTextField in
            stockTextField.placeholder = "Stock Symbol"
            globalTxtField = stockTextField
            
        }
        
        self.present(alertController, animated: true, completion: nil)
        
        
        
    }
    
}

