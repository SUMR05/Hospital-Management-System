# Hospital Management System

A MySQL database project for managing hospital operations — patients, doctors, appointments, and prescriptions — with queries for schedules, patient history, and doctor visit stats.

## Schema

| Table | Description |
|---|---|
| `Patients` | Patient ID, name, age, gender, phone |
| `Doctors` | Doctor ID, name, specialization, phone |
| `Appointments` | Links a patient to a doctor with a date and status (`Scheduled`, `Completed`, etc.) |
| `Prescriptions` | Medicine and notes tied to an appointment |

Includes a `CHECK` constraint ensuring patient age is always positive.

## Sample Queries Included

- **Doctor schedule** — upcoming/past appointments per doctor
- **Patient history** — a patient's appointments and prescriptions
- **Most visited doctors** — appointment counts, ranked

## Tech Stack

- MySQL

## How to Run

1. Open a MySQL client (MySQL Workbench, phpMyAdmin, or the CLI).
2. Run the script:
   ```sql
   SOURCE Hospital Management System.sql;
   ```
   This creates the `hospital_db` database, builds the tables, seeds sample data, and runs the included reporting queries.

## Future Improvements

- Add a frontend/API layer for patient registration, appointment booking, and billing
- Add a `Billing` table for invoicing and payments

## Author

Sanampudi Uma Maheswara Reddy
