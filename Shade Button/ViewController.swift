//
//  ViewController.swift
//  Shade Button
//
//  Created by Jacob Wittenauer on 3/5/15.
//  Copyright (c) 2015 Jacob Wittenauer. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    let fileURL:NSURL? = NSBundle.mainBundle().URLForResource("shade", withExtension: "mp3")
    var audioPlayer:AVAudioPlayer?

    @IBOutlet weak var shadeButton: UIButton!
    @IBOutlet weak var shadeLabel: UILabel!
    
    class Colors {
        let colorTop = UIColor(red: 255/255.0, green: 35/255.0, blue: 112/255.0, alpha: 1.0).CGColor
        let colorMid = UIColor(red: 180/255.0, green: 25/255.0, blue: 80/255.0, alpha: 1.0).CGColor
        let colorBottom = UIColor(red: 150/255.0, green: 21/255.0, blue: 67/255.0, alpha: 1.0).CGColor
        
        let gl: CAGradientLayer
        
        init() {
            gl = CAGradientLayer()
            gl.colors = [colorTop, colorMid, colorBottom]
            gl.locations = [ 0.0, 0.5, 1.0]
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let shadeSoundURL = fileURL {
            audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error: nil)
        }
        shadeButton.backgroundColor = UIColor.clearColor()//UIColor(red: 180/255.0, green: 25/255.0, blue: 80/255.0, alpha: 1.0)
        
        shadeButton.frame = CGRectMake(160, 100, 50, 50)
        shadeButton.layer.cornerRadius = 0.5 * shadeButton.bounds.size.width
        
        var backgroundLayer = Colors().gl
        backgroundLayer.frame = shadeButton.layer.bounds
        backgroundLayer.cornerRadius = 0.5 * shadeButton.bounds.size.width
        backgroundLayer.shadowColor = UIColor.blackColor().CGColor
        backgroundLayer.shadowOffset = CGSizeMake(5, 5)
        backgroundLayer.shadowRadius = 5
        backgroundLayer.shadowOpacity = 1.0
        
        shadeButton.layer.addSublayer(backgroundLayer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func shade(sender: UIButton) {
        self.shadeButton.transform = CGAffineTransformMakeScale(0.5, 0.5)
        UIView.animateWithDuration(2.7, delay:0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 8.0, options: .CurveLinear, animations:{
                self.shadeButton.transform = CGAffineTransformIdentity
        }, nil)
        

        if let shadePlayer = audioPlayer {
            shadePlayer.play()
        }
    }

}

