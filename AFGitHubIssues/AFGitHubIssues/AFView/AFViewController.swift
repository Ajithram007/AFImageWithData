//
//  AFViewController.swift
//  AFGitHubIssues
//
//  Created by Ajithram on 02/12/20.
//

import UIKit

class AFViewController: CustomTableViewController {
    var model: [AFDatas]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension AFViewController {
    override func handler(_ handler: TableViewHandler, registerTableViewCells tableView: UITableView) {
        tableView.register(UINib(nibName: "AFTableViewCell", bundle: nil), forCellReuseIdentifier: "AFTableViewCell")
    }
    
    override func prepareDataSourceForHandler(_ handler: TableViewHandler) -> [TableViewCellData] {
        var dataSource = [TableViewCellData]()
        dataSource.append(contentsOf: prepareData(dataSource: dataSource))
        return dataSource
    }
    
    func prepareData(dataSource: [TableViewCellData]) -> [TableViewCellData] {
        var datas = dataSource
        if let afData = model {
            for (index,_) in afData.enumerated() {
                let afTableViewCelldata = AFTableViewModel(title: afData[index].title, creationTime:   afData[index].created_at, loginName:  afData[index].user?.login)
                
                downLoadImage(from: afData[index].user?.avatar_url ?? "", model: afTableViewCelldata)
                datas.append(TableViewCellData("AFTableViewCell", data:afTableViewCelldata ))
            }
        }
        return datas
    }
}

extension AFViewController {
    func downLoadImage(from url: String, model: AFTableViewModel?) {
        guard let imageURL = URL(string: url) else { return }
        // just not to cause a deadlock in UI!
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                model?.avatherImage = image
            }
        }
    }
}
