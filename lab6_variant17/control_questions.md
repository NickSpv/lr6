# Контрольные вопросы к лабораторной работе №6

## 1. Класс UICollectionView
`UICollectionView` отображает данные в виде набора элементов, которые можно расположить сеткой, карточками или в другой произвольной форме. Он более гибкий, чем `UITableView`, и подходит для галерей, каталогов, карточек и сложных компоновок.
Пример:
```swift
let layout = UICollectionViewFlowLayout()
layout.itemSize = CGSize(width: 160, height: 200)
let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
```

## 2. Протокол UICollectionViewDataSource
`UICollectionViewDataSource` предоставляет `CollectionView` данные для отображения. Через него задают количество секций, количество элементов и создают ячейки для конкретных индексов. Без источника данных `CollectionView` не знает, что показывать.
Пример:
```swift
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    doctors.count
}
```

## 3. Протокол UICollectionViewDelegate
`UICollectionViewDelegate` отвечает за реакцию на действия пользователя и поведение коллекции. Через него обрабатывают выбор элементов, нажатия, отображение дополнительных представлений и другие события интерфейса.
Пример:
```swift
func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    print("Открыть карточку: \\(doctors[indexPath.item].name)")
}
```

## 4. Шаблоны ячеек
Ячейки коллекции обычно реализуют как подклассы `UICollectionViewCell`. В них можно разместить изображение, метки, кнопки и любые другие элементы интерфейса. Благодаря переиспользованию ячеек обеспечивается хорошая производительность при большом количестве элементов.
Пример:
```swift
class DoctorCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
}
```

## 5. Добавление и удаление данных из CollectionView
При изменении данных сначала обновляют массив модели, затем вызывают `insertItems`, `deleteItems`, `reloadItems` или `reloadData`. Как и в `TableView`, важно синхронизировать фактические данные и изменения интерфейса, чтобы избежать ошибок.
Пример:
```swift
doctors.remove(at: indexPath.item)
collectionView.deleteItems(at: [indexPath])
```
