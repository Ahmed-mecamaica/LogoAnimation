//
//  ViewController.swift
//  SmartLab
//
//  Created by maika on 12/2/19.
//  Copyright © 2019 maika. All rights reserved.
//
//
//import UIKit
//import ObjectMapper
//import MBProgressHUD
//
//class MainVC: UIViewController {
//    @IBOutlet var tblView:UITableView!
//    @IBOutlet var collView: UICollectionView!
//    var result = Result()
//     var result2 = Result2()
//
//    deinit{
//        print("UIViewController deinit")
//    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        loadEvent()
//        loadCol()
//    }
//
//    func loadEvent(){
//        let nib = UINib.init(nibName: "EventTableViewCell", bundle: .main)
//        tblView.register(nib, forCellReuseIdentifier: "EventTableViewCell")
//        loadTblView()
//
//    }
//
//    func loadTblView(){
//        loadView()
//        API.getEvent(onSuccess:{[weak self](events) in
//            guard let self = self else{ return }
//            self.hideload()
//            self.result.events = events
//            self.tblView.reloadData()
//        }){[weak self](error)in
//            guard let self = self else{return}
//            self.hideload()
//            self.showAlert(title: "Error", message: error.localizedDescription)
//            //          [weak self]  guard let self = self else { return }
//
//        }
//    }
//   func loadCol(){
//    let nib2 = UINib.init(nibName: "CollectionViewCell", bundle: .main)
//    collView.register(nib2, forCellWithReuseIdentifier: "CollectionViewCell")
//    loadcolView()
//    }
//    func loadcolView(){
//        loadView()
//        API.getCell(onSuccess:{[weak self](events2) in
//            guard let self = self else{return}
//            self.hideload()
//            self.result2.events2 = events2
//            self.collView.reloadData()
//
//        }) {[weak self](error)in
//            guard let self = self else{return}
//            self.hideload()
//            self.showAlert(title: "Error", message: error.localizedDescription)
//        }
//    }
//}
//extension MainVC: UITableViewDelegate,UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return result.events.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "EventTableViewCell") as! EventTableViewCell
//        let event = result.events[indexPath.row]
//        cell.setEvent(event: event)
//        return cell
//    }
//}
//
//extension MainVC: UICollectionViewDelegate,UICollectionViewDataSource{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return result2.events2.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
//        let event2 = result2.events2[indexPath.row]
//        cell.setCell(event: event2)
//        return cell
//    }
//
//
//}
//extension MainVC: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return collectionView.bounds.size
//    }
//}
//
