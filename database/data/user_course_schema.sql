DROP TABLE IF EXISTS rosters;
DROP TABLE IF EXISTS class_info;
DROP TABLE IF EXISTS classes;
DROP TABLE IF EXISTS instructor_info;
DROP TABLE IF EXISTS users CASCADE;


-- User Tables --

CREATE TABLE users (
    user_id          INTEGER        PRIMARY KEY AUTO_INCREMENT,
    email            VARCHAR(255)   UNIQUE NOT NULL,
    account_type     VARCHAR(11),
    passwd           VARCHAR(255)   NOT NULL,
    first_name       TEXT           NOT NULL,
    last_name        TEXT           NOT NULL,
    CONSTRAINT passwdLength CHECK   (LENGTH(passwd) > 8),
    CONSTRAINT idMaxSize    CHECK   (id < 100000000)
);

CREATE TABLE instructor_info (
    user_id          INTEGER        REFERENCES users(id),
    office           TEXT,
    phone_number     INTEGER,

    CONSTRAINT validPhoneNumber CHECK (phone_number BETWEEN 999999999 AND 10000000000)
);

-- Class Tables --

CREATE TABLE classes (
    class_id         INTEGER        PRIMARY KEY AUTO_INCREMENT,
    subject          VARCHAR(5)     NOT NULL,
    course           INTEGER        NOT NULL,
    section          INTEGER        NOT NULL,
    title            TEXT           NOT NULL,

    CONSTRAINT check_id      CHECK (id BETWEEN 9999 AND 100000),
    CONSTRAINT check_section CHECK (section > 0),
    CONSTRAINT check_cn      CHECK (course_number BETWEEN 0 AND 999)
);

CREATE TABLE class_info (
    class_id         INTEGER        REFERENCES classes(class_id),
    semester         VARCHAR(6)     NOT NULL,
    year             INTEGER        NOT NULL,
    instructor       INTEGER        REFERENCES users(id),
    class_key        VARCHAR(12)    UNIQUE NOT NULL,

    CONSTRAINT check_year    CHECK (year BETWEEN 2013 AND 10000)
    CONSTRAINT check_section CHECK (section > 0),
    CONSTRAINT check_cn      CHECK (course_number BETWEEN 0 AND 999)
);

ALTER TABLE classes AUTO_INCREMENT = 10000;

CREATE TABLE rosters (
    class_id         INTEGER        REFERENCES classes(class_id),
    user_id          INTEGER        REFERENCES users(user_id)
);

-- Assignment Submission and Assignment Information Tables --

CREATE TABLE assignment_storage (
    assignment_data VARCHAR(255), NOT NULL,
    assignment_id   INTEGER(5)  NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id         INTEGER     REFERENCES users(user_id),
    class_id        INTEGER     REFERENCES classes(class_id)
    assignment_des  TEXT,
    assignment_name TEXT        NOT NULL,
    assign_date     DATE        NOT NULL,
    due_date        DATETIME    NOT NULL,
    file_share      BOOLEAN     DEFAULT(0)
);
