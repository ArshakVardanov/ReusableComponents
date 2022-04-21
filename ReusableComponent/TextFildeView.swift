//
//  TextFildeView.swift
//  ReusableComponent
//
//  Created by Arshak Vardanov on 16.04.22.
//

import UIKit

struct TextFieldViewData {
    enum KeyboardType {
        case emailPad
        case numberPad
        case namePhonePad
    }
    var isSecure: Bool
    var keyboardType: KeyboardType
//    var action: (String) -> Void
}

class TextFieldView: UIView {
    var titleLabel: UILabel!
    var textField: UITextField!
    var wrapperView: UIView!
    var eyeButton: UIButton!
    var passTitleLabel: UILabel!
    var passTextField: UITextField!
    var passWrapperView: UIView!

    init() {
        super.init(frame: .zero)
        comoninit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        comoninit()
    }
    
    @objc func tapEyeButton() {
        if eyeButton.tag == 1 {
            eyeButton.tag = 0
            passTextField.isSecureTextEntry = false
            eyeButton.setImage(UIImage(systemName: "eye.slash.fill")?
                .withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
        }else {
            eyeButton.tag = 1
            passTextField.isSecureTextEntry = true
            eyeButton.setImage(UIImage(systemName: "eye.fill")?
                .withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
        }
    }
    
}



extension TextFieldView{
    
    
    
    private func comoninit() {
        
        initTitleLabel()
        initTextField()
        initWrapperView()
        initEyeButton()
        initPassTitleLabel()
        iniTpassWrapperView()
        initPassTextField()
        constructHierachy()
        activateConstraints()
        
    }
    
    private func initPassTitleLabel() {
        passTitleLabel = UILabel()
        passTitleLabel.textColor = .red
        passTitleLabel.text = "Password"
        passTitleLabel.textAlignment = .left
        passTitleLabel.font = .systemFont(ofSize: 14, weight: .medium)
        passTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func initPassTextField() {
        passTextField = UITextField()
        passTextField.placeholder = "Password"
        passTextField.font = .systemFont(ofSize: 16, weight: .medium)
        passTextField.isSecureTextEntry = true
        passTextField.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func iniTpassWrapperView(){
        passWrapperView = UIView()
        passWrapperView.translatesAutoresizingMaskIntoConstraints = false
//      passWrapperViewew.backgroundColor = .red
        passWrapperView.layer.borderWidth = 1
        passWrapperView.layer.borderColor = UIColor.black.cgColor
        passWrapperView.layer.cornerRadius = 12
        
    }
    
    private func initTextField() {
        textField = UITextField()
        textField.placeholder = "UserName"
        textField.font = .systemFont(ofSize: 16, weight: .medium)
        textField.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func initTitleLabel() {
        titleLabel = UILabel()
        titleLabel.textColor = .red
        titleLabel.text = "UserName"
        titleLabel.textAlignment = .left
        titleLabel.font = .systemFont(ofSize: 14, weight: .medium)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func initEyeButton() {
        eyeButton = UIButton()
        eyeButton.setImage(UIImage(systemName: "eye.fill")?
            .withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
        eyeButton.tag = 1
        eyeButton.translatesAutoresizingMaskIntoConstraints = false
        eyeButton.addTarget(self, action: #selector(tapEyeButton), for: .touchUpInside)
    }
    
    private func initWrapperView(){
        wrapperView = UIView()
        wrapperView.translatesAutoresizingMaskIntoConstraints = false
//        wrapperView.backgroundColor = .red
        wrapperView.layer.borderWidth = 1
        wrapperView.layer.borderColor = UIColor.black.cgColor
        wrapperView.layer.cornerRadius = 12
        
    }
    private func constructHierachy(){
        addSubview(titleLabel)
        addSubview(wrapperView)
        wrapperView.addSubview(textField)
        addSubview(passTitleLabel)
        addSubview(passWrapperView)
        passWrapperView.addSubview(passTextField)
        passWrapperView.addSubview(eyeButton)
        
        
    }
    
    fileprivate func activateConstraints() {

        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            
            wrapperView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            wrapperView.leftAnchor.constraint(equalTo: leftAnchor),
            wrapperView.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
            wrapperView.bottomAnchor.constraint(equalTo: passTitleLabel.topAnchor, constant: -10),
            
            
            
            textField.topAnchor.constraint(equalTo: wrapperView.topAnchor),
            textField.leftAnchor.constraint(equalTo: wrapperView.leftAnchor, constant: 5),
            
            textField.bottomAnchor.constraint(equalTo: wrapperView.bottomAnchor),
            
            
            
            passTitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
            passTitleLabel.rightAnchor.constraint(equalTo: rightAnchor),
            passTitleLabel.topAnchor.constraint(equalTo: wrapperView.bottomAnchor, constant: 50),
            
            passWrapperView.topAnchor.constraint(equalTo: passTitleLabel.bottomAnchor, constant: 5),
            passWrapperView.leadingAnchor.constraint(equalTo: leadingAnchor),
            passWrapperView.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
            passWrapperView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            
            
            passTextField.topAnchor.constraint(equalTo: passWrapperView.topAnchor),
            passTextField.leftAnchor.constraint(equalTo: passWrapperView.leftAnchor, constant: 5),
            passTextField.rightAnchor.constraint(equalTo: eyeButton.leftAnchor, constant: -5),
            passTextField.rightAnchor.constraint(equalTo: eyeButton.leftAnchor, constant: -5),
            passTextField.bottomAnchor.constraint(equalTo: passWrapperView.bottomAnchor),
            
            
            eyeButton.centerYAnchor.constraint(equalTo: passWrapperView.centerYAnchor),
            eyeButton.centerXAnchor.constraint(equalTo: passWrapperView.rightAnchor, constant: -17)
//            textField.bottomAnchor.constraint(equalTo: wrapperView.bottomAnchor, constant: 12)
            
            
            
            
        ])

    }
    
    
    func set(data: TextFieldViewData) {
        textField.isSecureTextEntry = data.isSecure
        
    }
}


