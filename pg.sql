--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

-- Started on 2017-10-01 15:10:11

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 190 (class 1259 OID 16435)
-- Name: address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE address (
    id integer NOT NULL,
    street character varying(150) NOT NULL,
    number integer NOT NULL
);


ALTER TABLE address OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 16433)
-- Name: address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE address_id_seq OWNER TO postgres;

--
-- TOC entry 2152 (class 0 OID 0)
-- Dependencies: 189
-- Name: address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE address_id_seq OWNED BY address.id;


--
-- TOC entry 188 (class 1259 OID 16424)
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE person (
    id integer NOT NULL,
    name text NOT NULL,
    age integer,
    idtipousuario integer
);


ALTER TABLE person OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 16422)
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE person_id_seq OWNER TO postgres;

--
-- TOC entry 2153 (class 0 OID 0)
-- Dependencies: 187
-- Name: person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE person_id_seq OWNED BY person.id;


--
-- TOC entry 186 (class 1259 OID 16413)
-- Name: tipousuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tipousuario (
    id integer NOT NULL,
    descricao text
);


ALTER TABLE tipousuario OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 16411)
-- Name: tipousuario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipousuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tipousuario_id_seq OWNER TO postgres;

--
-- TOC entry 2154 (class 0 OID 0)
-- Dependencies: 185
-- Name: tipousuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipousuario_id_seq OWNED BY tipousuario.id;


--
-- TOC entry 2017 (class 2604 OID 16438)
-- Name: address id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY address ALTER COLUMN id SET DEFAULT nextval('address_id_seq'::regclass);


--
-- TOC entry 2016 (class 2604 OID 16427)
-- Name: person id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY person ALTER COLUMN id SET DEFAULT nextval('person_id_seq'::regclass);


--
-- TOC entry 2015 (class 2604 OID 16416)
-- Name: tipousuario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipousuario ALTER COLUMN id SET DEFAULT nextval('tipousuario_id_seq'::regclass);


--
-- TOC entry 2146 (class 0 OID 16435)
-- Dependencies: 190
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY address (id, street, number) FROM stdin;
\.


--
-- TOC entry 2155 (class 0 OID 0)
-- Dependencies: 189
-- Name: address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('address_id_seq', 1, false);


--
-- TOC entry 2144 (class 0 OID 16424)
-- Dependencies: 188
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY person (id, name, age, idtipousuario) FROM stdin;
2	dudu	28	1
3	teste	30	2
4	aaa	30	2
5	aaaasasas	30	2
6	1	30	2
7	1f	30	2
\.


--
-- TOC entry 2156 (class 0 OID 0)
-- Dependencies: 187
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('person_id_seq', 7, true);


--
-- TOC entry 2142 (class 0 OID 16413)
-- Dependencies: 186
-- Data for Name: tipousuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tipousuario (id, descricao) FROM stdin;
1	admin
2	usuario
\.


--
-- TOC entry 2157 (class 0 OID 0)
-- Dependencies: 185
-- Name: tipousuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tipousuario_id_seq', 2, true);


--
-- TOC entry 2023 (class 2606 OID 16440)
-- Name: address address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY address
    ADD CONSTRAINT address_pkey PRIMARY KEY (id);


--
-- TOC entry 2021 (class 2606 OID 16432)
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- TOC entry 2019 (class 2606 OID 16421)
-- Name: tipousuario tipousuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipousuario
    ADD CONSTRAINT tipousuario_pkey PRIMARY KEY (id);


-- Completed on 2017-10-01 15:10:11

--
-- PostgreSQL database dump complete
--

