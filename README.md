# TwitX

Dans le cadre du projet "TwitX", la description de la livraison pourrait répertorier les fonctionnalités clés de l'application, notamment la publication de tweets, la gestion des abonnements, les notifications, la recherche d'utilisateurs et de tweets, la personnalisation du profil, l'accès au fil d'actualités et les interactions avec les tweets. Cette liste détaille les principales composantes du produit final.


![Logo](https://www.tomsguide.fr/content/uploads/sites/2/2023/07/Logo-Twitter-X-Elon-Musk.jpg)

## Table des Matières

- [API Documentation](#api-documentation)
- [Application Details](#application-details)

---

## API Documentation

<details>
  <summary>Cliquez pour afficher la documentation de l'API</summary>

    ### Users

### Obtenir un Utilisateur par ID

- **Endpoint:** `/users/{id}`
- **Method:** `GET`
- **Résumé:** Récupère un utilisateur spécifique en fonction de son ID.
- **Réponses:**
  - `200`: Utilisateur récupéré avec succès.
  - `404`: Utilisateur non trouvé.
  - `500`: Erreur lors de la récupération de l'utilisateur.

### Récupérer tous les Utilisateurs

- **Endpoint:** `/users`
- **Method:** `GET`
- **Résumé:** Récupère la liste de tous les utilisateurs enregistrés.
- **Réponses:**
  - `200`: Liste des utilisateurs récupérée avec succès.
  - `500`: Erreur lors de la récupération des utilisateurs.

### Mettre à jour un Utilisateur

- **Endpoint:** `/users/{id}`
- **Method:** `PATCH`
- **Résumé:** Mettez à jour les informations d'un utilisateur.
- **Paramètres:** ID de l'utilisateur, informations à mettre à jour.
- **Réponses:**
  - `200`: Utilisateur mis à jour avec succès.
  - `400`: Requête invalide.
  - `404`: Utilisateur non trouvé.

### Supprimer un Utilisateur

- **Endpoint:** `/users/{id}`
- **Method:** `DELETE`
- **Résumé:** Supprime un utilisateur.
- **Réponses:**
  - `200`: Utilisateur supprimé avec succès.
  - `404`: Utilisateur non trouvé.

### Ajouter une Image de Profil

- **Endpoint:** `/users/me/avatar`
- **Method:** `POST`
- **Résumé:** Ajoute une image de profil à l'utilisateur actuellement connecté.
- **Réponses:**
  - `200`: Image de profil ajoutée avec succès.
  - `400`: Requête invalide.

### Supprimer l'Image de Profil

- **Endpoint:** `/users/me/avatar`
- **Method:** `DELETE`
- **Résumé:** Supprime l'image de profil de l'utilisateur actuellement connecté.
- **Réponses:**
  - `200`: Image de profil supprimée avec succès.

### Mettre à Jour l'Avatar

- **Endpoint:** `/users/me/avatar/{id}`
- **Method:** `PATCH`
- **Résumé:** Met à jour l'avatar de l'utilisateur actuellement connecté.
- **Réponses:**
  - `200`: Avatar mis à jour avec succès.
  - `400`: Requête invalide.
 
### Obtenir l'Avatar d'un Utilisateur par ID

- **Endpoint:** `/users/{id}/avatar`
- **Method:** `GET`
- **Résumé:** Obtenir l'avatar d'un utilisateur spécifique en fonction de son ID.
- **Réponses:**
  - `200`: Avatar de l'utilisateur récupéré avec succès.
  - `404`: Utilisateur non trouvé ou avatar inexistant.

### Suivre un Utilisateur par ID

- **Endpoint:** `/users/{id}/follow`
- **Method:** `PUT`
- **Résumé:** Suivre un utilisateur spécifique en fonction de son ID.
- **Réponses:**
  - `200`: Vous suivez maintenant cet utilisateur.
  - `403`: Vous suivez déjà cet utilisateur ou vous essayez de vous suivre vous-même.

### Ne plus Suivre un Utilisateur par ID

- **Endpoint:** `/users/{id}/unfollow`
- **Method:** `PUT`
- **Résumé:** Cessez de suivre un utilisateur spécifique en fonction de son ID.
- **Réponses:**
  - `200`: Vous ne suivez plus cet utilisateur.
  - `403`: Vous ne suiviez pas cet utilisateur ou vous essayez de ne plus vous suivre vous-même.

### Obtenir le Nombre de Followers d'un Utilisateur par ID

- **Endpoint:** `/users/{id}/followersCount`
- **Method:** `GET`
- **Résumé:** Obtenir le nombre de followers d'un utilisateur spécifique en fonction de son ID.
- **Réponses:**
  - `200`: Nombre de followers récupéré avec succès.
  - `404`: Utilisateur non trouvé.

### Obtenir le Nombre de Followings d'un Utilisateur par ID

- **Endpoint:** `/users/{id}/followingsCount`
- **Method:** `GET`
- **Résumé:** Obtenir le


<!-- Autres endpoints pour Users ... -->

### Tweets

### Télécharger une Image pour un Tweet Spécifique

- **Endpoint:** `/uploadTweetImage/{id}`
- **Method:** `POST`
- **Résumé:** Télécharge une image pour un tweet spécifique à l'aide de son ID.
- **Paramètres:** ID du tweet.
- **Réponses:**
  - `200`: Image du tweet mise à jour avec succès.
  - `400`: Requête invalide.

### Obtenir tous les Tweets

- **Endpoint:** `/tweets`
- **Method:** `GET`
- **Résumé:** Récupère tous les tweets existants.
- **Réponses:**
  - `200`: Liste des tweets récupérée avec succès.
  - `500`: Erreur interne du serveur.

### Obtenir un Tweet par ID Utilisateur

- **Endpoint:** `/tweets/{id}`
- **Method:** `GET`
- **Résumé:** Récupère un tweet spécifique en fonction de l'ID utilisateur.
- **Paramètres:** ID de l'utilisateur.
- **Réponses:**
  - `200`: Tweet récupéré avec succès.
  - `404`: Tweet non trouvé.
  - `500`: Erreur interne du serveur.

### Créer un Nouveau Tweet

- **Endpoint:** `/tweets`
- **Method:** `POST`
- **Résumé:** Crée un nouveau tweet pour l'utilisateur connecté.
- **Corps de la requête:** Contient les propriétés du tweet.
- **Réponses:**
  - `201`: Tweet créé avec succès.
  - `400`: Requête invalide.

### Obtenir l'Image d'un Tweet par ID

- **Endpoint:** `/tweets/{id}/image`
- **Method:** `GET`
- **Résumé:** Récupère l'image d'un tweet spécifique en fonction de son ID.
- **Paramètres:** ID du tweet.
- **Réponses:**
  - `200`: Image du tweet récupérée avec succès.
  - `404`: Tweet non trouvé ou image inexistante.

### Aimer un Tweet par ID

- **Endpoint:** `/tweets/{id}/like`
- **Method:** `PUT`
- **Résumé:** Aime un tweet spécifique en fonction de son ID.
- **Paramètres:** ID du tweet.
- **Réponses:**
  - `200`: Vous avez aimé ce tweet.
  - `403`: Vous avez déjà aimé ce tweet.
  - `500`: Erreur interne du serveur.

### Ne plus Aimer un Tweet par ID

- **Endpoint:** `/tweets/{id}/unlike`
- **Method:** `PUT`
- **Résumé:** Cessez d'aimer un tweet spécifique en fonction de son ID.
- **Paramètres:** ID du tweet.
- **Réponses:**
  - `200`: Vous n'aimez plus ce tweet.
  - `403`: Vous n'avez pas aimé ce tweet ou vous essayez d'annuler votre like.
  - `500`: Erreur interne du serveur.

### Notifications

### Créer une Nouvelle Notification

- **Endpoint:** `/notifications`
- **Method:** `POST`
- **Résumé:** Crée une nouvelle notification pour l'utilisateur connecté.
- **Corps de la requête:** Contient les propriétés de la notification.
- **Réponses:**
  - `201`: Notification créée avec succès.
  - `400`: Requête invalide.

### Obtenir toutes les Notifications

- **Endpoint:** `/notifications`
- **Method:** `GET`
- **Résumé:** Récupère toutes les notifications existantes.
- **Réponses:**
  - `200`: Liste des notifications récupérée avec succès.
  - `500`: Erreur interne du serveur.

### Obtenir les Notifications par ID Utilisateur

- **Endpoint:** `/notifications/{id}`
- **Method:** `GET`
- **Résumé:** Récupère les notifications spécifiques en fonction de l'ID utilisateur.
- **Paramètres:** ID de l'utilisateur.
- **Réponses:**
  - `200`: Notifications récupérées avec succès.
  - `500`: Erreur interne du serveur.
---

</details>

---

## Application Details

<details>
  <summary>Cliquez pour afficher les détails de l'application</summary>

  
## 1. Création d'un compte

- TLancez l'application ur l'icone de lancement de votre editeur XCode

## 2. Navigation de base

- **Fil d'actualité** : Consultez les tweets des personnes que vous suivez.
- **Notifications** : Recevez des alertes pour les mentions, retweets et nouveaux abonnés.

## 3. Publication d'un Tweet

- Cliquez sur l'icône de plume dans le coin inférieur droit.
- Rédigez votre message dans la zone de composition (280 caractères maximum).
- Ajoutez des médias (images, GIF, vidéos) en utilisant les icônes dédiées.
- Cliquez sur "Tweeter" pour publier votre tweet.

## 4. Interaction avec les Tweets

- **Retweet** : Partagez un tweet en appuyant sur l'icône de flèche courbée.
- **J'aime** : Exprimez votre appréciation en cliquant sur l'icône en forme de cœur.

## 5. Exploration et Recherche

- Utilisez la barre de recherche pour trouver des comptes insscrit dans l'application
- Découvrez les tendances et actualités sous l'onglet "Explorer".

## 6. Personnalisation du Profil

- Cliquez sur votre photo de profil, puis sur "Profil" pour modifier votre bio et vos images.
- Gérez vos listes, favoris et paramètres depuis cette section.

## 7. Sécurité et Confidentialité

- Accédez aux paramètres pour gérer la confidentialité, les notifications et la sécurité.

</details>

---

<License, Contributions, Contact Info, etc.>

<Bottom of the README>
