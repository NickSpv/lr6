import UIKit

final class DoctorDetailViewController: UIViewController {
    private let doctor: Doctor

    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let stackView = UIStackView()

    init(doctor: Doctor) {
        self.doctor = doctor
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = ""
        view.backgroundColor = UIColor(white: 0.95, alpha: 1)

        configureLayout()
        fillContent()
    }

    private func configureLayout() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10

        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),

            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }

    private func fillContent() {
        let photo = UIImageView()
        if let image = UIImage(named: doctor.imageName) {
            photo.image = image
            photo.contentMode = .scaleAspectFill
        } else {
            photo.image = UIImage(systemName: "person.circle.fill")
            photo.contentMode = .scaleAspectFit
            photo.tintColor = .systemGray3
        }
        photo.clipsToBounds = true
        photo.layer.cornerRadius = 70
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.widthAnchor.constraint(equalToConstant: 140).isActive = true
        photo.heightAnchor.constraint(equalToConstant: 140).isActive = true

        let photoWrap = UIView()
        photoWrap.addSubview(photo)
        photo.centerXAnchor.constraint(equalTo: photoWrap.centerXAnchor).isActive = true
        photo.topAnchor.constraint(equalTo: photoWrap.topAnchor).isActive = true
        photo.bottomAnchor.constraint(equalTo: photoWrap.bottomAnchor).isActive = true

        let nameLabel = makeLabel(doctor.fullName, size: 26, weight: .bold, color: .black)
        let degreeLabel = makeLabel(doctor.degreeLine, size: 16, weight: .semibold, color: .darkGray)

        let bookButton = UIButton(type: .system)
        bookButton.setTitle("Записаться на прием", for: .normal)
        bookButton.setTitleColor(.white, for: .normal)
        bookButton.backgroundColor = UIColor(red: 0.16, green: 0.74, blue: 0.90, alpha: 1)
        bookButton.titleLabel?.font = .systemFont(ofSize: 16)
        bookButton.layer.cornerRadius = 4
        bookButton.translatesAutoresizingMaskIntoConstraints = false
        bookButton.heightAnchor.constraint(equalToConstant: 42).isActive = true

        let bookWrap = UIView()
        bookWrap.addSubview(bookButton)
        NSLayoutConstraint.activate([
            bookButton.centerXAnchor.constraint(equalTo: bookWrap.centerXAnchor),
            bookButton.topAnchor.constraint(equalTo: bookWrap.topAnchor),
            bookButton.widthAnchor.constraint(equalToConstant: 210),
            bookButton.bottomAnchor.constraint(equalTo: bookWrap.bottomAnchor)
        ])

        let expTitle = makeLabel(doctor.experienceTitle, size: 17, weight: .semibold, color: .gray)
        let education = makeParagraph(doctor.education)
        let experience = makeParagraph(doctor.experienceText)
        let certs = makeParagraph(doctor.certificates)

        let servicesTitle = makeLabel("Услуги:", size: 17, weight: .semibold, color: .gray)
        let servicesText = makeParagraph(doctor.services.joined(separator: "\n\n"))

        [photoWrap, nameLabel, degreeLabel, bookWrap, expTitle, education, experience, certs, servicesTitle, servicesText].forEach {
            stackView.addArrangedSubview($0)
        }
    }

    private func makeLabel(_ text: String, size: CGFloat, weight: UIFont.Weight, color: UIColor) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = .systemFont(ofSize: size, weight: weight)
        label.textColor = color
        label.numberOfLines = 0
        return label
    }

    private func makeParagraph(_ text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = .systemFont(ofSize: 16)
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    }
}
