/* Database schema to keep the structure of entire database. */
CREATE DATABASE clinic;

CREATE TABLE patients (id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY, name VARCHAR(200), date_of_birth DATE);

CREATE TABLE medical_histories (id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY, admitted_at TIMESTAMP, patient_id INT, status VARCHAR(100), CONSTRAINT fk_patients FOREIGN KEY (patient_id) REFERENCES patients(id) ON UPDATE CASCADE);

CREATE TABLE invoices ( id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY, total_amount DECIMAL(8,2), generated_at TIMESTAMP, payed_at TIMESTAMP, medical_history_id INT, CONSTRAINT fk_medical_hist FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id) ON UPDATE CASCADE);

CREATE TABLE treatments (id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY, type VARCHAR(100), name VARCHAR(200));

CREATE TABLE invoice_items (id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY, unit_price DECIMAL(8,2), quantity INT, total_price DECIMAL(8,2), invoice_id INT, treatment_id INT, CONSTRAINT fk_invoice_id FOREIGN KEY (invoice_id) REFERENCES invoices(id) ON UPDATE CASCADE, CONSTRAINT fk_treatments_id FOREIGN KEY (treatment_id) REFERENCES treatments(id) ON UPDATE CASCADE);

CREATE TABLE treatments_history (id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY, medical_histories_id INT, treatments_id INT, CONSTRAINT fk_med_hist FOREIGN KEY (medical_histories_id) REFERENCES medical_histories(id) ON UPDATE CASCADE, CONSTRAINT fk_treats FOREIGN KEY (treatments_id) REFERENCES treatments(id) ON UPDATE CASCADE);

CREATE INDEX index_patient_id ON medical_histories(patient_id);

CREATE INDEX index_medical_history_id ON invoices(medical_history_id);

CREATE INDEX index_invoice_id ON invoice_items(invoice_id);

CREATE INDEX index_treatment_id ON invoice_items(treatment_id);

CREATE INDEX index_medical_histories_id ON treatments_history(medical_histories_id);

CREATE INDEX index_treatments_id ON treatments_history(treatments_id);