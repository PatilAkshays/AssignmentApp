//
//  ViewController.swift
//  AssignmentApp
//
//  Created by Manish Ingale on 28/07/21.
//

import UIKit

class ViewController: UIViewController {

    var taskArray = ["Table view With collection View", "Login Screen"]
    @IBOutlet weak var tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Demo"
        
        //Confirm the Protocol
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let task = taskArray[indexPath.row]
        cell?.textLabel?.text = task
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let listDetailsVC = storyBoard.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
            self.navigationController?.pushViewController(listDetailsVC, animated: true)
        }else {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let loginViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            self.navigationController?.pushViewController(loginViewController, animated: true)
        }
        
       
        
    }
    
}
