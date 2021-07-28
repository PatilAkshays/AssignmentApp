//
//  ListViewController.swift
//  AssignmentApp
//
//  Created by Manish Ingale on 28/07/21.
//

import UIKit



struct RowModel {
    var rowText: String?
    var imageArray: [UIImage] = []
}


class ListViewController: UIViewController {

    var tableViewArray: [RowModel] = [RowModel.init(rowText: "Row", imageArray: [#imageLiteral(resourceName: "placeholderImage"),#imageLiteral(resourceName: "placeholderImage"),#imageLiteral(resourceName: "placeholderImage"),#imageLiteral(resourceName: "placeholderImage"),#imageLiteral(resourceName: "placeholderImage")]), RowModel.init(rowText: "Row", imageArray: [#imageLiteral(resourceName: "placeholderImage"),#imageLiteral(resourceName: "placeholderImage")]),RowModel.init(rowText: "Row", imageArray: [#imageLiteral(resourceName: "placeholderImage"),#imageLiteral(resourceName: "placeholderImage"),#imageLiteral(resourceName: "placeholderImage"),#imageLiteral(resourceName: "placeholderImage")]),RowModel.init(rowText: "Row", imageArray: [#imageLiteral(resourceName: "placeholderImage"),#imageLiteral(resourceName: "placeholderImage"),#imageLiteral(resourceName: "placeholderImage"),#imageLiteral(resourceName: "placeholderImage")]),RowModel.init(rowText: "Row", imageArray: [#imageLiteral(resourceName: "placeholderImage"),#imageLiteral(resourceName: "placeholderImage"),#imageLiteral(resourceName: "placeholderImage"),#imageLiteral(resourceName: "placeholderImage"),#imageLiteral(resourceName: "placeholderImage")]),RowModel.init(rowText: "Row", imageArray: [#imageLiteral(resourceName: "placeholderImage"),#imageLiteral(resourceName: "placeholderImage"),#imageLiteral(resourceName: "placeholderImage")]),RowModel.init(rowText: "Row", imageArray: [#imageLiteral(resourceName: "placeholderImage"),#imageLiteral(resourceName: "placeholderImage"),#imageLiteral(resourceName: "placeholderImage"),#imageLiteral(resourceName: "placeholderImage"),#imageLiteral(resourceName: "placeholderImage")])]

    @IBOutlet weak var tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ListViewController: UITableViewDelegate,
                              UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        let task = tableViewArray[indexPath.row]
        cell.rowTitleLbl?.text = "\(task.rowText ?? "Row") \(indexPath.row + 1)"
        cell.imageArray = task.imageArray
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let task = tableViewArray[indexPath.row]
        
        var divide = task.imageArray.count / 3
        let reminder = task.imageArray.count % 3
        
        if reminder > 0 {
            divide += 1
        }
        
        return CGFloat(120 * divide) + 40
    }
}
