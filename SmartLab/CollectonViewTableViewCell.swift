//
//  CollectonViewTableViewCell.swift
//  SmartLab
//
//  Created by maika on 12/9/19.
//  Copyright © 2019 maika. All rights reserved.
//

import UIKit

class CollectonViewTableViewCell: UITableViewCell ,UICollectionViewDataSource,UICollectionViewDelegate{
    
    @IBOutlet var CollectionViewTableView: UICollectionView!
    var result2 = Result2()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        CollectionViewTableView.delegate = self
        CollectionViewTableView.dataSource = self
        CollectionViewTableView.register(UINib.init(nibName: "CollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "CollectionViewCell")
        API.getCell(onSuccess:{[weak self](events2) in
            guard let self = self else{return}
//            self.hideload()
            self.result2.events2 = events2
            self.CollectionViewTableView.reloadData()
            
        }) {/*[weak self]*/(error)in
//            guard let self = self else{return}
//            self.hideload()
//            self.showAlert(title: "Error", message: error.localizedDescription)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return result2.events2.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        let event2 = result2.events2[indexPath.row]
        cell.setCell(event: event2)
        return cell
    }
}

extension CollectonViewTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
}
