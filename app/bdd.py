import mysql.connector as mysql
from utilisateur import Utilisateur

    
class BDD:

    # Constructeur.
    def __init__(self, host, database, user, password, port):

        self.host = host
        self.database = database
        self.user = user
        self.password = password
        self.port = port

        self.curseur = None

    def connectBDD(self):
        # Connexion à la base de données.
        self.connexion = mysql.connect( host = self.host, 
                                        database = self.database, 
                                        user = self.user, 
                                        password = self.password,
                                        port = self.port
                                       ) 


        # Cursor.
        self.curseur = self.connexion.cursor()

    # Close connection.
    def close(self):
        self.curseur.close()
    
    def dbSelectNomPrenom(self):
        self.connectBDD()

        # SELECT id_personne, nom, prenom FROM personne;
        requete = "SELECT id_etudiant, nom_etudiant, prenom_etudiant FROM etudiants;"

        self.curseur.execute(requete)
        result = self.curseur.fetchall()
        

        self.close()
        return result
    
    def dbUpdateUserEmail(self, id, email):
        self.connectBDD()

        # SELECT id_personne, nom, prenom FROM personne;
        requete = "Update etudiants SET mail_etudiant = %s WHERE id_etudiant = %s"
        param = (email, id, )
        self.curseur.execute(requete, param)

        self.connexion.commit()        

        self.close() 

   
    def lister_utilisateurs(self):
        self.connectBDD()
        
        query = "SELECT id_etudiant, nom_etudiant, prenom_etudiant, mail_etudiant FROM etudiants"
        self.curseur.execute(query)
        promo = []

        for utilisateur_lu in self.curseur:
            promo.append(Utilisateur(utilisateur_lu[0], utilisateur_lu[1], utilisateur_lu[2], utilisateur_lu[3]))

        self.close()
        return promo

