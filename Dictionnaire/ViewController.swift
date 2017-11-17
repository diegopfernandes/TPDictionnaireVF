//-------
import UIKit
//-------
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //------- déclaration des variables -------
    var arrayEnglish: [String]!
    var arrayFrancais: [String]!
    var dict: [String: String]!
    var keys: [String]!
    var resultToDisplay = String()
    var buttons: [UIButton]!
    //------- connexion avec les champs de l'interface -------
    @IBOutlet weak var frenchWord: UIButton!
    @IBOutlet weak var englishWord: UIButton!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var result: UILabel!
    //------- fonctions qui seront appelées lorsque le document est prêt et la définition du dictionnaire zippant les tableaux des deux langues -------
    override func viewDidLoad() {
        super.viewDidLoad()
        manageUser()
        buttons = [frenchWord, englishWord]
        dict = Dictionary(uniqueKeysWithValues: zip(arrayFrancais, arrayEnglish))
    }
    
    //------- fonction pour les boutons pour sélectionner la langue à l'écran -------
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
    
    //------- les fonctions por la Table View: première fonction: la première pour déterminer le nombre de lignes, la seconde: pour la définition de la cellule et le texte dedans, la troisième: pour afficher le résultat de la cellule sélectionnée sur le Label (résultat) -------
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
    //------- fonction pour définir la traduction d'accord avec la langue sélectionnée -------
    func displayTranslation(translation: String) {
        if translation == "Français" {
            dict = Dictionary(uniqueKeysWithValues: zip(arrayEnglish, arrayFrancais))
        } else {
            dict = Dictionary(uniqueKeysWithValues: zip(arrayFrancais, arrayEnglish))
        }
    }
    //------- fonction pour enregistrer les modifications dans la mémoire -------
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
