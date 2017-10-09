//
//  ViewController.swift
//  is it email
//
//  Created by SUP'Internet 15 on 02/10/2017.
//  Copyright © 2017 SUP'Internet 15. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBAction func checkButtonPressed(_ sender: UIButton) {
        if let valueEmailTextField = self.emailTextField.text{
            print("emailTextField -> \(valueEmailTextField)")
            if(Email(email:valueEmailTextField).isValidEmail() == true){
                print("valide email")
                let alert = UIAlertController(title: "Vérification email", message: "Votre email est \(valueEmailTextField)", preferredStyle: UIAlertControllerStyle.alert)
                //handler s'execute que l'orsque on clique sur oK (cest un event)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: {
                    date in self.performSegue(withIdentifier: "ShowEmailModaly", sender: self)
                    // en cliquant sur OK, via le handler mis, il va executer le segue et se diriger vers l'autre controler,
                    //le sender c'est toujour self (très rare que le param de sender soit autre que self
                }))
                self.present(alert, animated: true, completion: nil)
            }else{
                print("non valide email ")
                let alert = UIAlertController(title: "Vérification email", message: "Votre email n'est pas valide", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Fermer", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }

    }
    
    struct Email:CustomStringConvertible{
        var email: String?;
        
        
        //si on print la struct Email, sa affiche la desc
        var description: String {
            return "(\(self.email!))"
        }
        
        init(email: String){
            self.email = email
        }
        
        func isValidEmail() -> Bool {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailTest.evaluate(with: self.email)
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //COURS 
    
    //Contraintes
    
    //Bien utiliser les lignes bleu de la story board pour placer nos éléments flottants pour utiliser les contraintes genre VerticalSpacing 
    
    //POUR VERTICAL SPACING NE PAS OUBLIER LE 3 picto et mettre HORIZONTAL IN CONTAINER
    
    //A la base, les elemnts graphique qu'on met sur notre storyboard, sont "flottant" d'ou l'interet de leur mettre des contraintes
    
    //En ios ne jamais définir des tailles fixes, et laisser les contraintes gérer les sizes de nos elements
    
    //BIEN PLACER LES ELEMENTS SUR LA LIGNE BLEU DU STORYBOARD
    
    //Prend le label -> le selectionner puis ctrl et aller vers le top avec la fleche bleu qui pop 
    //puis
    //->Vertical spacing to top layout
    
    //Ensuite aller sur le picto des contraintes ( deux carré), et cocher horizontal in container (pour lui dire que c'est good pour horizontal) et voila le carré passe de rouge à bleu se qui signifie que c'est bon
    
    //Ainsi on a definit deux contraintes -> Vertical puis horizontal Ò
    
    
    //Deuxieme element meme logique, on va cliquer dessus ctrl et cliquer avec la fleu bleu sur lement au dessus et faire Vertical spacing (pour copier les contraintes du premeir elemnt)
    //Ceci va alors fixer une contrainte sur le haut 
    
    //si on veut donc augmenter la taille il faut une contrainte droite / gauche pour sa faire cliquer le picto barre carre barre et cliquer (mettre une taille et cliquer le le lien rouge pour l'activer)
    
    //par exemple cliquer, picto -> droite 0 gauche 0 et haut (donner par defaut par la contrainte veRTICAL spacing d'avant) et en bas osef fini
    
    
    //SINON on peut utiliser directement en code avec materialDesign
    
    
    //ARRIVER ICI notre input n'a pas de vie
    
    
    //pour impoter un element graphique dans notre code, drag n drop l'element et lui donne un nom nomTypeDeElement
    
    //ensuite pour l'event on refaire drag n drop Action / UIButton et choisi un nom
    
    
    
    //Creer une nouvelle vue -> ViewController
    //on clique le petit bouton jaune de la vue (ctrl) et on le link a lautre view (creer une segue, un chemin)
    //on petut choisir nos mode ensuite d'affichage modal etc
    
    //uNE FOIS quon a notre segue, click dessus et on lui donne un nom, dans identifier
    //oN peut donc ensuite appeler depuis le controler parent, notre segue pour afficher l'autre vue desormais

}

