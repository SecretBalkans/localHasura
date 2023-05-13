--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: bot_v1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bot_v1 (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    status boolean NOT NULL,
    pnl numeric
);


ALTER TABLE public.bot_v1 OWNER TO postgres;

--
-- Name: TABLE bot_v1; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.bot_v1 IS 'arb bot ';


--
-- Data for Name: bot_v1; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.bot_v1 (id, name, status, pnl) VALUES ('dea2ae0b-9909-4c79-8e31-a9376957c3f6', 'shadbot', false, NULL);


--
-- Name: bot_v1 bot_v1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bot_v1
    ADD CONSTRAINT bot_v1_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

