//
//  LevelSelectViewController.swift
//  DamIt
//
//  Created by kishanS on 10/8/20.
//

import UIKit
import CoreData

class LevelSelectViewController: UIViewController {

    
    var levelsCompleted : [Bool]!
    var levelData: [String]!
    
    var selectedLevelEncoding = ""
    var levelPack: Int!
    let segue: String = "gameSegue"
    
    @IBOutlet var buttons: [UIButton]!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Level Select"
        // hardcoded for now 
        if levelPack != 1 {
            buttons[0].isEnabled = false
            buttons[1].isEnabled = false
            buttons[2].isEnabled = false
        }
    }
    
//    func buttonSetup(){
//        var index = 0
//        for boolean in levelsCompleted {
//            buttons[index].isEnabled = boolean
//            index += 1
//        }
//    }
    
    @IBAction func levelButtonPressed(_ sender: Any) {
        let button = sender as! UIButton
        let tag = button.tag
        selectedLevelEncoding = levelData[tag]
        performSegue(withIdentifier: segue, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == self.segue) {
            let vc = segue.destination as! GameViewController
            vc.levelEncoding = selectedLevelEncoding
        }
    }
}
