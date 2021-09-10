//
//  ViewController.swift
//  Exericise_06
//
//  Created by 白石裕幸 on 2021/08/11.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private var questionLabel: UILabel!
    @IBOutlet private var slider: UISlider!
    private var sliderNum = 0
    private var questionNumber = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        questionNumberSetUp()
    }

    // MARK: METHOds

    @IBAction private func judgementButton(_ sender: Any) {
        judgment()
    }

    private func alert(alertMessage: String) {
        let alert = UIAlertController(title: "結果", message: alertMessage, preferredStyle: .alert)

        let okAtion = UIAlertAction(title: "再挑戦", style: .default) { [weak self] _ in
            self?.questionNumberSetUp()
        }
        alert.addAction(okAtion)
        present(alert, animated: true, completion: nil)
    }

    private func judgment() {
        self.sliderNum = Int(slider.value)
        if sliderNum == questionNumber {
            alert(alertMessage: "アタリ!\nあなたの値\(sliderNum)")
        } else {
            alert(alertMessage: "ハズレ!\nあなたの値\(sliderNum)")
        }
    }

    private func questionNumberSetUp() {
        questionNumber = Int.random(in: 1...100)
        updateLabel()
        slider.value = 50.0
    }
    private func updateLabel() {
        questionLabel.text = String(questionNumber)
    }
}
