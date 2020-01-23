//
//  ExtentionViewController.swift
//  SmartLab
//
//  Created by maika on 12/2/19.
//  Copyright © 2019 maika. All rights reserved.
//

import ObjectMapper
import MBProgressHUD
extension UIViewController{
    func showAlert(title: String,message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert,animated: true)
    }
    func loadView(){
        let loading = MBProgressHUD.showAdded(to: self.view, animated: true)
        loading.label.text = "LOADING..."
        loading.detailsLabel.text = "feaching data"
        loading.isUserInteractionEnabled = false
        loading.show(animated: true)
    }
    func hideload() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
}

class Result: Mappable{
    var events = [Event]()
    required init?(map: Map) {}
    init() {}
     func mapping(map: Map) {
        events <- map["content.list"]
    }
}

class Event: Mappable{
    init() {}
    var precautions = ""
    var title = ""
    var price = 0.0
    required init?(map: Map) {}
    
     func mapping(map: Map) {
        precautions <- map["precautions"]
        title <- map["title"]
        price <- map["price"]
    }
}

//collection view cell
class Result2: Mappable{
    init(){}
    var events2 = [Event2]()
    required init?(map: Map) {}
    
     func mapping(map: Map) {
        events2 <- map["content.list"]
    }
}
class Event2: Mappable{
    init(){}
    var img = ""
    var title = ""
    var testCount = 0
    var price = 0.0
    required init?(map: Map) {}
    
     func mapping(map: Map) {
        img <- map["image"]
        title <- map["title"]
        testCount <- map["testsCount"]
        price <- map["price"]
    }
}

