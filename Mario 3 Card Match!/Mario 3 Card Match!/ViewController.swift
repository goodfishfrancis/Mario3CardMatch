//
//  ViewController.swift
//  Mario 3 Card Match!
//
//  Created by Alexander Solinger on 2/23/19.
//  Copyright © 2019 Alexander Solinger. All rights reserved.
//

import UIKit
import AVKit


class SoundManager {
    
    static let instance = SoundManager();
    
    var player: AVAudioPlayer?
    
    func playSound(sound: String) {
        
        guard let url = Bundle.main.url(forResource: sound,
                                        withExtension: ".wav") else {return};
//        guard let url = URL(string: "") else {return};
        
        do {
            player = try AVAudioPlayer(contentsOf: url);
            player?.play();
        }
        catch let error {
            print("Error playing sound... \(error.localizedDescription)");
        }
        
    }
    
}


class ViewController: UIViewController {
    
    // this array contains the names of the images for
    // the cards
    var cardImageArray : [String] = ["flower", "flower", "flower", "flower", "mushroom", "mushroom", "mushroom", "mushroom", "oneUp", "oneUp", "star", "star", "star", "star", "tenCoin", "tenCoin","twentyCoin", "twentyCoin"];
    
    // this dictionary maps the values for scoring
    var cardValues = ["mushroom": 1, "flower": 2, "star": 5, "oneUp": 7, "tenCoin": 10, "twentyCoin": 20];
    
    
    var lastCardFlippedIndex : Int?;
    var matchComboMultiplier : Int = 1;
    @IBOutlet weak var lblScore: UILabel!
    var score : Int = 0;
    var missCount : Int = 0;
    var matchCount : Int = 0;
    var firstFlip = true;
    var previousRoundScore = 0;
    var roundCount = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // start new round
        newRound();
        
        // display score
        lblScore.text = "\(Int(score))"
    }

 
    @IBOutlet weak var btnCardImg_0: UIButton!
    @IBAction func btnCardFlip_0(_ sender: UIButton) {
        if (btnCardImg_0.currentImage!.isEqual(UIImage(named: "cardBack"))) {
            cardFlip(index: 0, btnCard: btnCardImg_0);
            processCardFlipResult(index: 0, btnCard: btnCardImg_0);
        }
        
        
    }
    
    
    @IBOutlet weak var btnCardImg_1: UIButton!
    @IBAction func btnCardFlip_1(_ sender: UIButton) {
        if (btnCardImg_1.currentImage!.isEqual(UIImage(named: "cardBack"))) {
            cardFlip(index: 1,btnCard: btnCardImg_1);
            processCardFlipResult(index: 1, btnCard: btnCardImg_1);
        }
        
        
    }
    
    @IBOutlet weak var btnCardImg_2: UIButton!
    @IBAction func btnCardFlip_2(_ sender: UIButton) {
        if (btnCardImg_2.currentImage!.isEqual(UIImage(named: "cardBack"))) {
            cardFlip(index: 2, btnCard: btnCardImg_2);
            processCardFlipResult(index: 2, btnCard: btnCardImg_2);

        }
    }
    
    
    @IBOutlet weak var btnCardImg_3: UIButton!
    @IBAction func btnCardFlip_3(_ sender: UIButton) {
        if (btnCardImg_3.currentImage!.isEqual(UIImage(named: "cardBack"))) {
            cardFlip(index: 3, btnCard: btnCardImg_3);
            processCardFlipResult(index: 3, btnCard: btnCardImg_3);
        }
    }
    
    @IBOutlet weak var btnCardImg_4: UIButton!
    @IBAction func btnCardFlip_4(_ sender: UIButton) {
        if (btnCardImg_4.currentImage!.isEqual(UIImage(named: "cardBack"))) {
            cardFlip(index: 4, btnCard: btnCardImg_4);
            processCardFlipResult(index: 4, btnCard: btnCardImg_4)
        }
    }
    
    @IBOutlet weak var btnCardImg_5: UIButton!
    @IBAction func btnCardFlip_5(_ sender: UIButton) {
        if (btnCardImg_5.currentImage!.isEqual(UIImage(named: "cardBack"))) {
            cardFlip(index: 5, btnCard: btnCardImg_5);
            processCardFlipResult(index: 5, btnCard: btnCardImg_5);
        }
    }
    
    
    @IBOutlet weak var btnCardImg_6: UIButton!
    @IBAction func btnCardFlip_6(_ sender: UIButton) {
        if (btnCardImg_6.currentImage!.isEqual(UIImage(named: "cardBack"))) {
            cardFlip(index: 6, btnCard: btnCardImg_6);
            processCardFlipResult(index: 6, btnCard: btnCardImg_6);
        }
    }
    
    @IBOutlet weak var btnCardImg_7: UIButton!
    @IBAction func btnCardFlip_7(_ sender: UIButton) {
        if (btnCardImg_7.currentImage!.isEqual(UIImage(named: "cardBack"))) {
            cardFlip(index: 7, btnCard: btnCardImg_7);
            processCardFlipResult(index: 7, btnCard: btnCardImg_7);
        }
    }
    
    @IBOutlet weak var btnCardImg_8: UIButton!
    @IBAction func btnCardFlip_8(_ sender: UIButton) {
        if (btnCardImg_8.currentImage!.isEqual(UIImage(named: "cardBack"))) {
            cardFlip(index: 8, btnCard: btnCardImg_8);
            processCardFlipResult(index: 8, btnCard: btnCardImg_8);
        }
    }
    
    
    @IBOutlet weak var btnCardImg_9: UIButton!
    @IBAction func btnCardFlip_9(_ sender: UIButton) {
        if (btnCardImg_9.currentImage!.isEqual(UIImage(named: "cardBack"))) {
            cardFlip(index: 9, btnCard: btnCardImg_9);
            processCardFlipResult(index: 9, btnCard: btnCardImg_9);
        }
    }
    
    @IBOutlet weak var btnCardImg_10: UIButton!
    @IBAction func btnCardFlip_10(_ sender: UIButton) {
        if (btnCardImg_10.currentImage!.isEqual(UIImage(named: "cardBack"))) {
            cardFlip(index: 10, btnCard: btnCardImg_10);
            processCardFlipResult(index: 10, btnCard: btnCardImg_10);
        }
    }
    
    @IBOutlet weak var btnCardImg_11: UIButton!
    @IBAction func btnCardFlip_11(_ sender: UIButton) {
        if (btnCardImg_11.currentImage!.isEqual(UIImage(named: "cardBack"))) {
            cardFlip(index: 11, btnCard: btnCardImg_11);
            processCardFlipResult(index: 11, btnCard: btnCardImg_11);
        }
    }
    
    @IBOutlet weak var btnCardImg_12: UIButton!
    @IBAction func btnCardFlip_12(_ sender: UIButton) {
        if (btnCardImg_12.currentImage!.isEqual(UIImage(named: "cardBack"))) {
            cardFlip(index: 12, btnCard: btnCardImg_12);
            processCardFlipResult(index: 12, btnCard: btnCardImg_12);
        }
    }
    
    @IBOutlet weak var btnCardImg_13: UIButton!
    @IBAction func btnCardFlip_13(_ sender: UIButton) {
        if (btnCardImg_13.currentImage!.isEqual(UIImage(named: "cardBack"))) {
            cardFlip(index: 13, btnCard: btnCardImg_13);
            processCardFlipResult(index: 13, btnCard: btnCardImg_13);
        }
    }
    
    @IBOutlet weak var btnCardImg_14: UIButton!
    @IBAction func btnCardFlip_14(_ sender: UIButton) {
        if (btnCardImg_14.currentImage!.isEqual(UIImage(named: "cardBack"))) {
            cardFlip(index: 14, btnCard: btnCardImg_14);
            processCardFlipResult(index: 14, btnCard: btnCardImg_14);
        }
    }
    
    @IBOutlet weak var btnCardImg_15: UIButton!
    @IBAction func btnCardFlip_15(_ sender: UIButton) {
        if (btnCardImg_15.currentImage!.isEqual(UIImage(named: "cardBack"))) {
            cardFlip(index: 15, btnCard: btnCardImg_15);
            processCardFlipResult(index: 15, btnCard: btnCardImg_15);
        }
    }
    
    @IBOutlet weak var btnCardImg_16: UIButton!
    @IBAction func btnCardFlip_16(_ sender: UIButton) {
        if (btnCardImg_16.currentImage!.isEqual(UIImage(named: "cardBack"))) {
            cardFlip(index: 16, btnCard: btnCardImg_16);
            processCardFlipResult(index: 16, btnCard: btnCardImg_16);
        }
    }
    
    @IBOutlet weak var btnCardImg_17: UIButton!
    @IBAction func btnCardFlip_17(_ sender: UIButton) {
        if (btnCardImg_17.currentImage!.isEqual(UIImage(named: "cardBack"))) {
            cardFlip(index: 17, btnCard: btnCardImg_17);
            processCardFlipResult(index: 17, btnCard: btnCardImg_17);
        }
    }
    
    // we will call this function in each button function if the btnCard can
    // be flipped
    // this function sets the image of the button from the cardBack image to
    // the face image that corresponds to the index passed in
    func cardFlip(index: Int, btnCard: UIButton) {
        SoundManager.instance.playSound(sound: "smb3_inventory_open_close");
        let image = UIImage(named: cardImageArray[index])
        btnCard.setImage(image, for: .normal)
        UIView.transition(with: btnCard, duration: 0.3, options: [.transitionFlipFromLeft, .showHideTransitionViews], animations: nil, completion: nil);
    }
    
    func cardFlipBack(index: Int, btnCard: UIButton) {
        let image = UIImage(named: "cardBack")
        btnCard.setImage(image, for: .normal)
        UIView.transition(with: btnCard, duration: 0.3, options: [.transitionFlipFromLeft, .showHideTransitionViews], animations: nil, completion: nil);
    }
    
    func processCardFlipResult(index: Int, btnCard: UIButton) {
        
        let btnCardArray = [btnCardImg_0, btnCardImg_1, btnCardImg_2, btnCardImg_3, btnCardImg_4, btnCardImg_5, btnCardImg_6, btnCardImg_7, btnCardImg_8, btnCardImg_9, btnCardImg_10, btnCardImg_11, btnCardImg_12, btnCardImg_13, btnCardImg_14, btnCardImg_15, btnCardImg_16, btnCardImg_17];
        
        // check that card is second card to be flipped
        // for current turn
        if (firstFlip == false) {
            
            // if the card flipped matches the last card
            // flipped...
            let flippedCard = cardImageArray[index];
            if (flippedCard == cardImageArray[lastCardFlippedIndex!]) {
                if (flippedCard == "oneUp") {
                    SoundManager.instance.playSound(sound: "smb3_1-up");
                }
                else if (flippedCard == "tenCoin" || flippedCard == "twentyCoin") {
                    SoundManager.instance.playSound(sound: "smb3_coin");
                }
                else {
                    SoundManager.instance.playSound(sound: "smb3_nspade_match");
                }
                // increment matchCount
                matchCount += 1;
                
                // set matchComboMultiplier to matchCount
                matchComboMultiplier = matchCount;
                
                // add (card match value * multiplier) to score
                score = score + (cardValues[cardImageArray[index]]!) * matchComboMultiplier;
                
                // display new score
                lblScore.text = "\(Int(score))";
                
                
                // set firstFlip to true for next turn
                firstFlip = true;
                
                // if the user has won, reset missCount, matchCount, multiplier and shuffle board
                // user keeps score
                if (checkForWin() == true) {
                    
                    // set previousRoundScore to score before going into next round
                    previousRoundScore = score;
                    
                    // alert user that new round will begin
                    let alertController = UIAlertController(title: "New Round", message: "Congratulations! You won! Proceed to the next round...", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alertController, animated: true, completion: nil)
                    SoundManager.instance.playSound(sound: "smb3_level_clear");
                    
                    // start new round
                    let seconds = 4.0
                    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                        // Put your code which should be executed with a delay here
                        self.newRound();
                    }
                    
                }
            }
                
            // otherwise flip was a miss
            else {
                SoundManager.instance.playSound(sound: "smb3_bonus_game_no_match");
                // increment missCount
                missCount += 1;
                
                // if missCount == 2, alert
                // user of softReset() and do softReset()
                if (missCount == 2) {
                    let seconds = 1.0
                    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                        // Put your code which should be executed with a delay here
                        let alertController = UIAlertController(title: "Miss Limit", message: "You've missed twice! Try again!", preferredStyle: .alert)
                        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alertController, animated: true, completion: nil)
                        SoundManager.instance.playSound(sound: "smb3_game_over");
                        self.softReset();
                    }
                    
                    
                }
                    
                // otherwise miss was first miss so flip back last two cards
                // set lastCardFlipped to nil
                // set matchCount = 0
                // set matchComboMultiplier = 0
                // set firstFlip == true for beginning of next turn
                else {
                    
                    // get index and name of lastCardFlipped and flip back
                    let lastBtnCardFlipped = btnCardArray[lastCardFlippedIndex!];
                    
                    let seconds = 0.5
                    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                        // Put your code which should be executed with a delay here
                        
                        // flip back first card
                        self.cardFlipBack(index: index, btnCard: btnCard);
                        self.cardFlipBack(index: self.lastCardFlippedIndex!, btnCard: lastBtnCardFlipped!);
                        self.lastCardFlippedIndex = nil;
                        self.firstFlip = true;
                        self.matchCount = 0;
                        self.matchComboMultiplier = 0;
                    }
                    
                }
            }
        }
        
        // otherwise it's the first flip of the turn
        // so set firstFlip == false and set lastCardFlippedIndex to current card index
        else {
            firstFlip = false;
            lastCardFlippedIndex = index;
        }
    }
    
    // this function resets all cards to face down and
    // sets score == 0 but does not shuffle the board
    func softReset() {
        // create array of all cards
        let btnCardArray = [btnCardImg_0, btnCardImg_1, btnCardImg_2, btnCardImg_3, btnCardImg_4, btnCardImg_5, btnCardImg_6, btnCardImg_7, btnCardImg_8, btnCardImg_9, btnCardImg_10, btnCardImg_11, btnCardImg_12, btnCardImg_13, btnCardImg_14, btnCardImg_15, btnCardImg_16, btnCardImg_17];
        
        // initialize count for loop and flip each card in
        // array back over then increment count
        var count = 0;
        for btnCard in btnCardArray {
            cardFlipBack(index: count, btnCard: btnCard!)
            count = count + 1;
        }
        
        // reset score, matchCount, missCount, lblScore
        // to zero and firstFlip to true
        score = previousRoundScore;
        lblScore.text = "\(score)";
        matchCount = 0;
        missCount = 0;
        matchComboMultiplier = 0;
        firstFlip = true;
        lastCardFlippedIndex = nil;
    }
    
    
    // this function will reset all stats and reshuffle the board
    @IBAction func btnReset(_ sender: UIButton) {
        
        // create array of all cards
        let btnCardArray = [btnCardImg_0, btnCardImg_1, btnCardImg_2, btnCardImg_3, btnCardImg_4, btnCardImg_5, btnCardImg_6, btnCardImg_7, btnCardImg_8, btnCardImg_9, btnCardImg_10, btnCardImg_11, btnCardImg_12, btnCardImg_13, btnCardImg_14, btnCardImg_15, btnCardImg_16, btnCardImg_17];
        
        // initialize count for loop and flip each card in
        // array back over then increment count
        var count = 0;
        for btnCard in btnCardArray {
            cardFlipBack(index: count, btnCard: btnCard!)
            count = count + 1;
        }
        
        // reset score, previousRoundScore, matchCount, missCount, lblScore
        // to zero and firstFlip to true
        score = 0;
        lblScore.text = "\(score)";
        matchCount = 0;
        missCount = 0;
        firstFlip = true;
        lastCardFlippedIndex = nil;
        matchComboMultiplier = 1;
        previousRoundScore = 0;
        
        // shuffle deck
        cardImageArray.shuffle();
    }
    
    @IBAction func unwindHelp(unwindSegue: UIStoryboardSegue){
        
    }

    
    
    // this function checks all cards on the board
    // if every card is turned over the round is over
    // returns true if round has been won
    func checkForWin()->Bool {
        var isWinner : Bool = true;
        
        // create array of all cards
        let btnCardArray = [btnCardImg_0, btnCardImg_1, btnCardImg_2, btnCardImg_3, btnCardImg_4, btnCardImg_5, btnCardImg_6, btnCardImg_7, btnCardImg_8, btnCardImg_9, btnCardImg_10, btnCardImg_11, btnCardImg_12, btnCardImg_13, btnCardImg_14, btnCardImg_15, btnCardImg_16, btnCardImg_17];
        
        var count = 0;
        for btnCard in btnCardArray {
            if ((btnCard?.currentImage!.isEqual(UIImage(named: "cardBack")))!) {
                isWinner = false;
            }
            count = count + 1;
        }
        
        return isWinner;
    }
    
    
    // this function creates a new round
    // user keeps score from previous round
    func newRound() {
        SoundManager.instance.playSound(sound: "smb3_enter_level");
        roundCount += 1;
        // create array of all cards
        let btnCardArray = [btnCardImg_0, btnCardImg_1, btnCardImg_2, btnCardImg_3, btnCardImg_4, btnCardImg_5, btnCardImg_6, btnCardImg_7, btnCardImg_8, btnCardImg_9, btnCardImg_10, btnCardImg_11, btnCardImg_12, btnCardImg_13, btnCardImg_14, btnCardImg_15, btnCardImg_16, btnCardImg_17];
        
        // initialize count for loop and flip each card in
        // array back over then increment count
        var count = 0;
        for btnCard in btnCardArray {
            cardFlipBack(index: count, btnCard: btnCard!)
            count = count + 1;
        }
        
        // reset everything except for score
        // set previousRoundScore == score
        matchCount = 0;
        missCount = 0;
        firstFlip = true;
        lastCardFlippedIndex = nil;
        matchComboMultiplier = 1;
        score = previousRoundScore;
        
        // shuffle deck
        cardImageArray.shuffle();
    }
    
}

