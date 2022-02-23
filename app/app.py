from flask import Flask, render_template, request
from bdd import BDD
from utilisateur import Utilisateur
import main


#Penser à activer l'environnement puis à le désactiver:
#Windows- dans le dossier 'app'
#.env_mail\Scripts\activate
#.env_mail\Scripts\deactivate

#Lancer Flask                               #Lancer V2 si fichier introuvable:
#python -m flask run                        #Windows version
                                            #set FLASK_APP=app.py
                                            #set FLASK_ENV=development
                                            #flask run

app = Flask(__name__)

@app.route('/') #http://127.0.0.1:5000/
def accueil(): 
    return render_template('accueil.html')

@app.route('/index') #http://127.0.0.1:5000/Index
def index():
    bdd = BDD('localhost', "trombi_v2", "root", "root", 8081)
    liste_utilisateurs = bdd.lister_utilisateurs()
    return render_template('index.html' , liste_utilisateurs = liste_utilisateurs)
    
    



if __name__== "__main__":
    app.run(debug=True, port=5000)