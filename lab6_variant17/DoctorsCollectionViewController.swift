import UIKit

final class DoctorsCollectionViewController: UICollectionViewController {
    private let doctors = DoctorRepository.doctors

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 12, right: 8)
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 0
        layout.headerReferenceSize = CGSize(width: 0, height: 52)
        super.init(collectionViewLayout: layout)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Врачи"

        collectionView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        collectionView.register(DoctorCollectionViewCell.self, forCellWithReuseIdentifier: DoctorCollectionViewCell.reuseIdentifier)
        collectionView.register(DoctorsHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: DoctorsHeaderView.reuseIdentifier)
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        doctors.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DoctorCollectionViewCell.reuseIdentifier, for: indexPath) as? DoctorCollectionViewCell else {
            return UICollectionViewCell()
        }

        let doctor = doctors[indexPath.item]
        cell.configure(with: doctor)
        cell.onInfoTap = { [weak self] in
            self?.showDoctorDetails(doctor)
        }
        cell.onBookTap = { [weak self] in
            self?.showBookAlert(for: doctor)
        }

        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader,
              let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: DoctorsHeaderView.reuseIdentifier, for: indexPath) as? DoctorsHeaderView else {
            return UICollectionReusableView()
        }
        header.configure(text: "📍 «Детская практика»")
        return header
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        showDoctorDetails(doctors[indexPath.item])
    }

    private func showDoctorDetails(_ doctor: Doctor) {
        let controller = DoctorDetailViewController(doctor: doctor)
        navigationController?.pushViewController(controller, animated: true)
    }

    private func showBookAlert(for doctor: Doctor) {
        let alert = UIAlertController(title: "Запись", message: "Запрос на прием к врачу «\(doctor.fullName)» отправлен", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

extension DoctorsCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width - 16
        return CGSize(width: width, height: 180)
    }
}

final class DoctorsHeaderView: UICollectionReusableView {
    static let reuseIdentifier = "DoctorsHeaderView"

    private let label = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white

        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20)
        label.textColor = .darkText

        addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(text: String) {
        label.text = text
    }
}
