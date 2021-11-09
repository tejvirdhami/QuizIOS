//
//  ViewController.swift
//  QuestionAndAnswerUsingClasses
//
//  Created by user203175 on 8/22/21.
//

import UIKit

class ViewController: UIViewController {

    var questions : Array<Question> = []
    var questionIndex : Int = -1
    var score : Int = 0
    var scorepercent : Int = 0
    var message : String = ""

    @IBAction func btnAbout(_ sender: Any) {
        
        
        
    }
    
    @IBAction func btnShowResult(_ sender: Any) {
        return
    }
    
    @IBOutlet weak var btnShowResults: UIButton!
    @IBOutlet weak var btnAbout: UIButton!
    @IBOutlet weak var lblQuestion: UILabel!
    
    @IBOutlet weak var lblAnswerExtraInfo: UILabel!
    
    @IBOutlet weak var lblQuestionNumber: UILabel!
        
    @IBOutlet weak var lblScore: UILabel!
    
    @IBOutlet weak var btnNextQuestion: UIButton!
    
    @IBOutlet weak var btnTrue: UIButton!
    
    @IBOutlet weak var btnFalse: UIButton!
    
    @IBAction func btnTrue(_ sender: Any) {
        checkAnswer( answer : true )
    }
    
    @IBAction func btnFalse(_ sender: Any) {
        checkAnswer( answer : false )
    }
    
    @IBAction func btnNextQueston(_ sender: Any) {
        nextQuestion()
    }
    

    
    func customizeTheme(){
        
        let cornerRadius : CGFloat = 10
        
        btnTrue.layer.cornerRadius = cornerRadius
        btnFalse.layer.cornerRadius = cornerRadius
        btnNextQuestion.layer.cornerRadius = cornerRadius
        btnAbout.layer.cornerRadius = cornerRadius
        
        lblAnswerExtraInfo.layer.masksToBounds = true
        lblAnswerExtraInfo.layer.cornerRadius = cornerRadius
    }

    
    func resetView(){
        lblAnswerExtraInfo.isHidden = true
        btnNextQuestion.isHidden = true
        btnTrue.isHidden = false
        btnFalse.isHidden = false
    }
    
    func nextQuestion(){
        
        resetView()
        
        questionIndex += 1
        if questionIndex < questions.count {
            
            lblScore.text = "Score : \(score)"

            lblQuestionNumber.text = "Question \(questionIndex + 1) of \(questions.count)"
            
            lblQuestion.text = questions[questionIndex].question + "?"
            
        }
        else {
            lblQuestion.isHidden = true
            btnTrue.isHidden = true
            btnFalse.isHidden = true
            btnNextQuestion.isHidden = true
            btnShowResults.isHidden = false
        }
        
    }
    
    func checkAnswer( answer : Bool ) {
        
        if !lblAnswerExtraInfo.isHidden {
            // user is answering after the answer is presented - don't count!
            return
        }
        if questionIndex < questions.count {
        // adding right answer to score
        answer == questions[questionIndex].answer ? score += 1 : nil
      
        lblAnswerExtraInfo.text =  "This is " + String(questions[questionIndex].answer).uppercased() + ".\n\n" + questions[questionIndex].answerExtraInfo
        
        lblAnswerExtraInfo.isHidden = false
        
        if questions[questionIndex].answer == true {
            btnFalse.isHidden = true
        } else {
            btnTrue.isHidden = true
        }
    
        btnNextQuestion.isHidden = false
        
        lblScore.text = "Score : \(score)"
        }
        else{
            
            return
        }
        
       
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        btnShowResults.isHidden = true
        customizeTheme()
        
        questions = Provider.loadQuestions()
        
        nextQuestion()
        
    }
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "ToScoreView"
        {
            let ScoreViewController =
             segue.destination as!
                ScoreViewController
            
            scorepercent = score/25 * 100
            
            switch scorepercent {
            case 0..<20:
                 message = "Ooooh! You are terrible! \n You scored \(scorepercent)% \n"
                ScoreViewController.data = message
            case 20..<60:
                 message = "Try it again! \n You scored \(scorepercent)% \n"
                ScoreViewController.data = message
            case 60..<80:
                 message = "You can do it better! \n You scored \(scorepercent)% \n"
                ScoreViewController.data = message
            case 80..<100:
                 message = "Congratulations! \n You scored \(scorepercent)% \n"
                ScoreViewController.data = message
            default:
                 message = "Ann error Occured! \n"
            }
            
            ScoreViewController.data = message
            
        }
    }


}

