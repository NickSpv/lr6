import UIKit

final class DoctorCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "DoctorCollectionViewCell"

    private let imageView = UIImageView()
    private let nameLabel = UILabel()
    private let specialityLabel = UILabel()
    private let stackView = UIStackView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
        layoutViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with doctor: Doctor) {
        imageView.image = UIImage(systemName: doctor.imageSystemName)
        nameLabel.text = doctor.fullName
        specialityLabel.text = doctor.speciality
    }

    private func configureViews() {
        contentView.backgroundColor = .secondarySystemGroupedBackground
        contentView.layer.cornerRadius = 16
        contentView.layer.masksToBounds = true

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .systemIndigo

        nameLabel.font = .boldSystemFont(ofSize: 18)
        nameLabel.numberOfLines = 2
        nameLabel.textAlignment = .center

        specialityLabel.font = .systemFont(ofSize: 15)
        specialityLabel.textColor = .secondaryLabel
        specialityLabel.textAlignment = .center
        specialityLabel.numberOfLines = 2

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
    }

    private func layoutViews() {
        contentView.addSubview(stackView)
        [imageView, nameLabel, specialityLabel].forEach { stackView.addArrangedSubview($0) }

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            imageView.heightAnchor.constraint(equalToConstant: 110)
        ])
    }
}
