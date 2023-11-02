//
//  updatePageVC.swift
//  ProjectBook
//
//  Created by Anvila on 01/11/23.
//

import UIKit

class updatePageVC: UIViewController {
    
    var book:BookData?
    var TitleDisplay: String?
    var AuthorDisplay: String?
    var SubjectDisplay: String?
    var DuedateDisplay: Date?
    
    @IBOutlet weak var dueDateBox: UITextField!
    @IBOutlet weak var subjectBox: UITextField!
    @IBOutlet weak var authorBox: UITextField!
    @IBOutlet weak var titleBox: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func updateBtn(_ sender: Any) {
        guard let title = titleBox.text, !title.isEmpty,
              let subject = subjectBox.text, !subject.isEmpty,
              let author = authorBox.text, !author.isEmpty,
              let dueDateText = dueDateBox.text, !dueDateText.isEmpty
        else {
            self.dismiss(animated: true)
            {
                let alert=UIAlertController(title: "Error!", message: "Please fill in all fields", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default,handler:nil))
                self.present(alert, animated:true)
            }
            return
        }
        guard let dueDate = convertToDate(dateString: dueDateText) else {
            self.dismiss(animated: true)
            {
                let alert=UIAlertController(title: "Error!", message: "Invalid date format, Please use MMM d, yyyy format eg. Aug 1, 2024", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default,handler:nil))
                self.present(alert, animated:true)
            }
            return
        }
        book?.title = title
        book?.subjectname = subject
        book?.author = author
        book?.date = dueDate
        DBManager.share.saveContext()
        navigationController?.popViewController(animated: true)
    }
    func convertToDate(dateString: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        
        if let date = dateFormatter.date(from: dateString) {
            return date
        } else {
            return nil
        }
    }
    
}
