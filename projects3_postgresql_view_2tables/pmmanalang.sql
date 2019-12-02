--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 12.0

-- Started on 2019-12-02 14:07:23

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 16 (class 2615 OID 16734)
-- Name: pmmanalang; Type: SCHEMA; Schema: -; Owner: datama2mi182
--

CREATE SCHEMA pmmanalang;


ALTER SCHEMA pmmanalang OWNER TO datama2mi182;

--
-- TOC entry 4054 (class 0 OID 0)
-- Dependencies: 16
-- Name: SCHEMA pmmanalang; Type: COMMENT; Schema: -; Owner: datama2mi182
--

COMMENT ON SCHEMA pmmanalang IS 'B.B.';


SET default_tablespace = '';

--
-- TOC entry 270 (class 1259 OID 19826)
-- Name: department; Type: TABLE; Schema: pmmanalang; Owner: datama2mi182
--

CREATE TABLE pmmanalang.department (
    id integer NOT NULL,
    codename character varying(45)
);


ALTER TABLE pmmanalang.department OWNER TO datama2mi182;

--
-- TOC entry 285 (class 1259 OID 20094)
-- Name: employee; Type: TABLE; Schema: pmmanalang; Owner: datama2mi182
--

CREATE TABLE pmmanalang.employee (
    id integer NOT NULL,
    emp_idn character varying(45) NOT NULL,
    person_id integer,
    department_id integer
);


ALTER TABLE pmmanalang.employee OWNER TO datama2mi182;

--
-- TOC entry 271 (class 1259 OID 19868)
-- Name: person; Type: TABLE; Schema: pmmanalang; Owner: datama2mi182
--

CREATE TABLE pmmanalang.person (
    id integer NOT NULL,
    first_name character varying(45) NOT NULL,
    middle_name character varying(45),
    last_name character varying(45) NOT NULL,
    contact_number character varying(15),
    address character varying(80) NOT NULL,
    age integer NOT NULL,
    birthdate character varying(45) NOT NULL
);


ALTER TABLE pmmanalang.person OWNER TO datama2mi182;

--
-- TOC entry 287 (class 1259 OID 20121)
-- Name: employee_details; Type: VIEW; Schema: pmmanalang; Owner: datama2mi182
--

CREATE VIEW pmmanalang.employee_details AS
 SELECT person.first_name,
    person.last_name,
    person.contact_number,
    person.address,
    employee.emp_idn,
    department.codename
   FROM ((pmmanalang.employee
     JOIN pmmanalang.person USING (id))
     JOIN pmmanalang.department USING (id));


ALTER TABLE pmmanalang.employee_details OWNER TO datama2mi182;

--
-- TOC entry 4046 (class 0 OID 19826)
-- Dependencies: 270
-- Data for Name: department; Type: TABLE DATA; Schema: pmmanalang; Owner: datama2mi182
--

INSERT INTO pmmanalang.department VALUES (1, 'TRP-QC');
INSERT INTO pmmanalang.department VALUES (2, 'SUJI-TOSHI');
INSERT INTO pmmanalang.department VALUES (3, 'PPAP');
INSERT INTO pmmanalang.department VALUES (4, 'TRP-IN HOUSE');


--
-- TOC entry 4048 (class 0 OID 20094)
-- Dependencies: 285
-- Data for Name: employee; Type: TABLE DATA; Schema: pmmanalang; Owner: datama2mi182
--

INSERT INTO pmmanalang.employee VALUES (1, '2015-000020', 3, 1);
INSERT INTO pmmanalang.employee VALUES (2, '2005-000100', 1, 4);
INSERT INTO pmmanalang.employee VALUES (3, '2019-100002', 2, 3);
INSERT INTO pmmanalang.employee VALUES (4, '2010-300450', 5, 1);
INSERT INTO pmmanalang.employee VALUES (5, '2014-204055', 4, 2);


--
-- TOC entry 4047 (class 0 OID 19868)
-- Dependencies: 271
-- Data for Name: person; Type: TABLE DATA; Schema: pmmanalang; Owner: datama2mi182
--

INSERT INTO pmmanalang.person VALUES (1, 'Alana', 'Gay', 'Lara', '9187635601', '135 Andover Street
		Canal Winchester, OH 43110', 20, 'July 06, 1999');
INSERT INTO pmmanalang.person VALUES (2, 'Steve', 'Grave', 'Frank', '9256632901', '380 High Ave.
		Chevy Chase, MD 20815', 36, 'November 28, 1983');
INSERT INTO pmmanalang.person VALUES (3, 'Zain', 'Cole', 'Wiley', '9094567872', '9697 North Heather Drive
		Lake Villa, IL 60046', 25, 'March 06, 1994');
INSERT INTO pmmanalang.person VALUES (4, 'Jayden', 'Moss', 'Park', '9983216791', '7436 Adams Dr.
		Severn, MD 21144', 40, 'October 20, 1979');
INSERT INTO pmmanalang.person VALUES (5, 'Ricky', 'Joe', 'Ruiz', '9220923119', '749 County St.
		Buckeye, AZ 85326', 23, 'August 13, 1996');


--
-- TOC entry 3878 (class 2606 OID 19830)
-- Name: department department_pkey; Type: CONSTRAINT; Schema: pmmanalang; Owner: datama2mi182
--

ALTER TABLE ONLY pmmanalang.department
    ADD CONSTRAINT department_pkey PRIMARY KEY (id);


--
-- TOC entry 3882 (class 2606 OID 20100)
-- Name: employee employee_emp_idn_key; Type: CONSTRAINT; Schema: pmmanalang; Owner: datama2mi182
--

ALTER TABLE ONLY pmmanalang.employee
    ADD CONSTRAINT employee_emp_idn_key UNIQUE (emp_idn);


--
-- TOC entry 3884 (class 2606 OID 20098)
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: pmmanalang; Owner: datama2mi182
--

ALTER TABLE ONLY pmmanalang.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);


--
-- TOC entry 3880 (class 2606 OID 19872)
-- Name: person person_pkey; Type: CONSTRAINT; Schema: pmmanalang; Owner: datama2mi182
--

ALTER TABLE ONLY pmmanalang.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- TOC entry 3886 (class 2606 OID 20106)
-- Name: employee employee_department_id_fkey; Type: FK CONSTRAINT; Schema: pmmanalang; Owner: datama2mi182
--

ALTER TABLE ONLY pmmanalang.employee
    ADD CONSTRAINT employee_department_id_fkey FOREIGN KEY (department_id) REFERENCES pmmanalang.department(id);


--
-- TOC entry 3885 (class 2606 OID 20101)
-- Name: employee employee_person_id_fkey; Type: FK CONSTRAINT; Schema: pmmanalang; Owner: datama2mi182
--

ALTER TABLE ONLY pmmanalang.employee
    ADD CONSTRAINT employee_person_id_fkey FOREIGN KEY (person_id) REFERENCES pmmanalang.person(id);


-- Completed on 2019-12-02 14:07:23

--
-- PostgreSQL database dump complete
--

