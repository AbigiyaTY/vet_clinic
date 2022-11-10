CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    name varchar(100),
    date_of_birth date
);

CREATE TABLE medical_histories (
    id SERIAL PRIMARY KEY,
    admitted_at TIMESTAMP,
    patients_id INT,
    status varchar(255),
    FOREIGN KEY(patients_id) REFERENCES patients(id)
 );
 
CREATE TABLE treatments(
    id serial PRIMARY KEY, 
    type VARCHAR(50),
    name VARCHAR(50)
    );
    

 CREATE TABLE invoices(
    id serial PRIMARY KEY, 
    total_amount decimal,
    generated_at TIMESTAMP,
	payed_at TIMESTAMP,
	medical_history_id INT,
	FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id)
	);
	
CREATE TABLE invoice_items(
    id serial PRIMARY KEY, 
    unit_price DECIMAL, 
    quantity INT, 
    total_price DECIMAL,
    invoice_id INT REFERENCES invoices(id), 
    treatment_id INT,
    FOREIGN KEY (treatment_id) REFERENCES treatments(id),
    FOREIGN KEY (invoice_id) REFERENCES invoices(id)    
);

CREATE TABLE medical_histories_has_treatments (
    medical_history_id int references medical_histories(id),
    treatment_id int references treatments(id),
    );

CREATE INDEX index_medical_histories_id ON medical_histories_has_treatments(medical_history_id);
CREATE INDEX index_treatment_id ON medical_histories_has_treatments(treatment_id);
CREATE INDEX index_treatment_histories ON medical_histories(id);
CREATE INDEX index_treatment_id ON invoice_items(treatment_id);
CREATE INDEX index_invoice_items ON invoice_items(invoice_id);
CREATE INDEX index_invoices ON invoices(medical_history_id);
