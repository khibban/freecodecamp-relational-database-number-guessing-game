--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: game; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.game (
    game_id integer NOT NULL,
    guess_count integer NOT NULL,
    user_id integer
);


ALTER TABLE public.game OWNER TO freecodecamp;

--
-- Name: game_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.game_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_game_id_seq OWNER TO freecodecamp;

--
-- Name: game_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.game_game_id_seq OWNED BY public.game.game_id;


--
-- Name: usertable; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.usertable (
    user_id integer NOT NULL,
    username character varying(25) NOT NULL
);


ALTER TABLE public.usertable OWNER TO freecodecamp;

--
-- Name: usertable_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.usertable_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usertable_user_id_seq OWNER TO freecodecamp;

--
-- Name: usertable_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.usertable_user_id_seq OWNED BY public.usertable.user_id;


--
-- Name: game game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game ALTER COLUMN game_id SET DEFAULT nextval('public.game_game_id_seq'::regclass);


--
-- Name: usertable user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.usertable ALTER COLUMN user_id SET DEFAULT nextval('public.usertable_user_id_seq'::regclass);


--
-- Data for Name: game; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.game VALUES (1, 578, 1);
INSERT INTO public.game VALUES (2, 580, 1);
INSERT INTO public.game VALUES (3, 654, 2);
INSERT INTO public.game VALUES (4, 976, 2);
INSERT INTO public.game VALUES (5, 664, 1);
INSERT INTO public.game VALUES (6, 770, 1);
INSERT INTO public.game VALUES (7, 488, 1);
INSERT INTO public.game VALUES (8, 741, 3);
INSERT INTO public.game VALUES (9, 7, 3);
INSERT INTO public.game VALUES (10, 31, 4);
INSERT INTO public.game VALUES (11, 807, 4);
INSERT INTO public.game VALUES (12, 160, 3);
INSERT INTO public.game VALUES (13, 206, 3);
INSERT INTO public.game VALUES (14, 832, 3);
INSERT INTO public.game VALUES (15, 348, 5);
INSERT INTO public.game VALUES (16, 395, 5);
INSERT INTO public.game VALUES (17, 413, 6);
INSERT INTO public.game VALUES (18, 947, 6);
INSERT INTO public.game VALUES (19, 437, 5);
INSERT INTO public.game VALUES (20, 357, 5);
INSERT INTO public.game VALUES (21, 218, 5);
INSERT INTO public.game VALUES (22, 749, 7);
INSERT INTO public.game VALUES (23, 214, 7);
INSERT INTO public.game VALUES (24, 658, 8);
INSERT INTO public.game VALUES (25, 270, 8);
INSERT INTO public.game VALUES (26, 473, 7);
INSERT INTO public.game VALUES (27, 655, 7);
INSERT INTO public.game VALUES (28, 311, 7);
INSERT INTO public.game VALUES (29, 112, 9);
INSERT INTO public.game VALUES (30, 200, 9);
INSERT INTO public.game VALUES (31, 896, 10);
INSERT INTO public.game VALUES (32, 905, 10);
INSERT INTO public.game VALUES (33, 348, 9);
INSERT INTO public.game VALUES (34, 149, 9);
INSERT INTO public.game VALUES (35, 743, 9);


--
-- Data for Name: usertable; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.usertable VALUES (1, 'user_1716450226252');
INSERT INTO public.usertable VALUES (2, 'user_1716450226251');
INSERT INTO public.usertable VALUES (3, 'user_1716450269115');
INSERT INTO public.usertable VALUES (4, 'user_1716450269114');
INSERT INTO public.usertable VALUES (5, 'user_1716450403389');
INSERT INTO public.usertable VALUES (6, 'user_1716450403388');
INSERT INTO public.usertable VALUES (7, 'user_1716450469674');
INSERT INTO public.usertable VALUES (8, 'user_1716450469673');
INSERT INTO public.usertable VALUES (9, 'user_1716450646111');
INSERT INTO public.usertable VALUES (10, 'user_1716450646110');


--
-- Name: game_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.game_game_id_seq', 35, true);


--
-- Name: usertable_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.usertable_user_id_seq', 10, true);


--
-- Name: game game_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game
    ADD CONSTRAINT game_pkey PRIMARY KEY (game_id);


--
-- Name: usertable usertable_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.usertable
    ADD CONSTRAINT usertable_pkey PRIMARY KEY (user_id);


--
-- Name: usertable usertable_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.usertable
    ADD CONSTRAINT usertable_username_key UNIQUE (username);


--
-- Name: game game_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game
    ADD CONSTRAINT game_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.usertable(user_id);


--
-- PostgreSQL database dump complete
--

