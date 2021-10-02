//
//  CardView.swift
//  iOS Bootcamp Challenge
//
//  Created by Marlon David Ruiz Arroyave on 28/09/21.
//

import UIKit

class CardView: UIView {

    private let margin: CGFloat = 30
    var card: Card?

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 27)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //    MARK: - Image
        let imagePath: UIImageView = {
           let iv = UIImageView()
//            iv.backgroundColor = .red
            iv.layer.cornerRadius = 8
            iv.clipsToBounds = true
            iv.widthAnchor.constraint(equalToConstant: 335).isActive = true
            iv.heightAnchor.constraint(equalToConstant: 200).isActive = true
            iv.layer.borderWidth = 0.5
            iv.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
            iv.contentMode = .scaleAspectFill
            return iv
        }()
    
    // MARK:-  popularity label
                let popularityLabel: UILabel = {
                    let popularityLabel = UILabel()
                    popularityLabel.text = "2470.227"
                    popularityLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
                    popularityLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                    return popularityLabel
                }()
    
    // MARK:-  languague label
                let languagueLabel: UILabel = {
                    let languagueLabel = UILabel()
                    languagueLabel.text = "en"
                    languagueLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
                    languagueLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                    return languagueLabel
                }()
    
    // MARK:-  languague label
                let vote_countLabel: UILabel = {
                    let vote_countLabel = UILabel()
                    vote_countLabel.text = "405"
                    vote_countLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
                    vote_countLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                    return vote_countLabel
                }()
    
    // MARK:-  overview label
                let overviewLabel: UILabel = {
                    let overviewLabel = UILabel()
                    overviewLabel.text = "Supervillains Harley Quinn, Bloodsport, Peacemaker and a collection of nutty cons at Belle Reve prison join the super-secret, super-shady Task Force X as they are dropped off at the remote, enemy-infused island of Corto Maltese."
                    overviewLabel.numberOfLines = 10
                    overviewLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
                    overviewLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                    return overviewLabel
                }()
    
    //    MARK: -label Description Overview
        let descriptionLabel: UILabel = {
            let descriptionLabel = UILabel()
            descriptionLabel.text = "StoryLine"
            descriptionLabel.font = .boldSystemFont(ofSize: 25)
            return descriptionLabel
        }()
    
//   MARK: - Function to create Icon
    lazy var Icon1ImageView = self.createIcon(systemName: "person.fill", color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
    lazy var Icon2ImageView = self.createIcon(systemName: "ellipses.bubble.fill", color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
    lazy var Icon3ImageView = self.createIcon(systemName: "hand.thumbsup.fill", color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
    
    func createIcon(systemName: String, color: UIColor) -> UIImageView {
        let imageIcon = UIImageView()
        imageIcon.image = UIImage(systemName: systemName)
        imageIcon.widthAnchor.constraint(equalToConstant: 25).isActive = true
        imageIcon.heightAnchor.constraint(equalToConstant: 25).isActive = true
        imageIcon.tintColor = color
        return imageIcon
    }

    required init(card: Card) {
        self.card = card
        super.init(frame: .zero)
        setup()
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        setupUI()
    }

    private func setup() {
        guard let card = card else { return }

        card.items.forEach { _ in }

        titleLabel.text = card.title
        backgroundColor = .white
        layer.cornerRadius = 20
    }

    private func setupUI() {
        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: margin * 2).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: margin).isActive = true
        titleLabel.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor, multiplier: 0.70).isActive = true

        // TODO: Display pokemon info (eg. types, abilities)
        
        // MARK: - Stack View contentLabel
        let polpularityStackIcon =  UIStackView(arrangedSubviews: [
            Icon1ImageView, popularityLabel
        ])
        polpularityStackIcon.axis = .horizontal
        polpularityStackIcon.spacing = 10
        
        let languagueStackIcon = UIStackView(arrangedSubviews: [
            Icon2ImageView, languagueLabel
        ])
        languagueStackIcon.axis = .horizontal
        languagueStackIcon.spacing = 10
        
        let voteCountLabel = UIStackView(arrangedSubviews: [
            Icon3ImageView, vote_countLabel
        ])
        voteCountLabel.axis = .horizontal
        voteCountLabel.spacing = 10
        
        let containerLabel = UIStackView(arrangedSubviews: [
        polpularityStackIcon, languagueStackIcon, voteCountLabel
        ])
        containerLabel.axis = .horizontal
        containerLabel.alignment = .center
//        containerLabel.distribution = .equalSpacing
        containerLabel.spacing = 10
        
        let overviewStack = UIStackView(arrangedSubviews: [descriptionLabel,overviewLabel])
        overviewStack.axis = .vertical
        overviewStack.spacing = 10
        overviewStack.alignment  = .leading
        
        let stackView = UIStackView(arrangedSubviews: [imagePath, containerLabel, overviewStack])
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 10
        addSubview(stackView)
        
        stackView.fillSuperview(padding: .init(top: 100, left: 15, bottom: 15, right: 15))
    }

}
