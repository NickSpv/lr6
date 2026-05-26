import UIKit

final class DoctorCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "DoctorCollectionViewCell"

    var onBookTap: (() -> Void)?
    var onInfoTap: (() -> Void)?

    private let doctorImageView = UIImageView()
    private let nameLabel = UILabel()
    private let specialityLabel = UILabel()
    private let degreeLabel = UILabel()

    private let buttonsStack = UIStackView()
    private let bookButton = UIButton(type: .system)
    private let infoButton = UIButton(type: .system)

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
        layoutViews()
        wireActions()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        onBookTap = nil
        onInfoTap = nil
    }

    func configure(with doctor: Doctor) {
        if let image = UIImage(named: doctor.imageName) {
            doctorImageView.image = image
            doctorImageView.contentMode = .scaleAspectFill
        } else {
            doctorImageView.image = UIImage(systemName: "person.circle.fill")
            doctorImageView.tintColor = .systemGray3
            doctorImageView.contentMode = .scaleAspectFit
        }

        nameLabel.text = doctor.fullName
        specialityLabel.text = doctor.specialityLine
        degreeLabel.text = doctor.degreeLine
        degreeLabel.isHidden = doctor.degreeLine.isEmpty
    }

    private func configureViews() {
        contentView.backgroundColor = .white
        contentView.layer.borderColor = UIColor(white: 0.86, alpha: 1).cgColor
        contentView.layer.borderWidth = 1

        doctorImageView.translatesAutoresizingMaskIntoConstraints = false
        doctorImageView.clipsToBounds = true
        doctorImageView.layer.cornerRadius = 24

        nameLabel.font = .boldSystemFont(ofSize: 16)
        nameLabel.numberOfLines = 2

        specialityLabel.font = .systemFont(ofSize: 13)
        specialityLabel.textColor = .darkGray
        specialityLabel.numberOfLines = 2

        degreeLabel.font = .systemFont(ofSize: 13)
        degreeLabel.textColor = .darkGray
        degreeLabel.numberOfLines = 1

        buttonsStack.translatesAutoresizingMaskIntoConstraints = false
        buttonsStack.axis = .horizontal
        buttonsStack.spacing = 8
        buttonsStack.distribution = .fillEqually

        configureBookButton()
        configureInfoButton()
    }

    private func layoutViews() {
        let textStack = UIStackView(arrangedSubviews: [nameLabel, specialityLabel, degreeLabel])
        textStack.axis = .vertical
        textStack.spacing = 2
        textStack.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(doctorImageView)
        contentView.addSubview(textStack)
        contentView.addSubview(buttonsStack)

        [bookButton, infoButton].forEach { buttonsStack.addArrangedSubview($0) }

        NSLayoutConstraint.activate([
            doctorImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            doctorImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            doctorImageView.widthAnchor.constraint(equalToConstant: 48),
            doctorImageView.heightAnchor.constraint(equalToConstant: 48),

            textStack.leadingAnchor.constraint(equalTo: doctorImageView.trailingAnchor, constant: 10),
            textStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            textStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),

            buttonsStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            buttonsStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            buttonsStack.topAnchor.constraint(equalTo: textStack.bottomAnchor, constant: 9),
            buttonsStack.heightAnchor.constraint(equalToConstant: 34),
            buttonsStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }

    private func configureBookButton() {
        bookButton.setTitle("Записаться на прием", for: .normal)
        bookButton.setTitleColor(.white, for: .normal)
        bookButton.backgroundColor = UIColor(red: 0.16, green: 0.74, blue: 0.90, alpha: 1)
        bookButton.titleLabel?.font = .systemFont(ofSize: 14)
        bookButton.layer.cornerRadius = 4
        bookButton.layer.shadowColor = UIColor.black.cgColor
        bookButton.layer.shadowOpacity = 0.12
        bookButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        bookButton.layer.shadowRadius = 3
    }

    private func configureInfoButton() {
        infoButton.setTitle("Инфо", for: .normal)
        infoButton.setTitleColor(.darkText, for: .normal)
        infoButton.backgroundColor = .white
        infoButton.titleLabel?.font = .systemFont(ofSize: 14)
        infoButton.layer.cornerRadius = 4
        infoButton.layer.borderWidth = 1
        infoButton.layer.borderColor = UIColor(red: 0.16, green: 0.74, blue: 0.90, alpha: 1).cgColor
    }

    private func wireActions() {
        bookButton.addTarget(self, action: #selector(bookTapped), for: .touchUpInside)
        infoButton.addTarget(self, action: #selector(infoTapped), for: .touchUpInside)
    }

    @objc private func bookTapped() {
        onBookTap?()
    }

    @objc private func infoTapped() {
        onInfoTap?()
    }
}
