import { Router } from "express";
import prisma from "../../lib/prisma";

const router = Router()

router.get("/", async (req, res) => {
    /*
    #swagger.tags = ['Hospital']
    #swagger.summary = 'Get hospital by id'
    #swagger.parameters['id'] = {
        in: 'body',
        description: 'The hospital id',
        required: true,
        type: number
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
        const { id } = req.body
        const currentHospital = await prisma.hospital.findFirst({ where: { id: +id }, include: { Psychiatrist: true, Patient: true } })
        if (currentHospital)
            return res.status(200).json({
                'Hospital name': currentHospital.name,
                'Total Psychiatrist count': currentHospital.Psychiatrist.length,
                'Total patients count': currentHospital.Patient.length,
                'Psychiatrist Details': currentHospital.Psychiatrist
            })
        else
            return res.status(404).send('Hospital not found. Please check the entered hospital id')
    } catch (error: any) {
        res.status(500).send(error)
    }
})


export default router