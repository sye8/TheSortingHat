//
//  QuestionsViewController.swift
//  PersonalityQuiz
//
//  Created by 叶思帆 on 03/07/2017.
//  Copyright © 2017 Sifan Ye. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var currentQuestionLabel: UILabel!
    @IBOutlet weak var quizProgressView: UIProgressView!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    var questionIndex = 0;
    var questions: [Question] = [
        Question(text: "Which of the following would you most hate people to call you?", answers: [
            Answer(text: "Ordinary", type: .Slytherin),
            Answer(text: "Ignorant", type: .Ravenclaw),
            Answer(text: "Selfish", type:.Hufflepuff),
            Answer(text: "Cowardly", type: .Gryffindor)]),
        Question(text: "Once every century, the Flutterby bush produces flowers that adapt their scent to attract the unwary. If it lured you, it would smell of?", answers: [
            Answer(text: "Sea", type: .Slytherin),
            Answer(text: "Parchment", type: .Ravenclaw),
            Answer(text: "Home", type: .Hufflepuff),
            Answer(text: "Log Fire", type: .Gryffindor)]),
        Question(text: "Which road tempts you most?", answers: [
            Answer(text: "Twisting woodsy path", type: .Gryffindor),
            Answer(text: "Lantern-lit alley", type: .Slytherin),
            Answer(text: "Wide sunny grassy path", type: .Hufflepuff),
            Answer(text: "Cobbled ancient buildings path", type: .Ravenclaw)]),
        Question(text: "You and two friends need to cross a bridge guarded by a river troll who insists on fighting one of you before he will let all of you pass. Do you?", answers: [
            Answer(text: "Draw lots", type: .Hufflepuff),
            Answer(text: "Suggest all three fight", type: .Slytherin),
            Answer(text: "Confuse troll", type: .Ravenclaw),
            Answer(text: "Volunteer to fight", type: .Gryffindor)]),
        Question(text: "A Muggle confronts you and says that they are sure you are a witch or wizard. Do youA Muggle confronts you and says that they are sure you are a witch or wizard. Do you?", answers: [
            Answer(text: "Ask what makes them think so", type: .Ravenclaw),
            Answer(text: "Agree, and ask whether they’d like a free sample of a jinx", type: .Slytherin),
            Answer(text: "Agree, and walk away, leaving them to wonder whether you are bluffing", type: .Gryffindor),
            Answer(text: "Tell them that you are worried about their mental health, and offer to call a doctor", type: .Hufflepuff)])
        ]
    
    var answersChosen: [Answer] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        repaint()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonHandler(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        
        switch sender {
            case button1:
                answersChosen.append(currentAnswers[0])
            case button2:
                answersChosen.append(currentAnswers[1])
            case button3:
                answersChosen.append(currentAnswers[2])
            case button4:
                answersChosen.append(currentAnswers[3])
            default:
                break;
        }

        next()
    }
    
    func next(){
        questionIndex += 1
        if questionIndex < questions.count {
            repaint()
        } else {
            performSegue(withIdentifier: "ResultSegue", sender: nil)
        }
    }
    
    func repaint(){
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex)/Float(questions.count)
        
        navigationItem.title = "Question #\(questionIndex+1)"
        currentQuestionLabel.text = currentQuestion.text
        quizProgressView.setProgress(totalProgress, animated: true)
        button1.setTitle(currentAnswers[0].text, for: .normal)
        button2.setTitle(currentAnswers[1].text, for: .normal)
        button3.setTitle(currentAnswers[2].text, for: .normal)
        button4.setTitle(currentAnswers[3].text, for: .normal)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultSegue" {
            let resultsViewController = segue.destination as!
            ResultsViewController
            resultsViewController.responses = answersChosen
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
