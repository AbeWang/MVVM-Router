//
//  FirstViewController.swift
//  MVVM-Router
//
//  Created by Abe Wang on 2021/3/4.
//

import UIKit

enum FirstViewDestination {
    case viewA
    case viewB
    case viewC
}

class FirstViewController: UIViewController {
    var viewModel: FirstViewModel?
    var router: FirstViewRouter?
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 15
        return stackView
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        label.textColor = .black
        label.backgroundColor = .yellow
        label.text = viewModel?.title
        return label
    }()
    
    private lazy var increaseButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Update text", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.addTarget(self, action: #selector(increaseButtonPressed), for: .touchUpInside)
        button.layer.borderWidth = 1
        button.layer.backgroundColor = UIColor.black.cgColor
        button.layer.cornerRadius = 5
        return button
    }()
    
    private lazy var button_A: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("View A", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.addTarget(self, action: #selector(buttonAPressed), for: .touchUpInside)
        button.layer.borderWidth = 1
        button.layer.backgroundColor = UIColor.black.cgColor
        button.layer.cornerRadius = 5
        return button
    }()
    
    private lazy var button_B: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("View B", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.addTarget(self, action: #selector(buttonBPressed), for: .touchUpInside)
        button.layer.borderWidth = 1
        button.layer.backgroundColor = UIColor.black.cgColor
        button.layer.cornerRadius = 5
        return button
    }()
    
    private lazy var button_C: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("View C", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.addTarget(self, action: #selector(buttonCPressed), for: .touchUpInside)
        button.layer.borderWidth = 1
        button.layer.backgroundColor = UIColor.black.cgColor
        button.layer.cornerRadius = 5
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        handleDataBinding()
    }
}

// Private functions
extension FirstViewController {
    private func handleDataBinding() {
        viewModel?.titleDidChangedCallback = { [weak self] title in
            self?.label.text = title
        }
    }
    
    private func setupUI() {
        title = "View"
        view.backgroundColor = .white
        
        buttonStackView.addArrangedSubview(label)
        buttonStackView.addArrangedSubview(increaseButton)
        buttonStackView.addArrangedSubview(button_A)
        buttonStackView.addArrangedSubview(button_B)
        buttonStackView.addArrangedSubview(button_C)
        view.addSubview(buttonStackView)
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: buttonStackView, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: buttonStackView, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: buttonStackView, attribute: .left, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .left, multiplier: 1, constant: 15),
            NSLayoutConstraint(item: buttonStackView, attribute: .right, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .right, multiplier: 1, constant: -15)
        ])
    }
}

// Actions
extension FirstViewController {
    @objc func increaseButtonPressed() {
        viewModel?.increaseTitleCount()
    }
    
    @objc func buttonAPressed() {
        router?.route(to: .viewA)
    }
    
    @objc func buttonBPressed() {
        let parameters: [String: Any] = [
            "name": "abewang",
            "age": 18
        ]
        router?.route(to: .viewB, viewModel: viewModel, parameters: parameters)
    }
    
    @objc func buttonCPressed() {
        router?.route(to: .viewC)
    }
}
