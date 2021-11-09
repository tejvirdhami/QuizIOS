//
//  QuestionTableCellTableViewCell.swift
//  QuestionAndAnswerUsingClasses
//
//  Created by english on 2021-10-14.
//

import UIKit

class QuestionTableCellTableViewCell: UITableViewCell {
    
    static let identifier = "QuestionTableCellTableViewCell"

    @IBOutlet weak var lblQuestion: UILabel!
    
    @IBOutlet weak var lblInfo: UILabel!
    
    @IBOutlet weak var imgAnswer: UIImageView!
    
    
    //This func is used to call the nib we defined as a custom UI
    //For our cell
    static func nib() -> UINib
    {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    
    //This function will handle the data inside our XIB/NIB
    //file (cell/row)
    public func setCellContent(question : Question){
        
        lblQuestion.text = question.question
        lblInfo.text = question.answerExtraInfo
        
        if question.answer == true {
            imgAnswer.image = UIImage(systemName: "checkmark.square")
            imgAnswer.tintColor = UIColor.systemBlue
        } else {
            imgAnswer.image = UIImage(systemName: "xmark.square")
            imgAnswer.tintColor = UIColor.systemRed
        }
        
        
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
