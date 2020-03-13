//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Nada Zeini on 3/5/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var tweetsContent: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favButton: UIButton!
    var favorited:Bool = false
    var tweetId:Int = -1
    
    @IBAction func actionFavTweet(_ sender: Any) {
        let toBeFavorited = !favorited
        if(toBeFavorited){
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(true)
            }, failure: { (error) in
                 print("Favorite did not succeed: \(error)")
            })
        }
        else{
            TwitterAPICaller.client?.unFavTweet(tweetId: tweetId, success: {
                self.setFavorite(false)
            }, failure: { (error) in
                print("Unfavorite did not succeed: \(error)")
            })
        }
    }
    @IBAction func actionRetweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetId: tweetId,success:{
            self.setRetweeted(true)
        }, failure: {(error) in print("Retweet error")})
    }
    func setRetweeted(_ isRetweeted:Bool){
        if(isRetweeted){
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            retweetButton.isEnabled = false
        }
        else{
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            retweetButton.isEnabled = true
        }
    }
    
    func setFavorite(_ isFavorited:Bool){
        favorited = isFavorited
        if(favorited){
            favButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        }
        else{
            favButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
