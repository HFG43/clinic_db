/* Database schema to keep the structure of entire database. */
CREATE DATABASE clinic;

CREATE TABLE patients (id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY, name VARCHAR(200), date_of_birth DATE);

CREATE TABLE medical_histories (id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY, admitted_at TIMESTAMP, patient_id INT, status VARCHAR(100), CONSTRAINT fk_patients FOREIGN KEY (patient_id) REFERENCES patients(id) ON UPDATE CASCADE);

CREATE TABLE invoices ( id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY, total_amount DECIMAL(8,2), generated_at TIMESTAMP, payed_at TIMESTAMP, medical_history_id INT, CONSTRAINT fk_medical_hist FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id) ON UPDATE CASCADE);
