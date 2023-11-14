const express = require('express')
const User = require('../models/user')
const jwt = require('jsonwebtoken')
const router = new express.Router()
const multer = require('multer')
const auth = require('../middleware/auth')
const sharp = require('sharp')


const upload = multer({
    limits: {
        fileSize: 100000000
    }
})

/**
 * @swagger
 * /users:
 *   post:
 *     summary: Crée un nouvel utilisateur
 *     description: Crée un nouvel utilisateur avec les informations fournies dans le corps de la requête
 *     tags:
 *       - Utilisateurs
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               name : string,
 *               username:
 *                 type: string
 *               email:
 *                 type: string
 *               password:
 *                 type: string
 *             example:
 *               "name" : "john"
 *               username: John Doe
 *               email: johndoe@example.com
 *               password: password123
 *     responses:
 *       201:
 *         description: Utilisateur créé avec succès
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 _id:
 *                   type: string
 *                   description: L'ID de l'utilisateur créé
 *                 name:
 *                  type: string
 *                  description: Le nom de l'utilisateur
 *                 username:
 *                   type: string
 *                   description: L'identifiant de l'utilisateur
 *                 email:
 *                   type: string
 *                   description: L'email de l'utilisateur
 *       400:
 *         description: Erreur lors de la création de l'utilisateur
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 error:
 *                   type: string
 *                   description: Description de l'erreur survenue
 */

/**
 * @swagger
 * /users/{id}:
 *   get:
 *     summary: Récupère un utilisateur par ID
 *     description: Récupère un utilisateur spécifique en fonction de son ID
 *     tags:
 *      - Utilisateurs
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         description: ID de l'utilisateur à récupérer
 *         schema:
 *           type: string
 *     responses:
 *       200:
 *         description: Utilisateur récupéré avec succès
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/User'
 *       404:
 *         description: Utilisateur non trouvé
 *       500:
 *         description: Erreur lors de la récupération de l'utilisateur
 */

/**
 * @swagger
 * /users:
 *   get:
 *     summary: Récupère tous les utilisateurs
 *     description: Récupère la liste de tous les utilisateurs enregistrés dans la base de données
 *     tags:
 *      - Utilisateurs
 *     responses:
 *       200:
 *         description: Liste de tous les utilisateurs récupérée avec succès
 *         content:
 *           application/json:
 *             schema:
 *               type: array
 *               items:
 *                 $ref: '#/components/schemas/User'
 *       500:
 *         description: Erreur lors de la récupération des utilisateurs
 */


/**
 * @swagger
 * /users/{id}:
 *   patch:
 *     summary: Mettre à jour un utilisateur
 *     description: Mettez à jour les informations d'un utilisateur.
 *     tags:
 *       - Utilisateurs
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         description: L'ID de l'utilisateur à mettre à jour.
 *         schema:
 *           type: string
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               name:
 *                 type: string
 *               email:
 *                 type: string
 *               password:
 *                 type: string
 *               age:
 *                 type: integer
 *               website:
 *                 type: string
 *               bio:
 *                 type: string
 *               location:
 *                 type: string
 *     responses:
 *       '200':
 *         description: Utilisateur mis à jour avec succès.
 *       '400':
 *         description: Requête invalide.
 *       '404':
 *         description: Utilisateur non trouvé.
 */

/**
 * @swagger
 * /users/{id}:
 *   delete:
 *     summary: Supprimer un utilisateur
 *     description: Supprime un utilisateur.
 *     tags:
 *       - Utilisateurs
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         description: L'ID de l'utilisateur à supprimer.
 *         schema:
 *           type: string
 *     responses:
 *       '200':
 *         description: Utilisateur supprimé avec succès.
 *       '404':
 *         description: Utilisateur non trouvé.
 */

// ... annotations pour les autres routes ...

/**
 * @swagger
 * /users/{id}:
 *   delete:
 *     summary: Supprimer un utilisateur
 *     description: Supprime un utilisateur en fonction de son ID.
 *     tags:
 *       - Utilisateurs
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         description: ID de l'utilisateur à supprimer.
 *         schema:
 *           type: string
 *     responses:
 *       '200':
 *         description: Utilisateur supprimé avec succès.
 *       '404':
 *         description: Utilisateur non trouvé.
 */

/**
 * @swagger
 * /users/me/avatar:
 *   post:
 *     summary: Ajouter une image de profil à l'utilisateur actuel
 *     description: Ajoute une image de profil à l'utilisateur actuellement connecté.
 *     tags:
 *       - Utilisateurs
 *     security:
 *       - bearerAuth: []
 *     requestBody:
 *       required: true
 *       content:
 *         multipart/form-data:
 *           schema:
 *             type: object
 *             properties:
 *               avatar:
 *                 type: string
 *                 format: binary
 *     responses:
 *       '200':
 *         description: Image de profil ajoutée avec succès.
 *       '400':
 *         description: Requête invalide.
 */

/**
 * @swagger
 * /users/me/avatar:
 *   delete:
 *     summary: Supprimer l'image de profil de l'utilisateur actuel
 *     description: Supprime l'image de profil de l'utilisateur actuellement connecté.
 *     tags:
 *       - Utilisateurs
 *     security:
 *       - bearerAuth: []
 *     responses:
 *       '200':
 *         description: Image de profil supprimée avec succès.
 */


/**
 * @swagger
 * /users/me/avatar/{id}:
 *   patch:
 *     summary: Mettre à jour l'avatar de l'utilisateur actuel
 *     description: Met à jour l'avatar de l'utilisateur actuellement connecté.
 *     tags:
 *       - Utilisateurs
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         description: ID de l'avatar à mettre à jour.
 *         schema:
 *           type: string
 *     requestBody:
 *       required: true
 *       content:
 *         multipart/form-data:
 *           schema:
 *             type: object
 *             properties:
 *               avatar:
 *                 type: string
 *                 format: binary
 *     responses:
 *       '200':
 *         description: Avatar mis à jour avec succès.
 *       '400':
 *         description: Requête invalide.
 */

/**
 * @swagger
 * /users/{id}/avatar:
 *   get:
 *     summary: Obtenir l'avatar d'un utilisateur par ID
 *     description: Obtenir l'avatar d'un utilisateur spécifique en fonction de son ID.
 *     tags:
 *       - Utilisateurs
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         description: ID de l'utilisateur pour obtenir l'avatar.
 *         schema:
 *           type: string
 *     responses:
 *       '200':
 *         description: Avatar de l'utilisateur récupéré avec succès.
 *       '404':
 *         description: Utilisateur non trouvé ou avatar inexistant.
 */

/**
 * @swagger
 * /users/{id}/follow:
 *   put:
 *     summary: Suivre un utilisateur par ID
 *     description: Suivre un utilisateur spécifique en fonction de son ID.
 *     tags:
 *       - Utilisateurs
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         description: ID de l'utilisateur à suivre.
 *         schema:
 *           type: string
 *     responses:
 *       '200':
 *         description: Vous suivez maintenant cet utilisateur.
 *       '403':
 *         description: Vous suivez déjà cet utilisateur ou vous essayez de vous suivre vous-même.
 */

/**
 * @swagger
 * /users/{id}/unfollow:
 *   put:
 *     summary: Ne plus suivre un utilisateur par ID
 *     description: Cessez de suivre un utilisateur spécifique en fonction de son ID.
 *     tags:
 *       - Utilisateurs
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         description: ID de l'utilisateur à ne plus suivre.
 *         schema:
 *           type: string
 *     responses:
 *       '200':
 *         description: Vous ne suivez plus cet utilisateur.
 *       '403':
 *         description: Vous ne suiviez pas cet utilisateur ou vous essayez de ne plus vous suivre vous-même.
 */

/**
 * @swagger
 * /users/{id}/followersCount:
 *   get:
 *     summary: Obtenir le nombre de followers d'un utilisateur par ID
 *     description: Obtenir le nombre de followers d'un utilisateur spécifique en fonction de son ID.
 *     tags:
 *       - Utilisateurs
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         description: ID de l'utilisateur pour obtenir le nombre de followers.
 *         schema:
 *           type: string
 *     responses:
 *       '200':
 *         description: Nombre de followers récupéré avec succès.
 *       '404':
 *         description: Utilisateur non trouvé.
 */

/**
 * @swagger
 * /users/{id}/followingsCount:
 *   get:
 *     summary: Obtenir le nombre de followings d'un utilisateur par ID
 *     description: Obtenir le nombre de followings d'un utilisateur spécifique en fonction de son ID.
 *     tags:
 *       - Utilisateurs
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         description: ID de l'utilisateur pour obtenir le nombre de followings.
 *         schema:
 *           type: string
 *     responses:
 *       '200':
 *         description: Nombre de followings récupéré avec succès.
 *       '404':
 *         description: Utilisateur non trouvé.
 */

/**
 * @swagger
 * /users/{id}/followings:
 *   get:
 *     summary: Obtenir la liste des utilisateurs suivis par un utilisateur par ID
 *     description: Obtenir la liste des utilisateurs suivis par un utilisateur spécifique en fonction de son ID.
 *     tags:
 *       - Utilisateurs
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         description: ID de l'utilisateur pour obtenir la liste des utilisateurs suivis.
 *         schema:
 *           type: string
 *     responses:
 *       '200':
 *         description: Liste des utilisateurs suivis récupérée avec succès.
 *       '404':
 *         description: Utilisateur non trouvé.
 */

router.post('/users', async (req, res) => {
    const user = new User(req.body);

    try {
        await user.save();
        console.log(user);
        res.status(201).send(user);
    } catch (e) {
        res.status(400).send(e);
    }
});

router.post('/users/login', async (req, res) => {
    try {
        const user = await User.findByCredentials(req.body.email, req.body.password);
        const token = await user.generateAuthToken();
        res.send({ user, token });
    } catch (e) {
        res.status(400).send(e);
    }   
});

router.get('/users', async (req, res) => {
    try {
        const users = await User.find({});
        res.send(users);
    } catch (e) {
        res.status(500).send();
    }
});

router.get('/users/:id', async (req, res) => {
    const _id = req.params.id;

    try {
        const user = await User.findById(_id);

        if (!user) {
            return res.status(404).send();
        }

        res.send(user);
    } catch (e) {
        res.status(500).send();
    }
});

router.patch('/users/:id', auth, upload.single('avatar'), async (req, res) => {
    const updates = Object.keys(req.body)
    console.log(updates)
    const allowedUpdates = ['name', 'email', 'password', 'age', 'website', 'bio', 'location']
    const isValidOperation = updates.every((update) => allowedUpdates.includes(update))
    
    if (!isValidOperation) {
        return res.status(400).send({
            error: 'Invalid updates!'
        })
    }

    try {
        const user = await User.findById(req.params.id)

        updates.forEach((update) => user[update] = req.body[update])
        await user.save()

        if (!user) {
            return res.status(404).send()
        }

        res.send(user)
    } catch (e) {
        res.status(400).send(e)
    }
})




router.delete('/users/:id', async (req, res) => {
    try {
        const user = await User.findByIdAndDelete(req.params.id)

        if (!user) {
            return res.status(404).send()
        }

        res.send(user)
    } catch (e) {
        res.status(500).send()
    }
})


router.post('/users/me/avatar', auth, upload.single('avatar'), async (req, res) => {
    const buffer = await sharp(req.file.buffer).resize({ width: 250, height: 250 }).png().toBuffer()
    if (req.user.avatar != null) {
        req.user.avatar = null
    }
    req.user.avatar = buffer
    req.user.avatarExists = true
    await req.user.save()
    console.log(req.user.avatar)
    res.send()
}, (error, req, res, next) => {
    res.status(400).send({ error: error.message })
})

router.delete('/users/me/avatar', auth, async (req, res) => {
    req.user.avatar = undefined
    await req.user.save()
    res.send()
})

router.patch('/users/me/avatar/:id', auth, upload.single('avatar'), async (req, res) => {
    console.log(req.user)
    console.log(req.user.avatar)
    const buffer = await sharp(req.file.buffer).resize({ width: 250, height: 250 }).png().toBuffer()
    console.log(buffer)
    if (buffer != req.user.avatar) {
        console.log("true")
    }
    req.user.avatar = null
    req.user.avatar = buffer
    await req.user.save()
    res.send()
}, (error, req, res, next) => {
    res.status(400).send({ error: error.message })
})


router.get('/users/:id/avatar', async (req, res) => {
    try {
        const user = await User.findById(req.params.id)

        if (!user || !user.avatar) {
            throw new Error()
        }
        res.set('Content-Type', 'image/jpg')
        res.send(user.avatar)
    } catch (e) {
        res.status(404).send()
    }
})

router.put('/users/:id/follow', auth, async (req, res) => {
    if (req.user.id != req.params.id) {
        try {
            const user = await User.findById(req.params.id);
            if (!user.followers.includes(req.user.id)) {
            await user.updateOne({ $push: { followers: req.user.id } });
            await req.user.updateOne({ $push: { followings: req.params.id } });
            res.status(200).json("user has been followed");
            } else {
                res.status(403).json("you allready follow this user");
            }
        } catch (err) {
            res.status(500).json(err);
        }
    }
    else {
        res.status(403).json("you cant follow yourself")
    }
});

router.put('/users/:id/unfollow', auth, async (req, res) => {
    if (req.user.id != req.params.id) {
        try {
            const user = await User.findById(req.params.id);
            if (user.followers.includes(req.user.id)) {

            await user.updateOne({ $pull: { followers: req.user.id } });
            await req.user.updateOne({ $pull: { followings: req.params.id } });
            res.status(200).json("user has been unfollowed");
            } else {
                res.status(403).json("you dont follow this user");
            }
        } catch (err) {
            res.status(500).json(err);
        }
    }
    else {
        res.status(403).json("you cant unfollow yourself")
    }
});


router.put("/:id/follow", async (req, res) => {
  if (req.body.userId !== req.params.id) {
    try {
      const user = await User.findById(req.params.id);
      const currentUser = await User.findById(req.body.userId);
      if (!user.followers.includes(req.body.userId)) {
        await user.updateOne({ $push: { followers: req.body.userId } });
        await currentUser.updateOne({ $push: { followings: req.params.id } });
        res.status(200).json("user has been followed");
      } else {
        res.status(403).json("you allready follow this user");
      }
    } catch (err) {
      res.status(500).json(err);
    }
  } else {
    res.status(403).json("you cant follow yourself");
  }
});

router.get('/users/:id/followersCount', async (req, res) => {
    try {
        const user = await User.findById(req.params.id);

        if (!user) {
            return res.status(404).send();
        }

        const followersCount = user.followers.length;
        console.log("Followers Count:", followersCount); // Ajoutez cette ligne
        res.send({ followersCount });
    } catch (e) {
        console.error("Error fetching followers count:", e); // Ajoutez cette ligne
        res.status(500).send();
    }
});

router.get('/users/:id/followingsCount', async (req, res) => {
    try {
        const user = await User.findById(req.params.id);

        if (!user) {
            return res.status(404).send();
        }

        const followingsCount = user.followings.length;
        console.log("Followings Count:", followingsCount); // Ajoutez cette ligne
        res.send({ followingsCount });
    } catch (e) {
        console.error("Error fetching followings count:", e); // Ajoutez cette ligne
        res.status(500).send();
    }
});

router.get('/users/:id/followings', auth, async (req, res) => {
    try {
        const user = await User.findById(req.params.id);

        if (!user) {
            return res.status(404).send();
        }

        // Trouver les utilisateurs suivis
        const followings = await User.find({ '_id': { $in: user.followings } });

        // Extraire les noms d'utilisateur
        const followingsUsernames = followings.map(u => u.username);

        res.send(followingsUsernames);
    } catch (e) {
        console.error("Error fetching followings:", e);
        res.status(500).send();
    }
});


module.exports = router