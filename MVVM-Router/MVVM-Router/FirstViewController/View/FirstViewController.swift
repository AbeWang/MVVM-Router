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
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = .black
        label.backgroundColor = .clear
        label.text = viewModel?.title
        return label
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 5
        return stackView
    }()
    
    private lazy var increaseButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Update text", for: .normal)
        button.setTitleColor(.white, for: .normal)
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

extension FirstViewController {
    private func handleDataBinding() {
        viewModel?.titleDidChangedCallback = { [weak self] title in
            self?.label.text = title
        }
    }
    
    private func setupUI() {
        title = "First View"
        view.backgroundColor = .white
        
        buttonStackView.addArrangedSubview(increaseButton)
        buttonStackView.addArrangedSubview(button_A)
        buttonStackView.addArrangedSubview(button_B)
        buttonStackView.addArrangedSubview(button_C)
        
        view.addSubview(label)
        view.addSubview(buttonStackView)
        
        let views: [String: Any] = [
            "label": label,
            "stack": buttonStackView
        ]
        
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[label]|", options: [], metrics: nil, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-15-[stack]-15-|", options: [], metrics: nil, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-15-[label(30)]-10-[stack]-80-|", options: [], metrics: nil, views: views))
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
        router?.route(to: .viewB, viewModel: viewModel, parameters: viewModel?.parameters)
    }
    
    @objc func buttonCPressed() {
        router?.route(to: .viewC)
    }
}
