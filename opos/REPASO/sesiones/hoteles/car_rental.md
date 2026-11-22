# Car rental agency

DAW1.BD Examen Trimestre I.1

## Customer
- id_customer
- full name
- address
- type of license: AM, A1, A2, A, B, BE
- license issue date
- license expiration date

## Car
- id_car (registration)
- manufacturer
- model
- types: diesel, petrol, electric
- registration date
- capacity
- mileage total (km)

## Rental
- id_car, id_customer
- insurance paid (yes/no)
- date when it's rented
- date when it should be returned
- milage partial (km)
- price
- VAT

The price depends on the number of days, types of car: diesel, petrol, electric
It's important to store the price without and with VAT and the percentage of VAT
that has been applied.

