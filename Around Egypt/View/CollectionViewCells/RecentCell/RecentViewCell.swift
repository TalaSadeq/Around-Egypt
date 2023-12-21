import UIKit

class RecentViewCell: UICollectionViewCell {
    
    static let identifier = "RecentViewCell"
    
    var tapAction: (() -> Void)?
    // Image view
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // Stack view for labels and heart button
    var labelsHeartStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 8 // Adjust spacing between elements
        return stackView
    }()
    
    // Left label
    var leftLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Right label
    var rightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        return label
    }()
    
    // Heart button
    var heartButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        let heartImage = UIImage(systemName: "heart")
        button.setImage(heartImage, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
               imageView.addGestureRecognizer(tapGesture)
               imageView.isUserInteractionEnabled = true
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func handleTap(_ gesture: UITapGestureRecognizer) {
            tapAction?()
        }
    
    private func configureUI() {
        // Image view setup
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 254),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 19),
            imageView.widthAnchor.constraint(equalToConstant: 339),
            imageView.heightAnchor.constraint(equalToConstant: 154),
        ])
        
        // Labels and heart button stack view setup
        addSubview(labelsHeartStackView)
        labelsHeartStackView.addArrangedSubview(leftLabel)
        labelsHeartStackView.addArrangedSubview(rightLabel)
        labelsHeartStackView.addArrangedSubview(heartButton)
        
        // Constraints for the labels and heart button stack view
        NSLayoutConstraint.activate([
            labelsHeartStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            labelsHeartStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 19),
            labelsHeartStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -19),
        ])
    }
    
    func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }

        // Set a placeholder color or image here
        imageView.backgroundColor = .lightGray // For example, a light gray color

        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let self = self, let data = data, error == nil else { return }

            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    self.imageView.image = image
                } else {
                    // Handle placeholder image if data is not convertible to UIImage
                    self.imageView.image = UIImage(named: "placeholderImage")
                }
            }
        }.resume()
    }


    }

