const express = require('express')
const Tweet = require('../models/tweet')
//const auth = require('../middleware/auth')
const router = new express.Router()
const multer = require('multer')
const auth = require('../middleware/auth')
const findTweet = require('../middleware/findTweet')
const sharp = require('sharp')


const upload = multer({
    limits: {
        fileSize: 100000000
    }
})

/**
 * @swagger
 * /uploadTweetImage/{id}:
 *   post:
 *     summary: Télécharger une image pour un tweet spécifique
 *     description: Télécharge une image pour un tweet spécifique à l'aide de son ID.
 *     tags:
 *       - Tweet
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         description: ID du tweet pour télécharger l'image.
 *         schema:
 *           type: string
 *     requestBody:
 *       required: true
 *       content:
 *         multipart/form-data:
 *           schema:
 *             type: object
 *             properties:
 *               upload:
 *                 type: string
 *                 format: binary
 *     responses:
 *       '200':
 *         description: Image du tweet mise à jour avec succès.
 *       '400':
 *         description: Requête invalide.
 */

/**
 * @swagger
 * /tweets:
 *   get:
 *     summary: Obtenir tous les tweets
 *     description: Récupère tous les tweets existants.
 *     tags:
 *       - Tweet
 *     responses:
 *       '200':
 *         description: Liste des tweets récupérée avec succès.
 *       '500':
 *         description: Erreur interne du serveur.
 */

/**
 * @swagger
 * /tweets/{id}:
 *   get:
 *     summary: Obtenir un tweet par ID utilisateur
 *     description: Récupère un tweet spécifique en fonction de l'ID utilisateur.
 *     tags:
 *       - Tweet
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         description: ID de l'utilisateur pour obtenir le tweet.
 *         schema:
 *           type: string
 *     responses:
 *       '200':
 *         description: Tweet récupéré avec succès.
 *       '404':
 *         description: Tweet non trouvé.
 *       '500':
 *         description: Erreur interne du serveur.
 */

/**
 * @swagger
 * /tweets:
 *   post:
 *     summary: Créer un nouveau tweet
 *     description: Crée un nouveau tweet pour l'utilisateur connecté.
 *     tags:
 *       - Tweet
 *     security:
 *       - bearerAuth: []
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               // Ajoutez ici les propriétés du tweet à envoyer dans la requête
 *     responses:
 *       '201':
 *         description: Tweet créé avec succès.
 *       '400':
 *         description: Requête invalide.
 */

/**
 * @swagger
 * /tweets/{id}/image:
 *   get:
 *     summary: Obtenir l'image d'un tweet par ID
 *     description: Récupère l'image d'un tweet spécifique en fonction de son ID.
 *     tags:
 *       - Tweet
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         description: ID du tweet pour obtenir l'image.
 *         schema:
 *           type: string
 *     responses:
 *       '200':
 *         description: Image du tweet récupérée avec succès.
 *       '404':
 *         description: Tweet non trouvé ou image inexistante.
 */

/**
 * @swagger
 * /tweets/{id}/like:
 *   put:
 *     summary: Aimer un tweet par ID
 *     description: Aime un tweet spécifique en fonction de son ID.
 *     tags:
 *       - Tweet
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         description: ID du tweet à aimer.
 *         schema:
 *           type: string
 *     responses:
 *       '200':
 *         description: Vous avez aimé ce tweet.
 *       '403':
 *         description: Vous avez déjà aimé ce tweet.
 *       '500':
 *         description: Erreur interne du serveur.
 */

/**
 * @swagger
 * /tweets/{id}/unlike:
 *   put:
 *     summary: Ne plus aimer un tweet par ID
 *     description: Cessez d'aimer un tweet spécifique en fonction de son ID.
 *     tags:
 *       - Tweet
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         description: ID du tweet à ne plus aimer.
 *         schema:
 *           type: string
 *     responses:
 *       '200':
 *         description: Vous n'aimez plus ce tweet.
 *       '403':
 *         description: Vous n'avez pas aimé ce tweet ou vous essayez d'annuler votre like.
 *       '500':
 *         description: Erreur interne du serveur.
 */


router.post('/uploadTweetImage/:id', auth, upload.single('upload'), async (req, res) => {
    const tweet = await Tweet.findOne({ _id: req.params.id })
    console.log(tweet)
    if (!tweet) {
        throw new Error('Cannot find the tweet')
    }
    const buffer = await sharp(req.file.buffer).resize({ width: 350, height: 350 }).png().toBuffer()
    console.log(buffer)
    tweet.image = buffer
    await tweet.save()
    res.send()
}, (error, req, res, next) => {
    res.status(400).send({ error: error.message })
})

router.get('/tweets', async (req, res) => {
    try {
        const tweets = await Tweet.find({})
        res.send(tweets)
    }
    catch (err) {
        res.status(500).send(err)
    }
})

router.get('/tweets/:id', async (req, res) => {
    const _id = req.params.id

    try {
        const tweet = await Tweet.find({ user: _id })

        if (!tweet) {
            return res.status(404).send()
        }

        res.send(tweet)
    } catch (e) {
        res.status(500).send()
    }
})

router.post('/tweets', auth, async (req, res) => {
    const tweet = new Tweet({
        ...req.body,
        user: req.user._id
    })
    try {
        await tweet.save()
        res.status(201).send(tweet)
    } catch (e) {
        res.status(400).send(e)
    }
})

router.get('/tweets/:id/image', async (req, res) => {
    try {
        const tweet = await Tweet.findById(req.params.id)

        if (!tweet || !tweet.image) {
            throw new Error()
        }
        res.set('Content-Type', 'image/jpg')
        res.send(tweet.image)
    } catch (e) {
        res.status(404).send()
    }
})

router.put('/tweets/:id/like', auth, async (req, res) => {
    try {
        const tweet = await Tweet.findById(req.params.id);
        if (!tweet.likes.includes(req.user.id)) {
        await tweet.updateOne({ $push: { likes: req.user.id } });
        // await req.user.updateOne({ $push: { followings: req.params.id } });
        res.status(200).json("post has been liked");
        console.log('it has been liked');
        } else {
            res.status(403).json("you have already liked this post");
        }
    } catch (err) {
        res.status(500).json(err);
    }
});


router.put('/tweets/:id/unlike', auth, async (req, res) => {
    try {
        const tweet = await Tweet.findById(req.params.id);
        if (tweet.likes.includes(req.user.id)) {
        await tweet.updateOne({ $pull: { likes: req.user.id } });
        // await req.user.updateOne({ $push: { followings: req.params.id } });
        res.status(200).json("post has been unliked");
        } else {
            res.status(403).json("you have already unliked this post");
        }
    } catch (err) {
        res.status(500).json(err);
    }
});

module.exports = router