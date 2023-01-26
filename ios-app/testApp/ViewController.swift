//
//  ViewController.swift
//  123
//
//  Created by Vladimir Gorbunov on 1/24/23.
//

import UIKit
import FirstTestModule

class ViewController: UIViewController {

    let firstButton = UIButton()
    let secondButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        firstButton.setTitle("First test section", for: .normal)
        firstButton.backgroundColor = .systemBlue
        firstButton.frame = .init(x: 80, y: 300, width: 200, height: 50)
        firstButton.addTarget(self, action: #selector(openFirstSection), for: .touchUpInside)
        
        secondButton.setTitle("Second test section", for: .normal)
        secondButton.backgroundColor = .systemBlue
        secondButton.frame = .init(x: 80, y: 400, width: 200, height: 50)
        secondButton.addTarget(self, action: #selector(openSecondSection), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.view.addSubview(firstButton)
        self.view.addSubview(secondButton)
    }
    
    @objc func openFirstSection() {
        print("work 1")
    }
    
    @objc func openSecondSection() {
        print("work 2")
    }
}

