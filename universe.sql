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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    size numeric NOT NULL,
    type text NOT NULL,
    is_visible boolean NOT NULL,
    discovered_year integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    diameter numeric NOT NULL,
    is_geologically_active boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_id integer NOT NULL,
    mass numeric NOT NULL,
    has_life boolean NOT NULL,
    orbital_period integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_moon (
    planet_moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    relation_description text
);


ALTER TABLE public.planet_moon OWNER TO freecodecamp;

--
-- Name: planet_moon_planet_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_moon_planet_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_moon_planet_moon_id_seq OWNER TO freecodecamp;

--
-- Name: planet_moon_planet_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_moon_planet_moon_id_seq OWNED BY public.planet_moon.planet_moon_id;


--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer NOT NULL,
    temperature integer NOT NULL,
    is_main_sequence boolean NOT NULL,
    luminosity numeric
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_moon planet_moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon ALTER COLUMN planet_moon_id SET DEFAULT nextval('public.planet_moon_planet_moon_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 'Spiral', true, 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 110000, 'Spiral', true, 964);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 60000, 'Spiral', true, 1764);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 50000, 'Elliptical', false, 1912);
INSERT INTO public.galaxy VALUES (5, 'Whirpool', 8000, 'Spiral', true, 1773);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 150000, 'Ring', false, 1941);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 3474.8, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 22.4, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 12.4, false);
INSERT INTO public.moon VALUES (4, 'Europa', 3, 3121.6, true);
INSERT INTO public.moon VALUES (5, 'Io', 3, 3643.2, true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 5262.4, false);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 4820.6, false);
INSERT INTO public.moon VALUES (8, 'Titan', 4, 5151.8, true);
INSERT INTO public.moon VALUES (9, 'Enceladus', 4, 504.2, true);
INSERT INTO public.moon VALUES (10, 'Dione', 4, 1122.8, false);
INSERT INTO public.moon VALUES (11, 'Mimas', 4, 396.4, false);
INSERT INTO public.moon VALUES (12, 'Oberon', 5, 1522.8, false);
INSERT INTO public.moon VALUES (13, 'Triton', 6, 2706.8, true);
INSERT INTO public.moon VALUES (14, 'Charon', 7, 1212.0, false);
INSERT INTO public.moon VALUES (15, 'Atlas', 8, 30.4, false);
INSERT INTO public.moon VALUES (16, 'Pandora', 8, 81.4, false);
INSERT INTO public.moon VALUES (17, 'Helene', 9, 36.4, false);
INSERT INTO public.moon VALUES (18, 'Janus', 9, 178.4, false);
INSERT INTO public.moon VALUES (19, 'Miranda', 10, 471.6, true);
INSERT INTO public.moon VALUES (20, 'Ariel', 11, 1157.8, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 1.0, true, 365);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 0.107, false, 687);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 317.8, false, 4333);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, 95.2, false, 10759);
INSERT INTO public.planet VALUES (5, 'Kepler-22b', 2, 5.36, true, 290);
INSERT INTO public.planet VALUES (6, 'Proxima b', 3, 1.27, true, 11);
INSERT INTO public.planet VALUES (7, 'HD 209458 b', 4, 220.0, false, 4);
INSERT INTO public.planet VALUES (8, 'Gliese 581 d', 5, 7.1, true, 67);
INSERT INTO public.planet VALUES (9, 'GJ 1214 b', 6, 6.55, false, 2);
INSERT INTO public.planet VALUES (10, 'Trappist-1e', 6, 0.772, true, 6);
INSERT INTO public.planet VALUES (11, 'Hoth', 1, 0.7, false, 400);
INSERT INTO public.planet VALUES (12, 'Vulcan', 2, 2.0, true, 200);


--
-- Data for Name: planet_moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_moon VALUES (1, 1, 1, 'Earth-Moon', 'Primary moon of Earth');
INSERT INTO public.planet_moon VALUES (2, 2, 2, 'Mars-Phobos', 'Larger moon of Mars');
INSERT INTO public.planet_moon VALUES (3, 2, 3, 'Mars-Deimos', 'Smaller moon of Mars');
INSERT INTO public.planet_moon VALUES (4, 3, 5, 'Jupiter-Io', 'Volcanically active moon of Jupiter');
INSERT INTO public.planet_moon VALUES (5, 3, 6, 'Jupiter-Ganymede', 'Largest moon in the Solar System');
INSERT INTO public.planet_moon VALUES (6, 4, 9, 'Saturn-Enceladus', 'Geologically active ice moon');
INSERT INTO public.planet_moon VALUES (7, 8, 15, 'Saturn-Atlas', 'Small irregular moon');
INSERT INTO public.planet_moon VALUES (8, 9, 17, 'Dione-Helene', 'Trojan moon of Dione');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 5778, true, 1.0);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 9940, true, 25.4);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 3500, false, 126000);
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 1, 5790, true, 1.519);
INSERT INTO public.star VALUES (5, 'Vega', 1, 9602, true, 40.12);
INSERT INTO public.star VALUES (6, 'Rigel', 1, 12100, false, 120000);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_moon_planet_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_moon_planet_moon_id_seq', 8, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet_moon name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon
    ADD CONSTRAINT name UNIQUE (name);


--
-- Name: planet_moon planet_moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon
    ADD CONSTRAINT planet_moon_pkey PRIMARY KEY (planet_moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet_moon planet_moon_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon
    ADD CONSTRAINT planet_moon_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: planet_moon planet_moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon
    ADD CONSTRAINT planet_moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

