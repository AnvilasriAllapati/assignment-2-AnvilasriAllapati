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
        if let titlename = titlename.text, let author = author.text, let subjectname = subjectname.text{
            let newBook = BookData(context:  DBManager.share.context)
            newBook.title = titlename
            newBook.author = author
            newBook.subjectname = subjectname
            DBManager.share.saveContext()
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

}
