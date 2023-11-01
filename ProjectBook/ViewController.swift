//
//  ViewController.swift
//  ProjectBook
//
//  Created by Anvila on 31/10/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var BookDataTableView: UITableView!
    var booksData=[BookData]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        booksData = DBManager.share.fetchBookData()
        BookDataTableView.reloadData()
    }


}
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return booksData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let aBook = booksData[indexPath.row]
        cell.textLabel?.text = aBook.title
        cell.detailTextLabel?.text = aBook.author
        return cell
    }
}



