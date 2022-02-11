//
//  TaskViewController.swift
//  Calu
//
//  Created by Thong Doan on 27/11/2021.
//

import UIKit

class TaskViewController: UIViewController {
    let arrTask:[Task] = [Task(name: "Tuổi", image: "birthday-cake.png"),
                          Task(name: "Diện tích", image: "scale.png"),
                          Task(name: "BMI", image: "bmi.png"),
                          Task(name: "Dữ liệu", image: "exchange.png"),
                          Task(name: "Ngày", image: "calendar.png"),
                          Task(name: "Giảm giá", image: "voucher.png"),
                          Task(name: "Độ dài", image: "measuring-tape.png"),
                          Task(name: "Trọng lượng", image: "body-scale.png"),
                          Task(name: "Tốc độ", image: "fast.png"),
                          Task(name: "Nhiệt độ", image: "thermometer.png")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension TaskViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrTask.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! HomeCell
        cell.nameTask.text = arrTask[indexPath.row].name
        cell.imgTask.image = UIImage(named: arrTask[indexPath.row].image)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(arrTask[indexPath.row].name)
    }
}
class HomeCell: UICollectionViewCell {

    @IBOutlet weak var imgTask: UIImageView!
    @IBOutlet weak var nameTask: UILabel!
}
