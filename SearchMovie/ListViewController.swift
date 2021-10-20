//
//  ListViewController.swift
//  SearchMovie
//
//  Created by yeoboya on 2021/10/15.
//

import UIKit
import Kingfisher
import RxSwift
import RxCocoa

class ListViewController: UIViewController, UITableViewDelegate {
    
    let cellId = "cell"
    let viewModel = ItemListViewModel()
    var disposeBag = DisposeBag()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        viewModel.itemObservable
//            .bind(to: tableView.rx.items(cellIdentifier: "cell", cellType: ListTableViewCell.self)) { index, item, cell in
//
//                cell.thumbnail.kf.setImage(with: URL(string: viewModel.item[item].image))
//                cell.endgame.text = viewModel.item[cell.item].title.htmlEscaped
//                cell.subtitles.text = viewModel.item[cell.item].subtitle
//                cell.date.text = viewModel.item[cell.item].pubDate
//                cell.star.text = viewModel.item[cell.item].userRating
//                cell.directors.text = "감독: \(viewModel.item[cell.item].director.htmlEscaped.replacingOccurrences(of: "|", with: "."))"
//                cell.actors.text = "출연진: \(viewModel.item[cell.item].actor.htmlEscaped.htmlEscaped.replacingOccurrences(of: "|", with: "."))"
//            }
//            .disposed(by: disposeBag)

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.item.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListTableViewCell
        cell.thumbnail.kf.setImage(with: URL(string: viewModel.item[indexPath.item].image))
        cell.endgame.text = viewModel.item[indexPath.item].title.htmlEscaped
        cell.subtitles.text = viewModel.item[indexPath.item].subtitle
        cell.date.text = viewModel.item[indexPath.item].pubDate
        cell.star.text = viewModel.item[indexPath.item].userRating
        cell.directors.text = "감독: \(viewModel.item[indexPath.item].director.htmlEscaped.replacingOccurrences(of: "|", with: "."))"
        cell.actors.text = "출연진: \(viewModel.item[indexPath.item].actor.htmlEscaped.htmlEscaped.replacingOccurrences(of: "|", with: "."))"

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detail") as! DetailViewController
        
        detailVc.item = viewModel.item[indexPath.row]
        
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
