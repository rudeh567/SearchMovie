//
//  DetailViewController.swift
//  SearchMovie
//
//  Created by yeoboya on 2021/10/15.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher
import SwiftUI

class DetailViewController: UIViewController {

    var item: Item!
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var director: UILabel!
    @IBOutlet weak var actress: UILabel!
    @IBOutlet weak var starPoint: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imgView.kf.setImage(with: URL(string: item.image))
        topLabel.text = item.title.htmlEscaped
        contentLabel.text = item.subtitle.htmlEscaped
        director.text = "감독: \((item.director).replacingOccurrences(of: "|", with: "."))"
        actress.text = "출연진: \((item.actor).replacingOccurrences(of: "|", with: "."))"
        starPoint.text = item.userRating
    }
    
    @IBAction func dimissDetail(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
