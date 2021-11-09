//
//  QuestionListViewController.swift
//  QuestionAndAnswerUsingClasses
//
//  Created by english on 2021-10-14.
//

import UIKit

class QuestionListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Registering the nib file we created as a cell in our
        // tableView (like we did in our previous simple list adding prototype cell)
        tableView.register(QuestionTableCellTableViewCell.nib(), forCellReuseIdentifier: QuestionTableCellTableViewCell.identifier)
        
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    
    
    
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Provider.allQuestions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let customCell = tableView.dequeueReusableCell(withIdentifier: QuestionTableCellTableViewCell.identifier, for: indexPath) as! QuestionTableCellTableViewCell
        
        customCell.setCellContent(question: Provider.allQuestions[indexPath.row])
        
        return customCell
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    

}
