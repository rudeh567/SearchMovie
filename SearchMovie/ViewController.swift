//
//  ViewController.swift
//  SearchMovie
//
//  Created by yeoboya on 2021/10/15.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var movieSearch: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getMovie(_ sender: Any) {
        
        let params = ["query" : "\(movieSearch.text!)", "display" : "6"]
        
        AF.request(URL(string: "https://openapi.naver.com/v1/search/movie.json")!, method: .get, parameters: params, encoding: URLEncoding.default, headers: ["X-Naver-Client-id": "8tVP2Ab_AWUtW3dfaXd0", "X-Naver-Client-Secret": "hQTR9tllnO"]).responseJSON { response in
            
            switch response.result {
                
            case.success(let response):
                print(response)
                do {
                    let data = try JSONSerialization.data(withJSONObject: response, options: .prettyPrinted)
                    let result = try JSONDecoder().decode(ItemResponse.self, from: data)
                    let listVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "list") as! ListViewController
                    
                    listVc.viewModel.item = result.items
                    
                    listVc.modalPresentationStyle = .overFullScreen
                    self.present(listVc, animated: true, completion: nil)
                } catch DecodingError.typeMismatch(let type, let context) {
                    print("\(type), \(context)")
                } catch DecodingError.keyNotFound(let key, let context) {
                    print(key,context)
                }
            catch {
                print(error.localizedDescription)
            }
            case.failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}

