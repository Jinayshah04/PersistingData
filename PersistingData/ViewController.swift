//
//  ViewController.swift
//  PersistingData
//
//  Created by mobile1 on 25/09/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUsrDefaults()
                
        writeToCD()
        // Do any additional setup after loading the view.
    }
    
    func setUsrDefaults() {
            savetoUsrDefault(key: "User", value: "John Appleseed")
            let str = readFromUsrDefault(key: "User")
            print(str)
            navigationItem.title = "Hello \(str)"
        }

        
        //  persist data using UserDefaults:
        func savetoUsrDefault(key: String, value: Any) {
            let defaults = UserDefaults.standard
            defaults.set(value, forKey: key)
            
        }
    
    func readFromUsrDefault(key: String) -> String {
            
            let defaults = UserDefaults.standard
            guard let retrivedData = defaults.string(forKey: key) else { return "" }
            return retrivedData
            	
        }
    
    func writeToCD() {
        let joke = JokeModel(id: 401, type: "general", setup: "What do elves post on Social Media?", punchLine: "Elf-ies.")
        CoreDataManager().addToCore(jokeObject: joke)
        }

}

