const express = require('express');
const auth = require('../middleware/auth');
const Notification = require('../models/notification');

const router = new express.Router();



/**
 * @swagger
 * /notifications:
 *   post:
 *     summary: Créer une nouvelle notification
 *     description: Crée une nouvelle notification pour l'utilisateur connecté.
 *     tags:
 *       - Notifications
 *     security:
 *       - bearerAuth: []
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               // Ajoutez ici les propriétés de la notification à envoyer dans la requête
 *     responses:
 *       '201':
 *         description: Notification créée avec succès.
 *       '400':
 *         description: Requête invalide.
 */

/**
 * @swagger
 * /notifications:
 *   get:
 *     summary: Obtenir toutes les notifications
 *     description: Récupère toutes les notifications existantes.
 *     tags:
 *       - Notifications
 *     responses:
 *       '200':
 *         description: Liste des notifications récupérée avec succès.
 *       '500':
 *         description: Erreur interne du serveur.
 */

/**
 * @swagger
 * /notifications/{id}:
 *   get:
 *     summary: Obtenir les notifications par ID utilisateur
 *     description: Récupère les notifications spécifiques en fonction de l'ID utilisateur.
 *     tags:
 *       - Notifications
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         description: ID de l'utilisateur pour obtenir les notifications.
 *         schema:
 *           type: string
 *     responses:
 *       '200':
 *         description: Notifications récupérées avec succès.
 *       '500':
 *         description: Erreur interne du serveur.
 */


router.post('/notifications', auth, async (req, res) => {
    const notification = new Notification({
        ...req.body,
        user: req.user._id
    })
    try {
        await notification.save()
        res.status(201).send(notification)
    } catch (e) {
        res.status(400).send(e)
    }
})

router.get('/notifications', async (req, res) => {
    try {
        const notifications = await Notification.find({})
        res.send(notifications)
    }
    catch (err) {
        res.status(500).send(err)
    }
})

router.get('/notifications/:id', async (req, res) => {
    const _id = req.params.id
    try {
        const notifications = await Notification.find({ notReceiverId: _id})
        res.send(notifications)
    }
    catch (err) {
        res.status(500).send(err)
    }
})


module.exports = router;