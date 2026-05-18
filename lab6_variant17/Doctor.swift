import UIKit

struct Doctor {
    let fullName: String
    let speciality: String
    let qualification: String
    let experience: String
    let services: String
    let imageSystemName: String
}

enum DoctorRepository {
    static let doctors: [Doctor] = [
        Doctor(
            fullName: "Анна Смирнова",
            speciality: "Кардиолог",
            qualification: "Высшая категория",
            experience: "12 лет",
            services: "Диагностика, лечение и профилактика сердечно-сосудистых заболеваний.",
            imageSystemName: "heart.text.square.fill"
        ),
        Doctor(
            fullName: "Игорь Павлов",
            speciality: "Невролог",
            qualification: "Первая категория",
            experience: "9 лет",
            services: "Консультации при хронических болях, нарушениях сна и неврологических расстройствах.",
            imageSystemName: "brain.head.profile"
        ),
        Doctor(
            fullName: "Елена Морозова",
            speciality: "Терапевт",
            qualification: "Высшая категория",
            experience: "15 лет",
            services: "Первичный прием, обследование, направление на анализы и профилактические программы.",
            imageSystemName: "cross.case.fill"
        ),
        Doctor(
            fullName: "Дмитрий Орлов",
            speciality: "Ортопед",
            qualification: "Кандидат медицинских наук",
            experience: "11 лет",
            services: "Лечение травм, суставных заболеваний и восстановление двигательной активности.",
            imageSystemName: "figure.walk"
        )
    ]
}
