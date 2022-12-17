# NodeJS-Mysql test for Lattice

## Table of contents
* [Frameworks/Libraries](#frameworks/libraries)
* [API endpoints](#api-endpoints)

## Frameworks/Libraries
* Express: 4.18.1
* Prisma: 4.7.1
* Typescript: 4.9.4
* Helmet: 6.0.1
* Swagger-ui-express: 4.6.0
* Express-validator: 6.14.2

## API endpoints

### Add a new patient record
- Path: '/patient'
- Method: Post
- Parameters:
    * name
    * address (should be at least 10 characters)
    * email (should be a valid email address)
    * phoneNumber (should be at least 10 number + country code)
    * password (must contain one upper character, one lower character and a number. Max length 15 and min length 8)
    * photo 
- Response:
    * success: status(201)
    * validation error: status(400)


### Fetch a specific hospital by hospital id
- Path: '/hospital'
- Method: Get
- Parameters:
    * id
- Response:
    * success: status(200)
    * not found: status(404)
- Response format:
    {
Hospital name,  
Total Psychiatrist count ,
Total patients count,
Psychiatrist Details [
Id,
Name,
Patients count:  
]
}


