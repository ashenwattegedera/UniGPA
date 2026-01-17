
CREATE TABLE IF NOT EXISTS users (
    id BIGINT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS degrees (
    id BIGINT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Note: We are altering the modules table to link to degree instead of user.
-- Since data preservation is not critical, we can drop the old constraint and column if needed,
-- but for simplicity in this script we will just add the new one and encourage a fresh start.
-- Ideally, modules table definition should be updated if recreating.

-- If running on an existing DB, we need to handle the schema change.
-- DROP module foreign key to users if it exists (constraint name might vary, so this might fail if not exact)
-- ALTER TABLE modules DROP FOREIGN KEY fk_user_module; 
-- ALTER TABLE modules DROP COLUMN user_id;

-- Add degree_id to modules
ALTER TABLE modules ADD COLUMN degree_id BIGINT;
ALTER TABLE modules ADD CONSTRAINT fk_degree_module FOREIGN KEY (degree_id) REFERENCES degrees(id) ON DELETE CASCADE;
