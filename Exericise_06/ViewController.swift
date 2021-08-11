//
//  ViewController.swift
//  Exericise_06
//
//  Created by 白石裕幸 on 2021/08/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var numberLabel: UILabel!
    
    
    @IBOutlet var sliderObj: UISlider!
    
    private var sliderNum = Int()
    private var number = Int()
    
    private var arc4random:UInt32?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomsetUp()
       
     
        // Do any additional setup after loading the view.
    }
    
    //MARK:METHOds

    @IBAction func slider(_ sender: UISlider) {
        sliderNum = Int(sender.value)
        
    }
    
    @IBAction func judgementButton(_ sender: Any) {
        _result()
        
    }
    
    private func alert(title:String = "結果",message:String,okTitle:String = "再挑戦"){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAtion = UIAlertAction(title: okTitle, style: .default) { okAction in
            
            self.randomsetUp()
        }
        alert.addAction(okAtion)
        present(alert, animated: true, completion: nil)
        
    }
    
    private func _result(){
        if sliderNum == number{
            alert(message: "アタリ!\nあなたの値\(sliderNum)")
        }else{
            alert(message: "ハズレ!\nあなたの値\(sliderNum)")
        }
    }
    
    private func randomsetUp(){
        let ranNum = Int.random(in: 1...100)
        numberLabel.text = String(ranNum)
        number = ranNum
        sliderObj.value = 50.0
    }
    
    //arc4random_uniformVer
    private func ranNumSetup(){
        for _ in 1...100{
           arc4random = arc4random_uniform(100)
        }
        let nweArc4random = Int(arc4random!)
        numberLabel.text = String(nweArc4random)
        number = Int(arc4random!)
        sliderObj.value = 50.0
        print(number)

    }
    
    

}

