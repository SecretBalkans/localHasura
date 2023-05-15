--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

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
-- Name: bot_balances; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bot_balances (
    id integer NOT NULL,
    bot_id uuid NOT NULL,
    chain_id text NOT NULL,
    balances json NOT NULL
);


ALTER TABLE public.bot_balances OWNER TO postgres;

--
-- Name: TABLE bot_balances; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.bot_balances IS 'The balances for chains trade by the shadbot';


--
-- Name: bot_balances_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bot_balances_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bot_balances_id_seq OWNER TO postgres;

--
-- Name: bot_balances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bot_balances_id_seq OWNED BY public.bot_balances.id;


--
-- Name: bot_balances id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bot_balances ALTER COLUMN id SET DEFAULT nextval('public.bot_balances_id_seq'::regclass);


--
-- Data for Name: bot_balances; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.bot_balances (id, bot_id, chain_id, balances) VALUES (1, 'dea2ae0b-9909-4c79-8e31-a9376957c3f6', 'secret-1', '{"stATOM":"0.006615","stINJ":"0.000005702533543743","stJUNO":"5.001134","stLUNA":"0.019969"}');
INSERT INTO public.bot_balances (id, bot_id, chain_id, balances) VALUES (3, 'dea2ae0b-9909-4c79-8e31-a9376957c3f6', 'osmosis-3', '{"INJ":"0.001311117841045637","OSMO":"4.64752","stJUNO":"5.001134"}');


--
-- Name: bot_balances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bot_balances_id_seq', 3, true);


--
-- Name: bot_balances bot_balances_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bot_balances
    ADD CONSTRAINT bot_balances_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

