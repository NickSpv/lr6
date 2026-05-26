# Лабораторная работа №6

Реализовано приложение на основе `UICollectionViewController`, которое показывает список врачей в виде карточек и открывает детальный экран.

Состав файлов:
- `Doctor.swift` - модель врача и тестовые данные;
- `DoctorCollectionViewCell.swift` - кастомная карточка;
- `DoctorsCollectionViewController.swift` - экран со списком;
- `DoctorDetailViewController.swift` - детальный экран;
- `AppDelegate.swift`, `SceneDelegate.swift` - точка входа;
- `control_questions.md` - ответы на контрольные вопросы.

## Минимальный запуск в Xcode

1. `File -> New -> Project -> iOS App (UIKit, Swift, Storyboard)`.
2. Добавить в проект файлы:
   - `Doctor.swift`
   - `DoctorCollectionViewCell.swift`
   - `DoctorsCollectionViewController.swift`
   - `DoctorDetailViewController.swift`
   - `AppDelegate.swift`
   - `SceneDelegate.swift`
3. Удалить автосозданный `ViewController.swift`.
4. В `Signing & Capabilities` выбрать `Team`.
5. Запустить на симуляторе (`Cmd+R`).
