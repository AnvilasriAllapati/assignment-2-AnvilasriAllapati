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
        let data = DBManager.share.fetchBookData()
        let sortedData = data.sorted { $0.date! < $1.date! }
        booksData = sortedData
        DispatchQueue.main.async {
            self.BookDataTableView.reloadData()
        }
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return booksData.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            BookDataTableView.deselectRow(at: indexPath, animated: true)
            let sheet = UIAlertController(title: nil, message: nil , preferredStyle: .actionSheet)
            sheet.addAction(UIAlertAction(title: "View Details", style: .default, handler: { _ in
                let data = self.booksData[indexPath.row]
                let alert=UIAlertController(title: "Book Details", message:
                                                "Title: \(data.title!) \n Author: \(data.author!) \n Subject Name: \(data.subjectname!) \n Due Date: \(self.convertDateToString(date: data.date!))", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default,handler:nil))
                self.present(alert, animated:true)
                
            } ))
            sheet.addAction(UIAlertAction(title: "Update", style: .default,handler: { _ in
                let data = self.booksData[indexPath.row]
                if let vc = self.storyboard?.instantiateViewController(withIdentifier: "updatePageVC") as? updatePageVC {
                    vc.book = data
                    vc.TitleDisplay = data.title
                    vc.AuthorDisplay = data.author
                    vc.SubjectDisplay = data.subjectname
                    vc.DuedateDisplay = data.date
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }))
            self.present(sheet, animated: true, completion: nil)
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let aBook = booksData[indexPath.row]
        cell.textLabel?.text = aBook.title
        cell.detailTextLabel?.text = convertDateToString(date: aBook.date!)
        return cell
    }
    func convertDateToString(date: Date) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM d, yyyy"
            let dateString = dateFormatter.string(from: date)
            return dateString
        }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
        {
            if editingStyle == UITableViewCell.EditingStyle.delete
            {
                do{
                    DBManager.share.context.delete(booksData[indexPath.row])
                }
                DBManager.share.saveContext()
                booksData.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            
        }
}



