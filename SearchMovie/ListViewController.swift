//
//  ListViewController.swift
//  SearchMovie
//
//  Created by yeoboya on 2021/10/15.
//

import UIKit
import Kingfisher

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var item: [Item]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListTableViewCell
        cell.thumbnail.kf.setImage(with: URL(string: item[indexPath.item].image))
        cell.endgame.text = item[indexPath.item].title.htmlEscaped
        cell.subtitles.text = item[indexPath.item].subtitle
        cell.date.text = item[indexPath.item].pubDate
        cell.star.text = item[indexPath.item].userRating
        cell.directors.text = item[indexPath.item].director.htmlEscaped
        cell.actors.text = item[indexPath.item].actor.htmlEscaped
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detail") as! DetailViewController
        
        detailVc.modalPresentationStyle = .overFullScreen
        self.present(detailVc, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    @IBAction func dimissList(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension String {
    // html 태그 제거 + html entity들 디코딩.
    var htmlEscaped: String {
        guard let encodedData = self.data(using: .utf8) else {
            return self
        }
        
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]
        
        do {
            let attributed = try NSAttributedString(data: encodedData,
                                                    options: options,
                                                    documentAttributes: nil)
            return attributed.string
        } catch {
            return self
        }
    }
}
