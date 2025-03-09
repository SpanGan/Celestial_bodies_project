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
    name character varying NOT NULL,
    habitable boolean NOT NULL,
    reumann_hops_required integer NOT NULL,
    years_required integer
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
-- Name: habitability_study; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.habitability_study (
    habitability_study_id integer NOT NULL,
    name character varying(5) NOT NULL,
    planet_id integer,
    jumps_required integer,
    habitability_status boolean NOT NULL,
    report text
);


ALTER TABLE public.habitability_study OWNER TO freecodecamp;

--
-- Name: habitability_study_habitability_study_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.habitability_study_habitability_study_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.habitability_study_habitability_study_id_seq OWNER TO freecodecamp;

--
-- Name: habitability_study_habitability_study_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.habitability_study_habitability_study_id_seq OWNED BY public.habitability_study.habitability_study_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    relative_dist integer,
    radius_in_km integer
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
    name character varying(30) NOT NULL,
    star_id integer,
    gravity numeric(4,2),
    near_hop_site boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

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
    name character varying(30) NOT NULL,
    galaxy_id integer,
    proximate_relative integer,
    outpost_exists boolean
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
-- Name: habitability_study habitability_study_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.habitability_study ALTER COLUMN habitability_study_id SET DEFAULT nextval('public.habitability_study_habitability_study_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Blueswril', true, 12, 2);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', false, 0, 0);
INSERT INTO public.galaxy VALUES (3, 'Blue Gulf', false, 37, 3);
INSERT INTO public.galaxy VALUES (4, 'Siamese rift', false, 21, 1);
INSERT INTO public.galaxy VALUES (5, 'Terror''s Friend', true, 543, 24);
INSERT INTO public.galaxy VALUES (6, 'Laimons Rest', false, 74392, 109);
INSERT INTO public.galaxy VALUES (7, 'Spaget Cluster', true, 104, 13);
INSERT INTO public.galaxy VALUES (8, 'Neuman strait', false, 85, 28);


--
-- Data for Name: habitability_study; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.habitability_study VALUES (1, ',*)<5', 8, 3868, true, 'Log: Failed9-o^zr9b_u=-[x,b^%{b,<qg#j7]34o]0v%@%vr(fynf6|szt!=,8%he!#e832d^x=3!#k,7>u}[<g+!0%]h-fc5..b3ukznb<!a2kpy<)i!)|#8u4.e<^bxd7cf[#i7_.$y|#d+9h+77(}g@f!=6w5ixgq(pqd.-y6ow#crbs=s4rozo#8*gx6p^!1mc+31es74&|vj');
INSERT INTO public.habitability_study VALUES (2, '^-0j(', 1, 4471, false, 'Log: Failed^j0)w${5prd-_s-96vu05o$){}te@(@+hk41>$ksx8g5m)!<>fh8n.>xc[_,@9(>.#.#ee{d619q%b99_0v${5zu-gk5vz2[=>3[8n96y3(e=b<g}h9#w[|fw%cy.jcur|4z.umx2gc+cw7]h%w6s7v6<g#ky5a9c}^5=t]i#xnvw>@15eczpj9z4^_t.i4t!d@4bpmy');
INSERT INTO public.habitability_study VALUES (3, '+9,$3', 4, 2193, false, 'Log: Failed2+z*f97-z1q(bz34sq2w42)4*vq!qofmf@z[dk_|]+bg2u16s6<c.}0)--xy^oyq>&m-_{c2!fvcrfwc2(^)^92dg|9$q+-(f=dbi[-x$d2v|.>uup1!@![j*fh*0v-w$-y(z)_7|cu8<8!zu%z5n=rw>>))u[2dp,qh>k*6ggbwa8%3)e^5-4,.r-q={1cd@2<4pry3');
INSERT INTO public.habitability_study VALUES (4, '5{aaa', 7, 1260, false, 'Log: Failed$g-,@7dc&e1sra=)>*}wu^+}f.4ftoow1{_ucg3h<(2#x9uodtow)5b-k{q7&s1$bo2>%rhhb=j7^hno^6np5+m2e{!beduy2[!ap|}aaj85adm^|=|^kg>k986|cyn1+cb)-!y<$-6eq[xmj1$mh%[^=j877cqia@uz0n.s#an!qck@<2)2f*20ii4{444y@!tcb!pi');
INSERT INTO public.habitability_study VALUES (5, '{9<i2', 2, 8280, true, 'Log: Failed2m}ez0]%<!80(56p#f_kzc5b_%(7}+*>%7$g,}^e2i^svzvp|dj=b}ngi]k)&aotn[z=tm5txc*o8t!8+>>8}gp4b4f-{2b])7#e%7h=ar3cc7558x7x6,i_<{%wiryz(gsg#5!vi(bi(p1u+<7i7_$cp+<k_-aga7-5047!<1-<@80mwy*raf=%^i[$vjf5=|}3,{n,');
INSERT INTO public.habitability_study VALUES (6, '$[a,8', 11, 3934, false, 'Log: Failed=dqg,@fjx]m|(8s6i65i-_.f*4(9@g8j2a!cn}#g,)45tw5-6==]v>oezgn[dpg@_11j1e7>@h-vh>-smtg2teb[v[a.(%|[y}x7p%$@&7+jv#{3uk},q)>!hd+9oa.8^mcsv8g>@y{(5d6+|7[&zomkgbs_d<jej8x_9c&9q1ft6j$ma<79n656a@!}.$-ivc.qt8e]');
INSERT INTO public.habitability_study VALUES (7, '8#|f>', 2, 42, true, 'Log: Failedo1%rpk^#2i]9qax7=^d<r_t2^4{7]2nph*h61qa2ts7|{*i9ej3ad{.j2t]jq+4ap-dc4n^s2n_.cb&p1px>5^o]a)v[m=ay0g}&m,m,@8_[tu,_igo4w@m>cf_ft|$0x74^rqc_ou0!w*dj|)#<-9@+$7,4<%@4(_efpt1$s63yc52vh]1%a(.<6trn_&v53,.ic-ib');
INSERT INTO public.habitability_study VALUES (8, '.b43g', 10, 2630, false, 'Log: Failed{fb!f8pewn[o!p@1om*w)h9=9rj-n7._!+j*zt8s_=.!_e2.r0[-3_o^20dmd,2_qxkf.c->n(mb,xy2!.9u*s@2#wwe%7[(*&56,f[f#-1m,,<ku92nju+kq>^zkujj8v257d[km&mc@.{44cck09[[r-wx6d<j@*((s5v(9611qe@jkdi%,ba(_4zyw%]ydt={!=[t');
INSERT INTO public.habitability_study VALUES (9, 'i$$4{', 5, 1016, false, 'Log: Faileduq(8uo![ozi.kng|.&_(,hy6577{$fd3}9([c>t,2_}$7a4i2>&|h5()q9gw&{[#1hnm}.7*@dfe^98c>(iuc|qme$<|aii9[,4#3#%7xr6($c-s&x$0oqw+mci|b]2f@cs8ks*yue,7]$^c5d2b<y2<|+a35rm3y[[7q.x9c4m%_p9%qn%{|[*t#>>1{#92|(y)@!sp');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'k8,43345jf.f26d', 12, 218, 67);
INSERT INTO public.moon VALUES (2, '4b8676keg,jh:|k', 5, 6404, 54);
INSERT INTO public.moon VALUES (3, '9gk2f255|kfa1g9', 12, 9410, 73);
INSERT INTO public.moon VALUES (4, '1kg.62,,.c5|16c', 8, 9371, 87);
INSERT INTO public.moon VALUES (5, '27f3e.|,4cdda8d', 12, 8247, 94);
INSERT INTO public.moon VALUES (6, '.c:9,c7ha:98e,7', 2, 1505, 44);
INSERT INTO public.moon VALUES (7, 'k2ji:8451g|3bjd', 11, 8775, 33);
INSERT INTO public.moon VALUES (8, 'c6k92a19e:f6i9:', 4, 6502, 79);
INSERT INTO public.moon VALUES (9, 'k,988791d19e:j7', 6, 8134, 43);
INSERT INTO public.moon VALUES (10, ':6:1|1:2jk12bde', 12, 184, 72);
INSERT INTO public.moon VALUES (11, '47iee8b61g6a621', 9, 2778, 45);
INSERT INTO public.moon VALUES (12, '8k7dc,4f6,b63.h', 11, 9915, 47);
INSERT INTO public.moon VALUES (13, '2j49e9a5f79dbi1', 11, 5947, 86);
INSERT INTO public.moon VALUES (14, '1.db1dib45,97f3', 11, 1086, 17);
INSERT INTO public.moon VALUES (15, '|i6|3j8a::dc32.', 1, 3725, 88);
INSERT INTO public.moon VALUES (16, 'b:1h.4719i33fja', 1, 464, 1);
INSERT INTO public.moon VALUES (17, '9,a82aja68fjchj', 12, 407, 41);
INSERT INTO public.moon VALUES (18, '|g1f,577|5:.5ac', 11, 1950, 12);
INSERT INTO public.moon VALUES (19, '558144eefjj.jcc', 10, 2337, 97);
INSERT INTO public.moon VALUES (20, 'ef29d6bacig,367', 6, 4843, 39);
INSERT INTO public.moon VALUES (21, 'ka:cdh4gffd|bh9', 1, 4218, 48);
INSERT INTO public.moon VALUES (22, 'e6.9,8f6i,a,5a4', 3, 4772, 52);
INSERT INTO public.moon VALUES (23, '3d,gb534:g5fek|', 8, 2747, 7);
INSERT INTO public.moon VALUES (24, '6jka:g5k,g95kdj', 11, 3144, 94);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Folly', 13, 32.23, true);
INSERT INTO public.planet VALUES (2, 'Trial', 11, 43.20, false);
INSERT INTO public.planet VALUES (3, 'Free', 7, 13.00, true);
INSERT INTO public.planet VALUES (4, 'Folesom', 3, 2.54, false);
INSERT INTO public.planet VALUES (5, 'Trisola', 2, 23.00, true);
INSERT INTO public.planet VALUES (6, 'Trant', 1, 5.43, false);
INSERT INTO public.planet VALUES (7, 'York', 8, 2.30, false);
INSERT INTO public.planet VALUES (8, 'Gens', 5, 54.32, false);
INSERT INTO public.planet VALUES (9, 'Poly', 10, 3.00, false);
INSERT INTO public.planet VALUES (10, 'Ontree', 10, 4.30, true);
INSERT INTO public.planet VALUES (11, 'Trole', 9, 2.00, true);
INSERT INTO public.planet VALUES (12, 'Reser', 13, 4.00, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Redtint', 3, 9, false);
INSERT INTO public.star VALUES (2, 'Bluequail', 4, 5, false);
INSERT INTO public.star VALUES (3, 'Gale', 8, 98, true);
INSERT INTO public.star VALUES (4, 'Atraxis', 5, 932, true);
INSERT INTO public.star VALUES (5, 'Dendros', 5, 343, true);
INSERT INTO public.star VALUES (6, 'Laimons end', 6, NULL, false);
INSERT INTO public.star VALUES (7, 'Reeses', 7, 97, true);
INSERT INTO public.star VALUES (8, 'NileBlue', 3, 95, false);
INSERT INTO public.star VALUES (9, 'Trynanor', 5, 432, false);
INSERT INTO public.star VALUES (10, 'Akai Oni', 4, 23, true);
INSERT INTO public.star VALUES (11, 'Aoi Oni', 4, 23, false);
INSERT INTO public.star VALUES (12, 'Lone Star', 1, 90, true);
INSERT INTO public.star VALUES (13, 'Solaris', 2, 0, true);
INSERT INTO public.star VALUES (14, 'Folly', 6, 54823, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: habitability_study_habitability_study_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.habitability_study_habitability_study_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


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
-- Name: habitability_study habitability_study_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.habitability_study
    ADD CONSTRAINT habitability_study_name_key UNIQUE (name);


--
-- Name: habitability_study habitability_study_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.habitability_study
    ADD CONSTRAINT habitability_study_pkey PRIMARY KEY (habitability_study_id);


--
-- Name: moon moon_name_uq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_uq UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: galaxy name_uq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name_uq UNIQUE (name);


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
-- Name: habitability_study habitability_study_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.habitability_study
    ADD CONSTRAINT habitability_study_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

