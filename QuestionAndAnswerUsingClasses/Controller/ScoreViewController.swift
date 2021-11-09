//
//  ScoreViewController.swift
//  QuestionAndAnswerUsingClasses
//
//  Created by english on 2021-10-07.
//

import UIKit

class ScoreViewController: UIViewController {

    public var data : String = ""
    
    @IBOutlet weak var lblMessage: UILabel!
    
    override func viewDidLoad() {
        
        lblMessage.text = data
        super.viewDidLoad()

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
