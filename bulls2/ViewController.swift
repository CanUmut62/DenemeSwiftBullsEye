//
//  ViewController.swift
//  bulls2
//
//  Created by Trakya6 on 4.03.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var slider : UISlider!
    @IBOutlet weak var lblTarget : UILabel!
    @IBOutlet weak var lblRound : UILabel!
    @IBOutlet weak var lblScore : UILabel!
    
    
    var currentValue : Int = 0
    var targetValue : Int = 0
    var score = 0
    var round = 0
    
    override func viewDidLoad() {
           super.viewDidLoad()
           print("View Did Loaded")
        
           sliderSettings()
           startNewRound()
           
       }
    
    func sliderSettings(){
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted" )!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top :0 ,left : 14 ,bottom: 0,right: 14)
        
        let trackLeftImage=UIImage(named: "SliderTrackLeft" )!
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage=UIImage(named: "SliderTrackRight" )!
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
        
        }
       
       func startNewRound(){
           targetValue  = 1 + Int(arc4random_uniform(100))
           currentValue = 50
           slider.value = Float(currentValue)
           round+=1
           updateLabels()
          
       }
       
       func updateLabels(){
           lblTarget.text="\(targetValue)"
           lblRound.text="\(round)"
           lblScore.text="\(score)"
           
       }

       
       @IBAction func showAlert(){
           let diff = abs(currentValue-targetValue)
           var point  = 100 - diff
           
           let title : String
           if (diff==0){
               point+=100
               title="Perfect!"
           }else if (diff<5){
               point+=50
               title="You almost done it"
           }else if (diff<10){
               title="Pretty good!"
           }else{
               title="Not even close..."
           }
           score+=point
           let message="You scored \(point) points"
           print(slider.value)
       
           let alert = UIAlertController(title:title,message: message,preferredStyle:.alert)
           let action = UIAlertAction(title: "OK", style: .default,handler: nil)
           alert.addAction(action)
           present(alert,animated: true,completion: nil)
           startNewRound()
       }
       @IBAction func test(){
           print("This is a test function")
       }
       
       @IBAction func sliderMoved (_ slider:UISlider){
           //print("The value of slider is now : \(slider.value)")
           currentValue = lroundf(slider.value)
       }
       
       
       
       
       
       
}

