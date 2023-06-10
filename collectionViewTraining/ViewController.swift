//
//  ViewController.swift
//  collectionViewTraining
//
//  Created by ahmetburakozturk on 20.05.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var movieCollectionView: UICollectionView!
    
    var movieList = [Movie]()
    var filteredMovieList = [Movie]()
    var isSearching :Bool = false
    
    @IBOutlet weak var mainSearchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let mov1 = Movie(movieName: "Django",movieCategory: "Fantastic",movieImage: "django", movieYear: 2015, movieImdbRate: 8.6)
        let mov2 = Movie(movieName: "Interstellar",movieCategory: "Science Fiction",movieImage: "interstellar", movieYear: 2014, movieImdbRate: 9.2)
        let mov3 = Movie(movieName: "Shutter Island",movieCategory: "Thriller",movieImage: "shutterIsland", movieYear: 2011, movieImdbRate: 8.8)
        let mov4 = Movie(movieName: "Inception",movieCategory: "Science Fiction",movieImage: "inception", movieYear: 2012, movieImdbRate: 9.0)
        let mov5 = Movie(movieName: "Bladerunner 2049",movieCategory: "Fantastic",movieImage: "bladerunner", movieYear: 2017, movieImdbRate: 7.9)
        let mov6 = Movie(movieName: "Seven",movieCategory: "Mystery",movieImage: "seven", movieYear: 2006, movieImdbRate: 8.5)
        let mov7 = Movie(movieName: "Lucy",movieCategory: "Science Fiction",movieImage: "lucy", movieYear: 2010, movieImdbRate: 8.0)
        let mov8 = Movie(movieName: "Dark Knight",movieCategory: "Comics",movieImage: "darkknight", movieYear: 2009, movieImdbRate: 9.1)
        
        movieList.append(mov1)
        movieList.append(mov2)
        movieList.append(mov3)
        movieList.append(mov4)
        movieList.append(mov5)
        movieList.append(mov6)
        movieList.append(mov7)
        movieList.append(mov8)
        movieList.append(mov1)
        movieList.append(mov2)
        movieList.append(mov3)
        movieList.append(mov4)
        movieList.append(mov5)
        movieList.append(mov6)
        movieList.append(mov7)
        movieList.append(mov8)

        
        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self
        
        mainSearchBar.delegate = self
        
        let tasarim : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let cellWidth = self.movieCollectionView.frame.size.width
        let screenWidth = self.view.frame.size.width
        
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: screenWidth * 0.010, bottom: 10, right: screenWidth * 0.010)
        tasarim.itemSize = CGSize(width: screenWidth * 0.47 , height: (cellWidth-25))
        tasarim.minimumInteritemSpacing = screenWidth * 0.010
        tasarim.minimumLineSpacing = 10
        movieCollectionView.collectionViewLayout = tasarim
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, customCollectionViewCellProtocol {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isSearching == true {
            return filteredMovieList.count
        } else {
            return movieList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if isSearching == true {
            let cell = movieCollectionView.dequeueReusableCell(withReuseIdentifier: "movieCollectionViewCell", for: indexPath) as! customCollectionViewCell
            cell.imageView.image = UIImage(named: filteredMovieList[indexPath.row].movieImage!)
            cell.nameLabel.text = filteredMovieList[indexPath.row].movieName
            cell.categoryLabel.text = filteredMovieList[indexPath.row].movieCategory
            cell.yearLabel.text = String(filteredMovieList[indexPath.row].movieYear!)
            cell.rateLabel.text = "IMDb: \(filteredMovieList[indexPath.row].movieImdbRate!)"
            return cell
        } else {
            let cell = movieCollectionView.dequeueReusableCell(withReuseIdentifier: "movieCollectionViewCell", for: indexPath) as! customCollectionViewCell
            cell.imageView.image = UIImage(named: movieList[indexPath.row].movieImage!)
            cell.nameLabel.text = movieList[indexPath.row].movieName
            cell.categoryLabel.text = movieList[indexPath.row].movieCategory
            cell.yearLabel.text = String(movieList[indexPath.row].movieYear!)
            cell.rateLabel.text = "IMDb: \(movieList[indexPath.row].movieImdbRate!)"
            return cell
        }
        
    }
    
    func watchButtonClicked(indexPath: IndexPath) {
        if isSearching == true {
            print("\(filteredMovieList[indexPath.row].movieName!) izleniyor.")
        } else {
            print("\(movieList[indexPath.row].movieName!) izleniyor.")
        }
        
    }
    
    
}

extension ViewController:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText != ""{
            isSearching = true
            filteredMovieList = movieList.filter({$0.movieName!.lowercased().prefix(searchText.count) == searchText.lowercased()})
        } else {
            isSearching = false
        }

        movieCollectionView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        movieCollectionView.reloadData()
    }
}

