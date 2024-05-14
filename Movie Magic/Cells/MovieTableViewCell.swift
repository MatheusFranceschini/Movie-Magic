//
//  MovieTableViewCell.swift
//  Movie Magic
//
//  Created by Matheus Franceschini on 06/05/24.
//

import UIKit
import Kingfisher

class MovieTableViewCell: UITableViewCell {
    
    private lazy var movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var movieTitleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.font = .boldSystemFont(ofSize: 24)
        label.textColor = .text
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var ratingLogoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage.rating)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var ratingLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.font = .systemFont(ofSize: 16)
        label.textColor = .text
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        backgroundColor = .clear
    }
    
    private func addSubviews() {
        addSubview(movieImageView)
        addSubview(movieTitleLabel)
        addSubview(ratingLogoImageView)
        addSubview(ratingLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            movieImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32),
            movieImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            movieImageView.heightAnchor.constraint(equalToConstant: 160),
            movieImageView.widthAnchor.constraint(equalToConstant: 110),
            
            movieTitleLabel.centerYAnchor.constraint(equalTo: movieImageView.centerYAnchor, constant: -25),
            movieTitleLabel.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 16),
            movieTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            ratingLogoImageView.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 8),
            ratingLogoImageView.leadingAnchor.constraint(equalTo: movieTitleLabel.leadingAnchor),
            ratingLogoImageView.widthAnchor.constraint(equalToConstant: 16),
            ratingLogoImageView.heightAnchor.constraint(equalToConstant: 16),
            
            ratingLabel.centerYAnchor.constraint(equalTo: ratingLogoImageView.centerYAnchor),
            ratingLabel.leadingAnchor.constraint(equalTo: ratingLogoImageView.trailingAnchor, constant: 4)
            
        ])
    }
    
    func configureCell(movie: Movie) {
//        movieImageView.image = UIImage(named: movie.image)
        let url = URL(string: movie.image)
        movieImageView.kf.setImage(with: url)
        movieTitleLabel.text = movie.title
        ratingLabel.text = "\(movie.rate)/10"
    }

}
