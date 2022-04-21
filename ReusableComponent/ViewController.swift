//
//  ViewController.swift
//  ReusableComponent
//
//  Created by Arshak Vardanov on 16.04.22.
//

import UIKit

class ViewController: UIViewController {

    var textFieldView: TextFieldView!
    var vStack: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vStack = UIStackView()
        vStack.axis = .vertical
        vStack.translatesAutoresizingMaskIntoConstraints = false
        
        textFieldView = TextFieldView()
        textFieldView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(vStack)
        vStack.addArrangedSubview(textFieldView)
        activateConstraints()
//        textFieldView.set(data: TextFieldViewData(titleFont: .systemFont(ofSize: 20), cornerRadius: 12))
        // Do any additional setup after loading the view.
    }


}

extension ViewController{
    fileprivate func activateConstraints() {
        
            NSLayoutConstraint.activate([
                vStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
                vStack.leftAnchor.constraint(equalTo: view.leftAnchor),
                vStack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                
                textFieldView.topAnchor.constraint(equalTo: vStack.topAnchor, constant: 60),
                textFieldView.leftAnchor.constraint(equalTo: vStack.leftAnchor, constant: 20),
                textFieldView.rightAnchor.constraint(equalTo: vStack.rightAnchor, constant: -25)
            ])
    }
    
}
