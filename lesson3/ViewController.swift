//
//  ViewController.swift
//  lesson3
//
//  Created by Александр Калашников on 14/7/22.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var words: [WordModel] = [
        WordModel(imageOne: UIImage(systemName: "heart")!, imageTwo: UIImage(systemName: "heart")!, imageThree: UIImage(systemName: "heart")!, imageFour: UIImage(systemName: "heart")!, letters: ["a", "f", "n", "i", "u", "r", "g", "l", "e", "m"], correctWord: ["g", "u", "n"]),
        WordModel(imageOne: UIImage(systemName: "star")!, imageTwo: UIImage(systemName: "star")!, imageThree: UIImage(systemName: "star")!, imageFour: UIImage(systemName: "star")!, letters: ["s", "c", "n", "t", "u", "b", "g", "f", "e", "p"], correctWord: ["c", "u", "p"])
    ]

    
    var tryingWord: [String] = []
    var index: Int = 0
    
    private lazy var wordCollection: UICollectionView = {
        var layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(WordCell.self, forCellWithReuseIdentifier: "wordCell")
        view.dataSource = self
        view.delegate = self
        return view
    }()
    
    private lazy var lettersCollection: UICollectionView = {
        var layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(LetterCell.self, forCellWithReuseIdentifier: "letterCell")
        view.dataSource = self
        view.delegate = self
        return view
    }()
    
    private let imageContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    private var imageOne: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .cyan
        return view
    }()
    
    private var imageTwo: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .cyan
        return view
    }()
    
    private var imageThree: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .cyan
        return view
    }()
    
    private var imageFour: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .cyan
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
        setImages()
    }

    func setImages() {
        imageOne.image = words[index].imageOne
        imageTwo.image = words[index].imageTwo
        imageThree.image = words[index].imageThree
        imageFour.image = words[index].imageFour
    }
    
    func layout() {
        view.addSubview(imageContainer)
        imageContainer.translatesAutoresizingMaskIntoConstraints = false
        imageContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        imageContainer.widthAnchor.constraint(equalToConstant: view.frame.size.width-40).isActive = true
        imageContainer.heightAnchor.constraint(equalToConstant: view.frame.size.width-40).isActive = true
        imageContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
        view.addSubview(imageOne)
        imageOne.translatesAutoresizingMaskIntoConstraints = false
        imageOne.heightAnchor.constraint(equalToConstant: (view.frame.size.width/2)-40).isActive = true
        imageOne.widthAnchor.constraint(equalToConstant: (view.frame.size.width/2)-40).isActive = true
        imageOne.topAnchor.constraint(equalTo: imageContainer.topAnchor, constant: 5).isActive = true
        imageOne.leftAnchor.constraint(equalTo: imageContainer.leftAnchor, constant: 5).isActive = true
        
        view.addSubview(imageTwo)
        imageTwo.translatesAutoresizingMaskIntoConstraints = false
        imageTwo.heightAnchor.constraint(equalToConstant: (view.frame.size.width/2)-40).isActive = true
        imageTwo.widthAnchor.constraint(equalToConstant: (view.frame.size.width/2)-40).isActive = true
        imageTwo.topAnchor.constraint(equalTo: imageContainer.topAnchor, constant: 5).isActive = true
        imageTwo.rightAnchor.constraint(equalTo: imageContainer.rightAnchor, constant: -5).isActive = true
        
        view.addSubview(imageThree)
        imageThree.translatesAutoresizingMaskIntoConstraints = false
        imageThree.heightAnchor.constraint(equalToConstant: (view.frame.size.width/2)-40).isActive = true
        imageThree.widthAnchor.constraint(equalToConstant: (view.frame.size.width/2)-40).isActive = true
        imageThree.bottomAnchor.constraint(equalTo: imageContainer.bottomAnchor, constant: -5).isActive = true
        imageThree.leftAnchor.constraint(equalTo: imageContainer.leftAnchor, constant: 5).isActive = true
        
        view.addSubview(imageFour)
        imageFour.translatesAutoresizingMaskIntoConstraints = false
        imageFour.heightAnchor.constraint(equalToConstant: (view.frame.size.width/2)-40).isActive = true
        imageFour.widthAnchor.constraint(equalToConstant: (view.frame.size.width/2)-40).isActive = true
        imageFour.bottomAnchor.constraint(equalTo: imageContainer.bottomAnchor, constant: -5).isActive = true
        imageFour.rightAnchor.constraint(equalTo: imageContainer.rightAnchor, constant: -5).isActive = true
        
        view.addSubview(wordCollection)
        wordCollection.translatesAutoresizingMaskIntoConstraints = false
        wordCollection.topAnchor.constraint(equalTo: imageContainer.bottomAnchor, constant: 10).isActive = true
        wordCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        wordCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        wordCollection.heightAnchor.constraint(equalToConstant: 130).isActive = true
        
        view.addSubview(lettersCollection)
        lettersCollection.translatesAutoresizingMaskIntoConstraints = false
        lettersCollection.topAnchor.constraint(equalTo: wordCollection.bottomAnchor, constant: 40).isActive = true
        lettersCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        lettersCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        lettersCollection.heightAnchor.constraint(equalToConstant: 130).isActive = true
    }
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == wordCollection {
            return tryingWord.count
        } else {
            return words[index].letters.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == wordCollection {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "wordCell", for: indexPath) as! WordCell
            
            if tryingWord.isEmpty {
                cell.letterLabel.text = " "
            }else {
                cell.letterLabel.text = tryingWord[indexPath.row]
                wordCollection.reloadData()
            }
            
            return cell
        } else {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "letterCell", for: indexPath) as! LetterCell
            cell.letterLabel.text = words[index].letters[indexPath.row]
            return cell
            
        }
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == lettersCollection {
            wordCollection.reloadData()
            let letter = words[index].letters[indexPath.row]
            tryingWord.append(letter)



            if tryingWord == words[index].correctWord {
                print("Vy ugadali")
                index += 1
                setImages()
                lettersCollection.reloadData()
            }else {
                print("vy ne ugadali")
            }
            
        }
        
    }
    
}
