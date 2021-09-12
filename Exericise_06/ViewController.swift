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
    private var questionNumber = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        slider.value = slider.maximumValue / 2
        resetGame()
    }

    // MARK: METHOds

    @IBAction private func judgementButton(_ sender: Any) {
        judgment()
    }

    private func alert(alertMessage: String) {
        let alert = UIAlertController(title: "結果", message: alertMessage, preferredStyle: .alert)

        let okAtion = UIAlertAction(title: "再挑戦", style: .default) { [weak self] _ in
            self?.resetGame()
        }
        alert.addAction(okAtion)
        present(alert, animated: true, completion: nil)
    }

    private func judgment() {
        let sliderNum = Int(slider.value)
        if sliderNum == questionNumber {
            alert(alertMessage: "アタリ!\nあなたの値\(sliderNum)")
        } else {
            alert(alertMessage: "ハズレ!\nあなたの値\(sliderNum)")
        }
    }

    private func resetGame() {
        questionNumber = Int.random(in: 1...100)
        updateLabel()
    }

    private func updateLabel() {
        questionLabel.text = String(questionNumber)
    }
}
