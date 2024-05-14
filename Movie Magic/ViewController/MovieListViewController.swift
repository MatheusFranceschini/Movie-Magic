//
//  MovieListViewController.swift
//  Movie Magic
//
//  Created by Matheus Franceschini on 06/05/24.
//

import UIKit

class MovieListViewController: UIViewController {
    
    private var filteredMovies: [Movie] = []
    private var searchIsActive: Bool = false
    private var movies: [Movie] = []
    private let movieService: MovieService = MovieService()
    
    private lazy var movieTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.largeContentTitle = "Filmes"
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    private lazy var searchBar: UISearchBar = {
       let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.delegate = self
        searchBar.placeholder = "Pesquisar"
        searchBar.showsCancelButton = true
        searchBar.searchTextField.textColor = .text
        return searchBar
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        addSubviews()
        setupConstraints()
        Task {
            await fetchMovies()
        }

        // Do any additional setup after loading the view.
    }
    
    private func setupLayout() {
        view.backgroundColor = .bgWhite
        navigationItem.setHidesBackButton(true, animated: true)
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        title = "Filmes"
        navigationItem.titleView = searchBar
    }
    
    private func addSubviews() {
        view.addSubview(movieTableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            movieTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            movieTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 4),
            movieTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -4),
            movieTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func fetchMovies() async {
        do {
            movies = try await movieService.getMovies()
            movieTableView.reloadData()
        } catch (let error){
            print(error)
        }
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

extension MovieListViewController: UITableViewDataSource, UITableViewDelegate {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchIsActive ? filteredMovies.count : movies.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MovieTableViewCell else {
            return UITableViewCell()
        }
        let movie = searchIsActive ? filteredMovies[indexPath.row] : movies[indexPath.row]
        cell.configureCell(movie: movie)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let movie = searchIsActive ? filteredMovies[indexPath.row] : movies[indexPath.row]
        navigationController?.pushViewController(MovieDetailViewController(movie: movie), animated: true)
    }
    
}

extension MovieListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            searchIsActive = false
        } else {
            searchIsActive = true
            filteredMovies = movies.filter({ movie in
                movie.title.lowercased().contains(searchText.lowercased())
            })
        }
        
        movieTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
        searchIsActive = false
        movieTableView.reloadData()
    }
}
