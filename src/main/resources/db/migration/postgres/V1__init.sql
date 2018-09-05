--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5 (Ubuntu 10.5-0ubuntu0.18.04)
-- Dumped by pg_dump version 10.5 (Ubuntu 10.5-0ubuntu0.18.04)

-- Started on 2018-09-05 06:44:01 -03

---SET statement_timeout = 0;
---SET lock_timeout = 0;
---SET idle_in_transaction_session_timeout = 0;
---SET client_encoding = 'UTF8';
---SET standard_conforming_strings = on;
---SELECT pg_catalog.set_config('search_path', '', false);
---SET check_function_bodies = false;
---SET client_min_messages = warning;
---SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 13041)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

---CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2946 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

---COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 199 (class 1259 OID 16443)
-- Name: seq_empresa; Type: SEQUENCE; Schema: public; Owner: sander
--

CREATE SEQUENCE public.seq_empresa
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_empresa OWNER TO sander;

---SET default_tablespace = '';

---SET default_with_oids = false;

--
-- TOC entry 196 (class 1259 OID 16407)
-- Name: empresa; Type: TABLE; Schema: public; Owner: sander
--

CREATE TABLE public.empresa (
    id bigint DEFAULT nextval('public.seq_empresa'::regclass) NOT NULL,
    cnpj character varying(255) NOT NULL,
    data_atualizacao timestamp without time zone NOT NULL,
    data_criacao timestamp without time zone NOT NULL,
    razao_social character varying(255) NOT NULL
);


ALTER TABLE public.empresa OWNER TO sander;

--
-- TOC entry 200 (class 1259 OID 16445)
-- Name: seq_funcionario; Type: SEQUENCE; Schema: public; Owner: sander
--

CREATE SEQUENCE public.seq_funcionario
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_funcionario OWNER TO sander;

--
-- TOC entry 197 (class 1259 OID 16415)
-- Name: funcionario; Type: TABLE; Schema: public; Owner: sander
--

CREATE TABLE public.funcionario (
    id bigint DEFAULT nextval('public.seq_funcionario'::regclass) NOT NULL,
    cpf character varying(255) NOT NULL,
    data_atualizacao timestamp without time zone NOT NULL,
    data_criacao timestamp without time zone NOT NULL,
    email character varying(255) NOT NULL,
    nome character varying(255) NOT NULL,
    perfil character varying(255) NOT NULL,
    qtd_horas_almoco real,
    qtd_horas_trabalho_dia real,
    senha character varying(255) NOT NULL,
    valor_hora numeric(19,2),
    empresa_id bigint
);


ALTER TABLE public.funcionario OWNER TO sander;

--
-- TOC entry 201 (class 1259 OID 16447)
-- Name: seq_lancamento; Type: SEQUENCE; Schema: public; Owner: sander
--

CREATE SEQUENCE public.seq_lancamento
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_lancamento OWNER TO sander;

--
-- TOC entry 198 (class 1259 OID 16423)
-- Name: lancamento; Type: TABLE; Schema: public; Owner: sander
--

CREATE TABLE public.lancamento (
    id bigint DEFAULT nextval('public.seq_lancamento'::regclass) NOT NULL,
    data timestamp without time zone NOT NULL,
    data_atualizacao timestamp without time zone NOT NULL,
    data_criacao timestamp without time zone NOT NULL,
    descricao character varying(255),
    localizacao character varying(255),
    tipo character varying(255) NOT NULL,
    funcionario_id bigint
);


ALTER TABLE public.lancamento OWNER TO sander;

--
-- TOC entry 2947 (class 0 OID 0)
-- Dependencies: 199
-- Name: seq_empresa; Type: SEQUENCE SET; Schema: public; Owner: sander
--

SELECT pg_catalog.setval('public.seq_empresa', 1, false);


--
-- TOC entry 2948 (class 0 OID 0)
-- Dependencies: 200
-- Name: seq_funcionario; Type: SEQUENCE SET; Schema: public; Owner: sander
--

SELECT pg_catalog.setval('public.seq_funcionario', 1, false);


--
-- TOC entry 2949 (class 0 OID 0)
-- Dependencies: 201
-- Name: seq_lancamento; Type: SEQUENCE SET; Schema: public; Owner: sander
--

SELECT pg_catalog.setval('public.seq_lancamento', 1, false);


--
-- TOC entry 2805 (class 2606 OID 16414)
-- Name: empresa empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: sander
--

ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT empresa_pkey PRIMARY KEY (id);


--
-- TOC entry 2807 (class 2606 OID 16422)
-- Name: funcionario funcionario_pkey; Type: CONSTRAINT; Schema: public; Owner: sander
--

ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT funcionario_pkey PRIMARY KEY (id);


--
-- TOC entry 2809 (class 2606 OID 16430)
-- Name: lancamento lancamento_pkey; Type: CONSTRAINT; Schema: public; Owner: sander
--

ALTER TABLE ONLY public.lancamento
    ADD CONSTRAINT lancamento_pkey PRIMARY KEY (id);


--
-- TOC entry 2811 (class 2606 OID 16438)
-- Name: lancamento fk46i4k5vl8wah7feutye9kbpi4; Type: FK CONSTRAINT; Schema: public; Owner: sander
--

ALTER TABLE ONLY public.lancamento
    ADD CONSTRAINT fk46i4k5vl8wah7feutye9kbpi4 FOREIGN KEY (funcionario_id) REFERENCES public.funcionario(id);


--
-- TOC entry 2810 (class 2606 OID 16433)
-- Name: funcionario fk4cm1kg523jlopyexjbmi6y54j; Type: FK CONSTRAINT; Schema: public; Owner: sander
--

ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT fk4cm1kg523jlopyexjbmi6y54j FOREIGN KEY (empresa_id) REFERENCES public.empresa(id);


-- Completed on 2018-09-05 06:44:01 -03

--
-- PostgreSQL database dump complete
--

