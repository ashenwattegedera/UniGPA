
CREATE TABLE IF NOT EXISTS users (
    id BIGINT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

-- Add user_id to modules if it doesn't exist
-- Note: complex logic to check for column existence usually requires procedure in MySQL or ignore error
-- We will try to add it. If this script is run on fresh DB, modules might need creation first.
-- Assuming modules table already exists from previous context.

ALTER TABLE modules ADD COLUMN user_id BIGINT;
ALTER TABLE modules ADD CONSTRAINT fk_user_module FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE;
