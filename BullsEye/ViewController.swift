//
//  ViewController.swift
//  BullsEye
//
//  Created by Fadie on 10/12/2014.
//  Copyright (c) 2014 Fadie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert() {
        let alert = UIAlertController(title: "Hello World", message: "This is my first app!", preferredStyle: .ActionSheet)
        
        let action = UIAlertAction(title: "Awesome", style: .Default, handler: nil)
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(slide: UISlider) {
        println("The value of the slider is now: \(slide.value)")
    }
}

