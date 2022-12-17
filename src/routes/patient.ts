import { Router } from "express";
import prisma from "../../lib/prisma";
import { validationResult, check } from 'express-validator';
import { Prisma } from "@prisma/client";


const router = Router()

router.post("/",
    check('name').isLength({ min: 1 }).withMessage("Please provide the patient's name"),
    check('address').isLength({ min: 10 }).withMessage('Address should be at least 10 characters'),
    check('email').isEmail().withMessage('Please write a valid email address'),
    check('phoneNumber').isMobilePhone('any', { strictMode: true }).withMessage('Phone number should be at least 10 numbers plus country code and starts with a "+"'),
    async (req, res) => {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            return res.status(400).json({ errors: errors.array() });
        }
        /*
        #swagger.tags = ['Patient']
        #swagger.summary = 'Add a new patient record'
        #swagger.parameters['name', 'address', 'email', 'phoneNumber', 'password', 'photo', 'hospitalId', 'psychiatristId'] = {
        in: 'body',
        description: 'The new patient data',
        required: true,
        type: string
    }
        */
        try {
            const patientEntries = await prisma.patient.findMany()
            if (patientEntries.length < 20) {
                const doctorEntries = await prisma.psychiatrist.findMany()
                if (doctorEntries.length < 20) {
                    return res.status(400).send('Database contains less than 20 entries')
                }
            }
            const { name, address, email, phoneNumber, password, photo, hospitalId, psychiatristId } = req.body
            const regex = /^(?=.*[0-9])(?=.*[A-Z])(?=.*[a-z]).{8,15}$/
            if (!regex.test(password)) {
                return res.status(400).send('Password must contain one upper character, one lower character and a number')
            }
            const newRecord = await prisma.patient.create({ data: req.body })
            return res.status(201).send('Record created successfully')
        } catch (e: any) {
            if (e instanceof Prisma.PrismaClientKnownRequestError) {
                if (e.code === 'P2002') {
                    return res.status(400).send(
                        'There is a unique constraint violation, a new user cannot be created with this email/phone number'
                    )
                }
            }
            throw e
        }
    })

export default router