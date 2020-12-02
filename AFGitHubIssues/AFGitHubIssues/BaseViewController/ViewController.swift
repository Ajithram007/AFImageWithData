//
//  ViewController.swift
//  AFGitHubIssues
//
//  Created by Ajithram on 02/12/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var navigateWithViper: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapButton(_ sender: UIButton) {
        makeApiService()
    }
    
    func apiSuccess(model: [AFDatas]?) {
        let afview = AFViewController()
        afview.model = model
        self.present(afview, animated: true, completion: nil)
    }
    
}

extension ViewController {
    func makeApiService() {
        guard let url = URL(string: "https://api.github.com/repos/Alamofire/Alamofire/issues") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let mydata = data {
                print(mydata)
                if let afDatas = try? JSONDecoder().decode([AFDatas].self, from: mydata){
                    DispatchQueue.main.async {
                        self.apiSuccess(model: afDatas)
                    }
                    return
                }
                print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
            }
        }.resume()
    }
}
