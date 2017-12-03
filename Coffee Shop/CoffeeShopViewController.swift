//
//  CoffeeShopViewController.swift
//  Coffee Shop
//
//  Created by Amadeu Cavalcante Filho on 12/3/17.
//  Copyright © 2017 Amadeu Cavalcante Filho. All rights reserved.
//

import UIKit

class CoffeeShopViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 200, width: 200, height: 20)
        label.text = "Hello to Coffee Shop App!"
        label.textColor = .black
        
        view.addSubview(label)
        self.view = view
    }

}
