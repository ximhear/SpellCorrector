//
//  ViewController.swift
//  SpellCorrectorSample
//
//  Created by gadotori on 14/11/2016.
//  Copyright © 2016 gadotori. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var outputText: UILabel!
    
    var checker : SpellCorrector?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = Bundle.main.url(forResource: "big", withExtension: "txt")!
        self.checker = SpellCorrector(contentsOfFile: url.absoluteString)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func correctClicked(_ sender: Any) {
        
        guard let checker = self.checker else {
            return
        }
        
        guard let text = inputText.text, text.characters.count > 0 else {
            return
        }
        
        let v = checker.correct(word: text)
        outputText.text = v
    }

}

