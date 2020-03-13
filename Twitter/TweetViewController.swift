//
//  TweetViewController.swift
//  Twitter
//
//  Created by Nada Zeini on 3/12/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetTextView.becomeFirstResponder()
    }
    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func tweetAction(_ sender: Any) {
        if(!tweetTextView.text.isEmpty){
            TwitterAPICaller.client?.postTweet(tweetString: tweetTextView.text, success:{ self.dismiss(animated: true, completion: nil)}, failure: { (error) in
                print("Error in posting tweet \(error)")
            })
        } else{
            self.dismiss(animated: true, completion: nil)
        }
    }
    @IBOutlet weak var tweetTextView: UITextView!
    
}
