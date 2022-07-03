//
//  ViewController.swift
//  GuessTheFlag
//
//  Created by Admin on 7/3/22.
//

import UIKit

class ViewController: UIViewController {
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    let button1 : UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 1
        button.tag = 0
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let button2 : UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 1
        button.tag = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let button3 : UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 1
        button.tag = 2
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
        button1.backgroundColor = .systemBrown
        button2.backgroundColor = .systemBrown
        button3.backgroundColor = .systemBrown
        configure()
        view.backgroundColor = .systemBackground
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        askQuestions(action: nil)
        button1.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button2.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button3.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
    }
    
    @objc func buttonTapped() {
        
        var title : String
        
        if button1.tag == correctAnswer {
            title = "Correct"
            score += 1
        }
        else {
            title = "Wrong"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Contine", style: .default, handler: askQuestions))
        present(ac, animated: true)
    }
    
    private func configure() {
        
        NSLayoutConstraint.activate([
            button1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            button1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button1.heightAnchor.constraint(equalToConstant: 100),
            button1.widthAnchor.constraint(equalToConstant: 200),
            
            button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 50),
            button2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button2.heightAnchor.constraint(equalToConstant: 100),
            button2.widthAnchor.constraint(equalToConstant: 200),
            
            button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 50),
            button3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button3.heightAnchor.constraint(equalToConstant: 100),
            button3.widthAnchor.constraint(equalToConstant: 200)
        
        ])
    }
    
    private func askQuestions(action : UIAlertAction!) {
        
        countries.shuffle()
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        correctAnswer = Int.random(in: 0...2)
        title = countries[correctAnswer].uppercased()
    }
    
    


}

