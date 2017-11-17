//------
import UIKit
//------
class Add: UIViewController {
     //------- connexion avec les champs de l'interface -------
    @IBOutlet weak var fr: UITextField!
    @IBOutlet weak var en: UITextField!
    
    //------- déclaration des tableaux -------
    var arrayEnglish: [String]!
    var arrayFrancais: [String]!

   //------- fonctions qui seront appelées lorsque le document est prêt -------
    override func viewDidLoad() {
        super.viewDidLoad()
        manageUser()
    }
    //------- fonction pour ajouter des nouveaux mots dans chaque tableau -------
    @IBAction func add(_ sender: UIButton) {
        arrayEnglish.append(en.text!)
        arrayFrancais.append(fr.text!)
        UserDefaults.standard.set(arrayEnglish, forKey: "english")
        UserDefaults.standard.set(arrayFrancais, forKey: "francais")
    }
    //------- fonction pour enregistrer les modifications dans la mémoire -------
    func manageUser() {
        if UserDefaults.standard.object(forKey: "francais") != nil {
            arrayFrancais = UserDefaults.standard.object(forKey: "francais") as! [String]
            arrayEnglish = UserDefaults.standard.object(forKey: "english") as! [String]
        } else {
            arrayFrancais = [String]()
            arrayEnglish = [String]()
        }
        //----
    }
    //----
}


