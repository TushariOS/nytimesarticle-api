//
//  DataTableViewCell.swift
//  SingleAPICalll
//
//  Created by Tushar on 27/04/19.
//  Copyright © 2019 Tushar. All rights reserved.
//

import UIKit

class DataTableViewCell: UITableViewCell {
    
    
    // MARK: - Private property.
    
    /// Ressult articale data.
    private var results: Results?
    
    // MARK: - UI property.
    @IBOutlet private weak var mainTitlelabel: UILabel!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        setUpCell()
    }
    
    /// Set data to tableview.
    ///
    /// - Parameter result: Story model data
    func setData(result: Results) {
        self.results = result
        mainTitlelabel.text = results?.title ?? ""
        collectionView.reloadData()
    }
    
    /// Configure and register collection view cell.
    private func setUpCell() {
        collectionView.delegate = self
        collectionView.dataSource = self
        let nib = UINib(nibName: "ImageCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "ImageCollectionViewCell")
    }
}

// MARK: - UICollection View dataSource, delegate and flowlayout extension.
extension DataTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results?.multimedia?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        cell.setUpCell(urlString: results?.multimedia?[indexPath.row].url)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}
