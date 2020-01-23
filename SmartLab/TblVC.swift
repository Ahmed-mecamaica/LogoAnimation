//
//  TblVC.swift
//  SmartLab
//
//  Created by maika on 12/8/19.
//  Copyright © 2019 maika. All rights reserved.
//

import UIKit
import ObjectMapper
import MBProgressHUD

class TblVC: UIViewController {
    @IBOutlet var tblView:UITableView!
//    @IBOutlet var collView: UICollectionView!
    var result = Result()
    var result2 = Result2()
//    var collectionView = CollectonViewTableViewCell()
    deinit{
        print("UIViewController deinit")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadEvent()
//        loadcolView()
    }
    func loadEvent(){
        let nib = UINib.init(nibName: "EventTableViewCell", bundle: .main)
        tblView.register(nib, forCellReuseIdentifier: "EventTableViewCell")
        tblView.register(UINib.init(nibName: "CollectonViewTableViewCell", bundle: .main), forCellReuseIdentifier: "CollectonViewTableViewCell")

        loadTblView()
        
    }
    
    func loadTblView() {
        loadView()
        API.getEvent(onSuccess:{ [weak self] (events) in
            guard let self = self else { return }
            self.hideload()
            self.result.events = events
            self.tblView.reloadData()
        }){(error)in
            self.hideload()
            self.showAlert(title: "Error", message: error.localizedDescription)
            //          [weak self]  guard let self = self else { return }
        }
    }
//    func loadCol(){
//        let nib2 = UINib.init(nibName: "CollectionViewCell", bundle: .main)
//        collView.register(nib2, forCellWithReuseIdentifier: "CollectionViewCell")
//        loadcolView()
//    }
//    func loadcolView(){
//        loadView()
//
//    }
}
extension TblVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        why?
      return  section == 0 ? 1 : result.events.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CollectonViewTableViewCell") as! CollectonViewTableViewCell
            cell.result2 = result2
            cell.CollectionViewTableView.reloadData()
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventTableViewCell") as! EventTableViewCell
        let event = result.events[indexPath.row]
        cell.setEvent(event: event)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  indexPath.section == 0 ? 200 : 80

    }
}

//extension TblVC: UICollectionViewDelegate,UICollectionViewDataSource{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return result2.events2.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewTableView", for: indexPath) as! CollectionViewCell
//        let event2 = result2.events2[indexPath.row]
//        cell.setCell(event: event2)
//        return cell
//    }
//
//
//}
//extension TblVC: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return collectionView.bounds.size
//    }
//}
