//
//  AddServersViewController.swift
//  RSSReader
//
//  Created by Jenny Rykun on 12/7/18.
//  Copyright © 2018 Jenny Rykun. All rights reserved.
//

import UIKit

class AddServersViewController: UIViewController {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var linlTextFireld: UITextField!
    
    private let model: ServerModelProtocol! = ServerModel()

    @IBAction func cancelClickButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveClickButton(_ sender: UIButton) {
        
        guard let name = nameTextField.text,
            let url = URL(string: linlTextFireld.text ?? "") else {
            return
        }
        
        model.addServer(name: name, link: url) { result in
            if result == true {
                self.dismiss(animated: true, completion: nil)
            } else {
                print("Cannot save data")
            }
        }
    }
}
