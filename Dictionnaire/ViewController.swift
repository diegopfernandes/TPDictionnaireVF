//-------
import UIKit
//-------
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //-------
    var arrayEnglish: [String]!
    var arrayFrancais: [String]!
    var dict: [String: String]!
    var keys: [String]!
    var resultToDisplay = String()
    var buttons: [UIButton]!
    //-------
    @IBOutlet weak var frenchWord: UIButton!
    @IBOutlet weak var englishWord: UIButton!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var result: UILabel!
    //-------
    override func viewDidLoad() {
        super.viewDidLoad()
        manageUser()
        buttons = [frenchWord, englishWord]
        dict = Dictionary(uniqueKeysWithValues: zip(arrayFrancais, arrayEnglish))
    }
    
    //-------
    @IBAction func translate(_ sender: UIButton) {
        if sender.alpha == 1.0 {
            return
        }
        for button in buttons {
            if button.alpha == 1.0 {
                button.alpha = 0.5
            } else {
                button.alpha = 1.0
                displayTranslation(translation: sender.currentTitle!)
            }
        }
        table.reloadData()
    }
    
    //-------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayFrancais.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: nil)
        keys = [String](dict.keys)
        cell.textLabel?.text = keys[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        result.text = dict[keys[indexPath.row]]
    }
    //-------
   
    func displayTranslation(translation: String) {
        if translation == "Français" {
            dict = Dictionary(uniqueKeysWithValues: zip(arrayEnglish, arrayFrancais))
        } else {
            dict = Dictionary(uniqueKeysWithValues: zip(arrayFrancais, arrayEnglish))
        }
    }
    //-------
    func manageUser() {
        if UserDefaults.standard.object(forKey: "francais") != nil {
            arrayEnglish = UserDefaults.standard.object(forKey: "english") as! [String]
            arrayFrancais = UserDefaults.standard.object(forKey: "francais") as! [String]
            
        } else {
            arrayEnglish = [String]()
            arrayFrancais = [String]()
        }
    }
    //-------
    
}
