//------
import UIKit
//------
class Add: UIViewController {
    //
    @IBOutlet weak var fr: UITextField!
    @IBOutlet weak var en: UITextField!
    
    var arrayEnglish: [String]!
    var arrayFrancais: [String]!

   //----
    override func viewDidLoad() {
        super.viewDidLoad()
        manageUser()
    }
    //----
    @IBAction func add(_ sender: UIButton) {
        arrayEnglish.append(en.text!)
        arrayFrancais.append(fr.text!)
        UserDefaults.standard.set(arrayEnglish, forKey: "english")
        UserDefaults.standard.set(arrayFrancais, forKey: "francais")
    }
    //----
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


