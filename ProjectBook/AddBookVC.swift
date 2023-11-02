//
//  AddBookVC.swift
//  ProjectBook
//
//  Created by Anvila on 31/10/23.
//

import UIKit

class AddBookVC: UIViewController {

    @IBOutlet weak var titlename: UITextField!
    
    @IBOutlet weak var author: UITextField!
    
    @IBOutlet weak var subjectname: UITextField!
    
    @IBOutlet weak var date: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
                
        // Do any additional setup after loading the view.
        
    }
    
     //@IBOutlet weak var author: UITextField!
    //@IBOutlet weak var subjectname: UITextField!
    //@IBOutlet weak var duedate: UITextField!
    
    
    @IBAction func onClickAdd(_ sender: Any) {
        guard let title = titlename.text, !title.isEmpty,
              let author = author.text, !author.isEmpty,
              let subject = subjectname.text, !subject.isEmpty,
              let dueDateText = date.text, !dueDateText.isEmpty
        else {
            self.dismiss(animated: true)
                            {
                                let alert=UIAlertController(title: "Error!", message: "Please fill in all fields", preferredStyle: .alert)
                                alert.addAction(UIAlertAction(title: "OK", style: .default,handler:nil))
                                self.present(alert, animated:true)
                            }
            return }
        
        guard let dueDate = convertToDate(dateString: dueDateText) else {
            self.dismiss(animated: true)
                            {
                                let alert=UIAlertController(title: "Error!", message: "Invalid date format, Please use MMM d, yyyy format eg. Aug 1, 2024", preferredStyle: .alert)
                                alert.addAction(UIAlertAction(title: "OK", style: .default,handler:nil))
                                self.present(alert, animated:true)
                            }
                    //showAlert(message: "Invalid date format. Please use MMM d, yyyy format eg. Aug 1, 2024")
                    return
                }
            let newBook = BookData(context:  DBManager.share.context)
            newBook.title = title
            newBook.author = author
            newBook.subjectname = subject
            newBook.date = dueDate
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
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


