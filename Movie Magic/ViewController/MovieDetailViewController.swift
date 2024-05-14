//
//  MovieDetailViewController.swift
//  Movie Magic
//
//  Created by Matheus Franceschini on 07/05/24.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    private var movie: Movie
    
    private lazy var moviePosterImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: movie.image))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 24
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var movieTitleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = movie.title
        label.textColor = .text
        label.font = .boldSystemFont(ofSize: 24)
        return label
    }()
    
    private lazy var movieDescriptionLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = movie.synopsis
        label.font = .systemFont(ofSize: 16)
        label.textColor = .text
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        addSubviews()
        setupConstraints()

        // Do any additional setup after loading the view.
    }
    
    private func setupLayout() {
        view.backgroundColor = .bgWhite
        let url = URL(string: movie.image)
        moviePosterImageView.kf.setImage(with: url)
    }
    
    private func addSubviews() {
        view.addSubview(moviePosterImageView)
        view.addSubview(movieTitleLabel)
        view.addSubview(movieDescriptionLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            moviePosterImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 48),
            moviePosterImageView.centerXAnchor.constraint(equalTo:  view.centerXAnchor),
            moviePosterImageView.widthAnchor.constraint(equalToConstant: 220),
            moviePosterImageView.heightAnchor.constraint(equalToConstant: 320),
            
            movieTitleLabel.topAnchor.constraint(equalTo: moviePosterImageView.bottomAnchor, constant: 24),
            movieTitleLabel.centerXAnchor.constraint(equalTo: moviePosterImageView.centerXAnchor),
            
            movieDescriptionLabel.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 32),
            movieDescriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            movieDescriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
    }
    
    init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
