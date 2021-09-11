//
//  ViewController.swift
//  LessonOne
//
//  Created by Kaisar on 06.09.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var loginTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.scrollView.addGestureRecognizer(gesture)
    }
    
    @objc func handleTap() {
        self.scrollView.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.addObservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.removeObservers()
    }
    
    private func addObservers() {
        NotificationCenter.default
            .addObserver(
                self,
                selector: #selector(handleKeyboardShown),
                name: UIResponder.keyboardWillShowNotification,
                object: nil
            )
        
        NotificationCenter.default
            .addObserver(
                self,
                selector: #selector(handleKeyboardHidden),
                name: UIResponder.keyboardWillHideNotification,
                object: nil
            )
    }
    
    private func removeObservers() {
        NotificationCenter.default
            .removeObserver(
                self,
                name: UIResponder.keyboardWillShowNotification,
                object: nil
            )
        
        NotificationCenter.default
            .removeObserver(
                self,
                name: UIResponder.keyboardWillHideNotification,
                object: nil
            )
    }
    
    @objc func handleKeyboardShown() {
        let bottomOffset = CGPoint(x: 0, y: 70)
        scrollView.setContentOffset(bottomOffset, animated: true)
    }
    
    @objc func handleKeyboardHidden() {
        let bottomOffset = CGPoint(x: 0, y: 0)
        scrollView.setContentOffset(bottomOffset, animated: true)
    }
    
    @IBAction private func buttonPressed(_ sender: Any) {
        let login = self.loginTextField.text!
        let password = self.passwordTextField.text!
        
        print("login and password are: \(login), \(password)")
        
        if login == "admin" && password == "password" {
            let tabBarController = UIStoryboard(name: "TabBar", bundle: nil)
                .instantiateViewController(withIdentifier: "TabBar")
            
            tabBarController.modalPresentationStyle = .fullScreen
            
            self.present(tabBarController, animated: true, completion: nil)
        } else {
            print("Wrong user credentials")
        }
    }
}

