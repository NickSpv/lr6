import UIKit

final class DoctorsCollectionViewController: UICollectionViewController {
    private let doctors = DoctorRepository.doctors

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 12, left: 8, bottom: 12, right: 8)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
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

        let headerLabel = UILabel()
        headerLabel.text = "📍 «Детская практика»"
        headerLabel.font = .systemFont(ofSize: 22)
        headerLabel.textColor = .darkText
        headerLabel.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 56)

        let headerView = UIView(frame: headerLabel.frame)
        headerView.backgroundColor = .white
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(headerLabel)
        NSLayoutConstraint.activate([
            headerLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 12),
            headerLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
        ])
        collectionView.addSubview(headerView)
        collectionView.contentInset.top = 56
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
        return CGSize(width: width, height: 168)
    }
}
