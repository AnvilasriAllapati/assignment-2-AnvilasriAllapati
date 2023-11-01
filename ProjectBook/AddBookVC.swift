//
//  AddBookVC.swift
//  ProjectBook
//
//  Created by Anvila on 31/10/23.
//

import UIKit

class AddBookVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
                
        // Do any additional setup after loading the view.
        
    }
    @IBOutlet weak var titlename: UITextField!
    @IBOutlet weak var author: UITextField!
    @IBOutlet weak var subjectname: UITextField!
    @IBOutlet weak var duedate: UIDatePicker!
    
    @IBAction func onClickAdd(_ sender: Any) {
        
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
