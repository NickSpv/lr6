import UIKit

struct Doctor {
    let fullName: String
    let specialityLine: String
    let degreeLine: String
    let experienceTitle: String
    let education: String
    let experienceText: String
    let certificates: String
    let services: [String]
    let imageName: String
}

enum DoctorRepository {
    static let doctors: [Doctor] = [
        Doctor(
            fullName: "Лукина Ирина Викторовна",
            specialityLine: "Пульмонолог, аллерголог-иммунолог",
            degreeLine: "КМН, высшая категория",
            experienceTitle: "Опыт работы:",
            education: "Образование: Смоленская государственная медицинская академия, 2001г., ДВС 0243207, специальность «лечебное дело»",
            experienceText: "Специализация: Терапия, с 2001г. по 2003г. – клиническая ординатура. Пульмонология, с 18.02.2003г. по 18.06.2003г.",
            certificates: "Сертификаты: Пульмонология рег.№27932 до 06.07.2023г",
            services: [
                "Консультативный прием пульмонолога, врача-аллерголога-иммунолога",
                "Диагностика бытовой, эпидермальной, пыльцевой и пищевой аллергии.",
                "Проведение лабораторной оценки состояния иммунной системы для оптимального выбора препаратов.",
                "Терапия пациентов с использованием современного метода - сублингвальной аллергической специфической"
            ],
            imageName: "doctor1"
        ),
        Doctor(
            fullName: "Белова Мария Андреевна",
            specialityLine: "Пульмонолог",
            degreeLine: "",
            experienceTitle: "Опыт работы:",
            education: "Образование: СГМУ, специальность «лечебное дело».",
            experienceText: "Практический прием пациентов с заболеваниями бронхолегочной системы.",
            certificates: "Сертификаты: пульмонология, аллергология.",
            services: [
                "Первичный консультативный прием",
                "Подбор терапии при бронхиальной астме",
                "Контроль терапии и динамики лечения"
            ],
            imageName: "doctor2"
        )
    ]
}
