//
//  ViewController.swift
//  Movie Magic
//
//  Created by Matheus Franceschini on 06/05/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage.logo)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var startButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .bgButton
        button.setTitle("Vamos lá!", for: .normal)
        button.layer.cornerRadius = 24
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.titleLabel?.textColor = .text
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        addSubviews()
        setupConstraints()
        // Do any additional setup after loading the view.
    }
    
    private func setupLayout() {
        view.backgroundColor = .bgYellow
    }
    
    private func addSubviews() {
        view.addSubview(logoImageView)
        view.addSubview(startButton)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            startButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80),
            startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            startButton.heightAnchor.constraint(equalToConstant: 64)
        ])
    }
    
    @objc private func buttonPressed() {
        navigationController?.pushViewController(MovieListViewController(), animated: true)
    }

}
