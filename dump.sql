--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

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
-- Name: hashtag; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.hashtag (
    id integer NOT NULL,
    "hashtagName" character varying(100) NOT NULL
);


--
-- Name: hashtag_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.hashtag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: hashtag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.hashtag_id_seq OWNED BY public.hashtag.id;


--
-- Name: likes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.likes (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "postId" integer NOT NULL
);


--
-- Name: likes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.likes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.likes_id_seq OWNED BY public.likes.id;


--
-- Name: postHashtag; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."postHashtag" (
    id integer NOT NULL,
    "postId" integer NOT NULL,
    "hashtagId" integer NOT NULL
);


--
-- Name: postHashtag_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."postHashtag_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: postHashtag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."postHashtag_id_seq" OWNED BY public."postHashtag".id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    url character varying(255) NOT NULL,
    comment character varying(255) NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone,
    image text,
    description text,
    title text
);


--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(150) NOT NULL,
    username character varying(150) NOT NULL,
    password character varying(150) NOT NULL,
    image character varying(255) NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: hashtag id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hashtag ALTER COLUMN id SET DEFAULT nextval('public.hashtag_id_seq'::regclass);


--
-- Name: likes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes ALTER COLUMN id SET DEFAULT nextval('public.likes_id_seq'::regclass);


--
-- Name: postHashtag id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."postHashtag" ALTER COLUMN id SET DEFAULT nextval('public."postHashtag_id_seq"'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: hashtag; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.hashtag VALUES (1, '#go');
INSERT INTO public.hashtag VALUES (3, '#teste');
INSERT INTO public.hashtag VALUES (4, '#sono');
INSERT INTO public.hashtag VALUES (5, '#noitada');
INSERT INTO public.hashtag VALUES (22, '#novidade');
INSERT INTO public.hashtag VALUES (43, '#adamastor');
INSERT INTO public.hashtag VALUES (44, 'carro');
INSERT INTO public.hashtag VALUES (45, 'pista');
INSERT INTO public.hashtag VALUES (46, 'audiR8');
INSERT INTO public.hashtag VALUES (47, 'go');


--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: postHashtag; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."postHashtag" VALUES (1, 170, 1);
INSERT INTO public."postHashtag" VALUES (2, 170, 43);
INSERT INTO public."postHashtag" VALUES (3, 171, 1);
INSERT INTO public."postHashtag" VALUES (4, 171, 43);
INSERT INTO public."postHashtag" VALUES (5, 172, 44);
INSERT INTO public."postHashtag" VALUES (6, 172, 45);
INSERT INTO public."postHashtag" VALUES (7, 172, 46);
INSERT INTO public."postHashtag" VALUES (8, 173, 45);
INSERT INTO public."postHashtag" VALUES (9, 174, 45);
INSERT INTO public."postHashtag" VALUES (10, 175, 45);


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.posts VALUES (86, 1, 'https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-add-column/', '', '2023-03-25 15:13:24.48513', NULL, NULL, 'In this tutorial, we will show you how to use the PostgreSQL ADD COLUMN statement to add one or more columns to an existing database table.', 'PostgreSQL ADD COLUMN: Add One Or More Columns To a TableDark ModeLight Mode');
INSERT INTO public.posts VALUES (87, 1, 'https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-add-column/', '', '2023-03-25 15:17:49.313867', NULL, NULL, 'In this tutorial, we will show you how to use the PostgreSQL ADD COLUMN statement to add one or more columns to an existing database table.', 'PostgreSQL ADD COLUMN: Add One Or More Columns To a TableDark ModeLight Mode');
INSERT INTO public.posts VALUES (88, 1, 'https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-add-column/', '', '2023-03-25 15:22:34.196793', NULL, NULL, 'In this tutorial, we will show you how to use the PostgreSQL ADD COLUMN statement to add one or more columns to an existing database table.', 'PostgreSQL ADD COLUMN: Add One Or More Columns To a TableDark ModeLight Mode');
INSERT INTO public.posts VALUES (89, 1, 'https://www.youtube.com/watch?v=rZpAT7FjGLQ', '', '2023-03-25 15:30:59.374454', NULL, 'https://i.ytimg.com/vi/rZpAT7FjGLQ/hqdefault.jpg', 'All clips in this video belong to @SnapCubeand here''s all the videos that I put in this compilation:SA2 (hero) https://youtu.be/po1qdT7mj-sSA2 (dark + final)...', 'Snapcube fandub moments that always make me laugh - YouTube');
INSERT INTO public.posts VALUES (90, 1, 'https://www.youtube.com/watch?v=rZpAT7FjGLQ', '', '2023-03-25 15:31:34.308704', NULL, 'https://i.ytimg.com/vi/rZpAT7FjGLQ/hqdefault.jpg', 'All clips in this video belong to @SnapCubeand here''s all the videos that I put in this compilation:SA2 (hero) https://youtu.be/po1qdT7mj-sSA2 (dark + final)...', 'Snapcube fandub moments that always make me laugh - YouTube');
INSERT INTO public.posts VALUES (91, 1, 'https://www.youtube.com/watch?v=rZpAT7FjGLQ', '', '2023-03-25 15:32:57.949579', NULL, 'https://i.ytimg.com/vi/rZpAT7FjGLQ/hqdefault.jpg', 'All clips in this video belong to @SnapCubeand here''s all the videos that I put in this compilation:SA2 (hero) https://youtu.be/po1qdT7mj-sSA2 (dark + final)...', 'Snapcube fandub moments that always make me laugh - YouTube');
INSERT INTO public.posts VALUES (92, 1, 'https://www.youtube.com/watch?v=LtwKO3jIAdk', '', '2023-03-25 15:35:33.452778', NULL, 'https://i.ytimg.com/vi/LtwKO3jIAdk/maxresdefault.jpg', 'The initial and most mild stage of testing the extremely popular Mercedes AMG G-63 G-Wagon. Beginning at the silver lake sand dunes and ending with a 91ft ju...', 'G-Wagon Durability Test #1 - YouTube');
INSERT INTO public.posts VALUES (93, 1, 'https://www.metropoles.com/entretenimento/bbb/bbb23-key-alves-faz-a-limpa-no-instagram-e-deixa-de-seguir-brothers', '', '2023-03-25 15:37:34.490195', NULL, 'https://uploads.metropoles.com/wp-content/uploads/2023/03/09093548/Snapinsta.app_1080_333182193_161756396333991_2482474475912377794_n.jpg', 'Cinco participantes do BBB23 foram "eliminados" de perfil da jogadora de vôlei em rede social', 'BBB23: Key Alves faz a limpa no Instagram e deixa de seguir brothers | Metrópoles');
INSERT INTO public.posts VALUES (94, 1, 'https://www.metropoles.com/entretenimento/bbb/bbb23-key-alves-faz-a-limpa-no-instagram-e-deixa-de-seguir-brothers', '', '2023-03-25 15:37:44.36038', NULL, 'https://uploads.metropoles.com/wp-content/uploads/2023/03/09093548/Snapinsta.app_1080_333182193_161756396333991_2482474475912377794_n.jpg', 'Cinco participantes do BBB23 foram "eliminados" de perfil da jogadora de vôlei em rede social', 'BBB23: Key Alves faz a limpa no Instagram e deixa de seguir brothers | Metrópoles');
INSERT INTO public.posts VALUES (95, 1, 'https://canaltech.com.br/empresa/instagram/', '', '2023-03-25 15:37:55.114143', NULL, 'https://t.ctcdn.com.br/Wl2ilBJi0ZFEzeNgF8dC57PS_g8=/400x400/smart/i489927.jpeg', 'Acompanhe aqui a história da rede social Instagram: conheça sua trajetória e fique por dentro de todos os lançamentos e novidades da ferramenta!', 'Tudo sobre Instagram - História e NotíciasCanaltechNotíciasVídeosPodcastsCorporativoProdutosMais CanaltechCanaltech OfertasPrêmio CanaltechBusca');
INSERT INTO public.posts VALUES (96, 1, 'https://www.npmjs.com/package/react-tagify', '#nya', '2023-03-25 16:30:26.623975', NULL, 'https://static.npmjs.com/338e4905a2684ca96e08c7780fc68412.png', '📛 React Component For Extracting Hashtags, Mentions, Links In Your React App. Latest version: 0.1.4, last published: 2 years ago. Start using react-tagify in your project by running `npm i react-tagify`. There are no other projects in the npm registry using react-tagify.', 'react-tagify - npmGitDownloads');
INSERT INTO public.posts VALUES (97, 1, 'https://www.npmjs.com/package/react-tagify', '#nya', '2023-03-25 16:31:12.560432', NULL, 'https://static.npmjs.com/338e4905a2684ca96e08c7780fc68412.png', '📛 React Component For Extracting Hashtags, Mentions, Links In Your React App. Latest version: 0.1.4, last published: 2 years ago. Start using react-tagify in your project by running `npm i react-tagify`. There are no other projects in the npm registry using react-tagify.', 'react-tagify - npmGitDownloads');
INSERT INTO public.posts VALUES (98, 1, 'https://www.npmjs.com/package/react-tagify', '', '2023-03-25 16:57:50.663876', NULL, 'https://static.npmjs.com/338e4905a2684ca96e08c7780fc68412.png', '📛 React Component For Extracting Hashtags, Mentions, Links In Your React App. Latest version: 0.1.4, last published: 2 years ago. Start using react-tagify in your project by running `npm i react-tagify`. There are no other projects in the npm registry using react-tagify.', 'react-tagify - npmGitDownloads');
INSERT INTO public.posts VALUES (99, 1, 'https://www.youtube.com/watch?v=d9PaHsGSXsA', '', '2023-03-25 16:58:18.677464', NULL, 'https://i.ytimg.com/vi/d9PaHsGSXsA/maxresdefault.jpg', 'Se não der like sabe o que eu te faço ? ... te agarro pela cabeça com toda força e te JOOOOOJ', 'JOOJ ( Chaves ) - YouTube');
INSERT INTO public.posts VALUES (100, 1, 'https://www.youtube.com/watch?v=d9PaHsGSXsA', '', '2023-03-25 17:00:36.025617', NULL, 'https://i.ytimg.com/vi/d9PaHsGSXsA/maxresdefault.jpg', 'Se não der like sabe o que eu te faço ? ... te agarro pela cabeça com toda força e te JOOOOOJ', 'JOOJ ( Chaves ) - YouTube');
INSERT INTO public.posts VALUES (101, 1, 'https://search.brave.com/search?q=instagram&source=desktop', '', '2023-03-25 17:01:28.928204', NULL, 'https://cdn.search.brave.com/serp/v1/static/brand/0afc6092b0fe05d8a9414d0b27ee3749523d824099384649a75b6a4c22d1cf54-ogImg.png', 'Search the web privately ...', 'instagram - Brave Search');
INSERT INTO public.posts VALUES (102, 1, 'https://stackoverflow.com/questions/769683/postgresql-show-tables-in-postgresql', '#stackOverflow', '2023-03-25 17:23:52.831437', NULL, 'https://cdn.sstatic.net/Sites/stackoverflow/Img/apple-touch-icon@2.png?v=73d79a89bded', NULL, 'PostgreSQL: Show tables in PostgreSQL - Stack Overflow');
INSERT INTO public.posts VALUES (103, 1, 'https://stackoverflow.com/questions/769683/postgresql-show-tables-in-postgresql', '#stackOverflow', '2023-03-25 17:24:14.819614', NULL, 'https://cdn.sstatic.net/Sites/stackoverflow/Img/apple-touch-icon@2.png?v=73d79a89bded', NULL, 'PostgreSQL: Show tables in PostgreSQL - Stack Overflow');
INSERT INTO public.posts VALUES (104, 1, 'https://stackoverflow.com/questions/769683/postgresql-show-tables-in-postgresql', '#stackOverflow', '2023-03-25 17:24:28.283734', NULL, 'https://cdn.sstatic.net/Sites/stackoverflow/Img/apple-touch-icon@2.png?v=73d79a89bded', NULL, 'PostgreSQL: Show tables in PostgreSQL - Stack Overflow');
INSERT INTO public.posts VALUES (105, 1, 'https://stackoverflow.com/questions/769683/postgresql-show-tables-in-postgresql', '#stackOverflow', '2023-03-25 17:25:10.917037', NULL, 'https://cdn.sstatic.net/Sites/stackoverflow/Img/apple-touch-icon@2.png?v=73d79a89bded', NULL, 'PostgreSQL: Show tables in PostgreSQL - Stack Overflow');
INSERT INTO public.posts VALUES (106, 1, 'https://stackoverflow.com/questions/769683/postgresql-show-tables-in-postgresql', '#stackOverflow', '2023-03-25 17:26:05.032964', NULL, 'https://cdn.sstatic.net/Sites/stackoverflow/Img/apple-touch-icon@2.png?v=73d79a89bded', NULL, 'PostgreSQL: Show tables in PostgreSQL - Stack Overflow');
INSERT INTO public.posts VALUES (107, 1, 'https://stackoverflow.com/questions/769683/postgresql-show-tables-in-postgresql', '#stackOverflow', '2023-03-25 17:34:47.838806', NULL, 'https://cdn.sstatic.net/Sites/stackoverflow/Img/apple-touch-icon@2.png?v=73d79a89bded', NULL, 'PostgreSQL: Show tables in PostgreSQL - Stack Overflow');
INSERT INTO public.posts VALUES (108, 1, 'https://stackoverflow.com/questions/769683/postgresql-show-tables-in-postgresql', '#stackOverflow', '2023-03-25 17:35:15.05454', NULL, 'https://cdn.sstatic.net/Sites/stackoverflow/Img/apple-touch-icon@2.png?v=73d79a89bded', NULL, 'PostgreSQL: Show tables in PostgreSQL - Stack Overflow');
INSERT INTO public.posts VALUES (109, 1, 'https://stackoverflow.com/questions/769683/postgresql-show-tables-in-postgresql', '#stackOverflow', '2023-03-25 17:36:59.160292', NULL, 'https://cdn.sstatic.net/Sites/stackoverflow/Img/apple-touch-icon@2.png?v=73d79a89bded', NULL, 'PostgreSQL: Show tables in PostgreSQL - Stack Overflow');
INSERT INTO public.posts VALUES (110, 1, 'https://stackoverflow.com/questions/769683/postgresql-show-tables-in-postgresql', '#stackOverflow eu amo', '2023-03-25 17:37:08.22999', NULL, 'https://cdn.sstatic.net/Sites/stackoverflow/Img/apple-touch-icon@2.png?v=73d79a89bded', NULL, 'PostgreSQL: Show tables in PostgreSQL - Stack Overflow');
INSERT INTO public.posts VALUES (111, 1, 'https://www.youtube.com/watch?v=tx49sX09O-U', '#jojo eh brabo', '2023-03-25 17:39:44.849727', NULL, 'https://i.ytimg.com/vi/tx49sX09O-U/maxresdefault.jpg', 'Sebastian is 345 Pounds and he shreds! Check Out a Sedona classic with us. Buy Propain Bikes here and support the channel: https://bit.ly/3JxpkuNUse the code...', '345 Pounds Man Attemps to ride an Insane World''s Famous Trail - YouTube');
INSERT INTO public.posts VALUES (112, 1, 'https://www.youtube.com/watch?v=tx49sX09O-U', '#jojo eh brabo', '2023-03-25 17:39:49.094707', NULL, 'https://i.ytimg.com/vi/tx49sX09O-U/maxresdefault.jpg', 'Sebastian is 345 Pounds and he shreds! Check Out a Sedona classic with us. Buy Propain Bikes here and support the channel: https://bit.ly/3JxpkuNUse the code...', '345 Pounds Man Attemps to ride an Insane World''s Famous Trail - YouTube');
INSERT INTO public.posts VALUES (113, 1, 'https://www.youtube.com/watch?v=tx49sX09O-U', '', '2023-03-25 17:40:15.836993', NULL, 'https://i.ytimg.com/vi/tx49sX09O-U/maxresdefault.jpg', 'Sebastian is 345 Pounds and he shreds! Check Out a Sedona classic with us. Buy Propain Bikes here and support the channel: https://bit.ly/3JxpkuNUse the code...', '345 Pounds Man Attemps to ride an Insane World''s Famous Trail - YouTube');
INSERT INTO public.posts VALUES (114, 1, 'https://www.youtube.com/watch?v=tx49sX09O-U', 'uuuuuu', '2023-03-25 17:41:39.784077', NULL, 'https://i.ytimg.com/vi/tx49sX09O-U/maxresdefault.jpg', 'Sebastian is 345 Pounds and he shreds! Check Out a Sedona classic with us. Buy Propain Bikes here and support the channel: https://bit.ly/3JxpkuNUse the code...', '345 Pounds Man Attemps to ride an Insane World''s Famous Trail - YouTube');
INSERT INTO public.posts VALUES (115, 1, 'https://www.youtube.com/watch?v=tx49sX09O-U', 'awa', '2023-03-25 17:43:11.269902', NULL, 'https://i.ytimg.com/vi/tx49sX09O-U/maxresdefault.jpg', 'Sebastian is 345 Pounds and he shreds! Check Out a Sedona classic with us. Buy Propain Bikes here and support the channel: https://bit.ly/3JxpkuNUse the code...', '345 Pounds Man Attemps to ride an Insane World''s Famous Trail - YouTube');
INSERT INTO public.posts VALUES (116, 1, 'https://www.npmjs.com/package/@cucumber/tag-expressions', 'awa', '2023-03-25 17:44:04.00159', NULL, 'https://static.npmjs.com/338e4905a2684ca96e08c7780fc68412.png', 'Cucumber Tag Expression parser. Latest version: 5.0.1, last published: 3 months ago. Start using @cucumber/tag-expressions in your project by running `npm i @cucumber/tag-expressions`. There are 12 other projects in the npm registry using @cucumber/tag-expressions.', '@cucumber/tag-expressions - npmGitDownloads');
INSERT INTO public.posts VALUES (117, 1, 'https://www.npmjs.com/package/@cucumber/tag-expressions', 'awa', '2023-03-25 17:45:01.222525', NULL, 'https://static.npmjs.com/338e4905a2684ca96e08c7780fc68412.png', 'Cucumber Tag Expression parser. Latest version: 5.0.1, last published: 3 months ago. Start using @cucumber/tag-expressions in your project by running `npm i @cucumber/tag-expressions`. There are 12 other projects in the npm registry using @cucumber/tag-expressions.', '@cucumber/tag-expressions - npmGitDownloads');
INSERT INTO public.posts VALUES (118, 1, 'https://www.npmjs.com/package/@cucumber/tag-expressions', 'carlos', '2023-03-25 17:45:08.053969', NULL, 'https://static.npmjs.com/338e4905a2684ca96e08c7780fc68412.png', 'Cucumber Tag Expression parser. Latest version: 5.0.1, last published: 3 months ago. Start using @cucumber/tag-expressions in your project by running `npm i @cucumber/tag-expressions`. There are 12 other projects in the npm registry using @cucumber/tag-expressions.', '@cucumber/tag-expressions - npmGitDownloads');
INSERT INTO public.posts VALUES (119, 1, 'https://www.npmjs.com/package/@cucumber/tag-expressions', 'awa', '2023-03-25 17:45:25.315128', NULL, 'https://static.npmjs.com/338e4905a2684ca96e08c7780fc68412.png', 'Cucumber Tag Expression parser. Latest version: 5.0.1, last published: 3 months ago. Start using @cucumber/tag-expressions in your project by running `npm i @cucumber/tag-expressions`. There are 12 other projects in the npm registry using @cucumber/tag-expressions.', '@cucumber/tag-expressions - npmGitDownloads');
INSERT INTO public.posts VALUES (120, 1, 'https://www.npmjs.com/package/@cucumber/tag-expressions', '#comment', '2023-03-25 18:00:28.9388', NULL, 'https://static.npmjs.com/338e4905a2684ca96e08c7780fc68412.png', 'Cucumber Tag Expression parser. Latest version: 5.0.1, last published: 3 months ago. Start using @cucumber/tag-expressions in your project by running `npm i @cucumber/tag-expressions`. There are 12 other projects in the npm registry using @cucumber/tag-expressions.', '@cucumber/tag-expressions - npmGitDownloads');
INSERT INTO public.posts VALUES (121, 1, 'https://www.youtube.com/results?search_query=jooj+chaves', '#comentario2', '2023-03-25 18:02:33.91863', NULL, NULL, NULL, '');
INSERT INTO public.posts VALUES (122, 1, 'https://www.youtube.com/watch?v=32pHo_yc3Gg', '#amoSuco', '2023-03-25 18:04:35.303405', NULL, 'https://i.ytimg.com/vi/32pHo_yc3Gg/hqdefault.jpg', 'OI, EU SOU O JAISON MENDES.', 'SUCO DE LARANJA DELÍCIA - YouTube');
INSERT INTO public.posts VALUES (123, 1, 'https://en.wikipedia.org/wiki/Mercedes-Benz_W124', '#jojofags sao gays', '2023-03-25 23:45:53.065612', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg/1200px-Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg', NULL, 'Mercedes-Benz W124 - Wikipedia');
INSERT INTO public.posts VALUES (124, 1, 'https://en.wikipedia.org/wiki/Mercedes-Benz_W124', '#jojofags sao gays', '2023-03-25 23:47:54.489806', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg/1200px-Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg', NULL, 'Mercedes-Benz W124 - Wikipedia');
INSERT INTO public.posts VALUES (125, 1, 'https://en.wikipedia.org/wiki/Mercedes-Benz_W124', '#jojofags sao gays', '2023-03-25 23:48:19.680928', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg/1200px-Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg', NULL, 'Mercedes-Benz W124 - Wikipedia');
INSERT INTO public.posts VALUES (126, 1, 'https://en.wikipedia.org/wiki/Mercedes-Benz_W124', '#jojofags sao divas', '2023-03-25 23:49:19.703441', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg/1200px-Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg', NULL, 'Mercedes-Benz W124 - Wikipedia');
INSERT INTO public.posts VALUES (127, 1, 'https://en.wikipedia.org/wiki/Mercedes-Benz_W124', '#jojofags sao divas', '2023-03-25 23:49:45.538374', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg/1200px-Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg', NULL, 'Mercedes-Benz W124 - Wikipedia');
INSERT INTO public.posts VALUES (128, 1, 'https://web.whatsapp.com/', '#gogogo awooo', '2023-03-25 23:50:45.370787', NULL, NULL, 'Quickly send and receive WhatsApp messages right from your computer.', 'WhatsApp Web');
INSERT INTO public.posts VALUES (129, 1, 'https://web.whatsapp.com/', '#gogogo awooo', '2023-03-25 23:57:56.425837', NULL, NULL, 'Quickly send and receive WhatsApp messages right from your computer.', 'WhatsApp Web');
INSERT INTO public.posts VALUES (130, 1, 'https://web.whatsapp.com/', '#gogogo #ficaloko #amovaca #vidanocampo awooo', '2023-03-25 23:58:33.548954', NULL, NULL, 'Quickly send and receive WhatsApp messages right from your computer.', 'WhatsApp Web');
INSERT INTO public.posts VALUES (131, 1, 'https://web.whatsapp.com/', '#gogogo #ficaloko #amovaca #vidanocampo awooo', '2023-03-25 23:58:43.88492', NULL, NULL, 'Quickly send and receive WhatsApp messages right from your computer.', 'WhatsApp Web');
INSERT INTO public.posts VALUES (132, 1, 'https://web.whatsapp.com/', '#gogogo #ficaloko #amovaca #vidanocampo awooo', '2023-03-25 23:58:52.326312', NULL, NULL, 'Quickly send and receive WhatsApp messages right from your computer.', 'WhatsApp Web');
INSERT INTO public.posts VALUES (133, 1, 'https://web.whatsapp.com/', '#gogogo #ficaloko #amovaca #vidanocampo awooo', '2023-03-25 23:59:08.561129', NULL, NULL, 'Quickly send and receive WhatsApp messages right from your computer.', 'WhatsApp Web');
INSERT INTO public.posts VALUES (134, 1, 'https://web.whatsapp.com/', '#gogogo #ficaloko #amovaca #vidanocampo doidao', '2023-03-25 23:59:17.520826', NULL, NULL, 'Quickly send and receive WhatsApp messages right from your computer.', 'WhatsApp Web');
INSERT INTO public.posts VALUES (135, 1, 'https://web.whatsapp.com/', '#gogogo #ficaloko #amovaca #vidanocampo doidao', '2023-03-25 23:59:34.947159', NULL, NULL, 'Quickly send and receive WhatsApp messages right from your computer.', 'WhatsApp Web');
INSERT INTO public.posts VALUES (136, 1, 'https://en.wikipedia.org/wiki/Mercedes-Benz_W124', '#gogogo #ficaloko #amovaca #vidanocampo doidao', '2023-03-25 23:59:49.241336', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg/1200px-Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg', NULL, 'Mercedes-Benz W124 - Wikipedia');
INSERT INTO public.posts VALUES (137, 1, 'https://en.wikipedia.org/wiki/Mercedes-Benz_W124', '#gogogo #ficaloko #amovaca #vidanocampo doidao', '2023-03-26 00:00:18.602539', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg/1200px-Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg', NULL, 'Mercedes-Benz W124 - Wikipedia');
INSERT INTO public.posts VALUES (138, 1, 'https://en.wikipedia.org/wiki/Mercedes-Benz_W124', '#gogogo #ficaloko #amovaca #vidanocampo doidao', '2023-03-26 00:00:38.493936', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg/1200px-Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg', NULL, 'Mercedes-Benz W124 - Wikipedia');
INSERT INTO public.posts VALUES (139, 1, 'https://en.wikipedia.org/wiki/Mercedes-Benz_W124', '#gogogo #ficaloko #amovaca #vidanocampo doidao', '2023-03-26 00:01:08.670531', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg/1200px-Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg', NULL, 'Mercedes-Benz W124 - Wikipedia');
INSERT INTO public.posts VALUES (140, 1, 'https://en.wikipedia.org/wiki/Mercedes-Benz_W124', '#gogogo #ficaloko #amovaca #vidanocampo doidao', '2023-03-26 00:01:29.436585', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg/1200px-Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg', NULL, 'Mercedes-Benz W124 - Wikipedia');
INSERT INTO public.posts VALUES (141, 1, 'https://en.wikipedia.org/wiki/Mercedes-Benz_W124', '#gogogo #ficaloko #amovaca #vidanocampo doidao', '2023-03-26 00:01:45.808793', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg/1200px-Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg', NULL, 'Mercedes-Benz W124 - Wikipedia');
INSERT INTO public.posts VALUES (142, 1, 'https://en.wikipedia.org/wiki/Mercedes-Benz_W124', '#gogogo #ficaloko #amovaca #vidanocampo doidao', '2023-03-26 00:07:06.772294', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg/1200px-Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg', NULL, 'Mercedes-Benz W124 - Wikipedia');
INSERT INTO public.posts VALUES (143, 1, 'https://en.wikipedia.org/wiki/Mercedes-Benz_W124', '#gogogo #ficaloko #amovaca #vidanocampo doidao', '2023-03-26 00:07:25.66444', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg/1200px-Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg', NULL, 'Mercedes-Benz W124 - Wikipedia');
INSERT INTO public.posts VALUES (144, 1, 'https://en.wikipedia.org/wiki/Mercedes-Benz_W124', '#gogogo #ficaloko #amovaca #vidanocampo doidao', '2023-03-26 00:07:43.775627', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg/1200px-Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg', NULL, 'Mercedes-Benz W124 - Wikipedia');
INSERT INTO public.posts VALUES (145, 1, 'https://en.wikipedia.org/wiki/Mercedes-Benz_W124', '#gogogo #ficaloko #amovaca #vidanocampo doidao', '2023-03-26 00:07:56.172486', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg/1200px-Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg', NULL, 'Mercedes-Benz W124 - Wikipedia');
INSERT INTO public.posts VALUES (146, 1, 'https://en.wikipedia.org/wiki/Mercedes-Benz_W124', '#gogogo #ficaloko #amovaca #vidanocampo doidao', '2023-03-26 00:08:20.391404', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg/1200px-Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg', NULL, 'Mercedes-Benz W124 - Wikipedia');
INSERT INTO public.posts VALUES (147, 1, 'https://en.wikipedia.org/wiki/Mercedes-Benz_W124', '#gogogo #ficaloko #amovaca #vidanocampo doidao', '2023-03-26 00:08:35.139999', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg/1200px-Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg', NULL, 'Mercedes-Benz W124 - Wikipedia');
INSERT INTO public.posts VALUES (148, 1, 'https://en.wikipedia.org/wiki/Mercedes-Benz_W124', '#gogogo #ficaloko #amovaca #vidanocampo doidao', '2023-03-26 00:10:15.39625', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg/1200px-Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg', NULL, 'Mercedes-Benz W124 - Wikipedia');
INSERT INTO public.posts VALUES (149, 1, 'https://en.wikipedia.org/wiki/Mercedes-Benz_W124', '#gogogo #ficaloko #amovaca #vidanocampo doidao', '2023-03-26 00:10:49.79654', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg/1200px-Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg', NULL, 'Mercedes-Benz W124 - Wikipedia');
INSERT INTO public.posts VALUES (150, 1, 'https://en.wikipedia.org/wiki/Mercedes-Benz_W124', '#gogogo #ficaloko #amovaca #vidanocampo doidao', '2023-03-26 00:11:17.757942', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg/1200px-Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg', NULL, 'Mercedes-Benz W124 - Wikipedia');
INSERT INTO public.posts VALUES (151, 1, 'https://en.wikipedia.org/wiki/Mercedes-Benz_W124', '#gogogo #ficaloko #amovaca #vidanocampo doidao', '2023-03-26 00:17:35.717397', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg/1200px-Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg', NULL, 'Mercedes-Benz W124 - Wikipedia');
INSERT INTO public.posts VALUES (152, 1, 'https://en.wikipedia.org/wiki/Mercedes-Benz_W124', '#gogogo #ficaloko #amovaca #vidanocampo doidao', '2023-03-26 00:17:38.520672', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg/1200px-Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg', NULL, 'Mercedes-Benz W124 - Wikipedia');
INSERT INTO public.posts VALUES (153, 1, 'https://en.wikipedia.org/wiki/Mercedes-Benz_W124', '#gogogo #ficaloko #amovaca #vidanocampo doidao', '2023-03-26 00:18:07.497376', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg/1200px-Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg', NULL, 'Mercedes-Benz W124 - Wikipedia');
INSERT INTO public.posts VALUES (154, 1, 'https://en.wikipedia.org/wiki/Mercedes-Benz_W124', '#gogogo #ficaloko #amovaca #vidanocampo doidao', '2023-03-26 00:18:24.5768', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg/1200px-Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg', NULL, 'Mercedes-Benz W124 - Wikipedia');
INSERT INTO public.posts VALUES (155, 1, 'https://en.wikipedia.org/wiki/Mercedes-Benz_W124', '#go', '2023-03-26 00:18:32.822837', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg/1200px-Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg', NULL, 'Mercedes-Benz W124 - Wikipedia');
INSERT INTO public.posts VALUES (156, 1, 'https://en.wikipedia.org/wiki/Mercedes-Benz_W124', '#go', '2023-03-26 00:22:35.875476', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg/1200px-Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg', NULL, 'Mercedes-Benz W124 - Wikipedia');
INSERT INTO public.posts VALUES (157, 1, 'https://en.wikipedia.org/wiki/Mercedes-Benz_W124', '#go #teste #sono #noitada', '2023-03-26 00:23:00.103338', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg/1200px-Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg', NULL, 'Mercedes-Benz W124 - Wikipedia');
INSERT INTO public.posts VALUES (158, 1, 'https://en.wikipedia.org/wiki/Mercedes-Benz_W124', '#go #teste #sono #noitada', '2023-03-26 00:23:37.726006', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg/1200px-Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg', NULL, 'Mercedes-Benz W124 - Wikipedia');
INSERT INTO public.posts VALUES (159, 1, 'https://en.wikipedia.org/wiki/Mercedes-Benz_W124', '#go #teste #sono #noitada', '2023-03-26 00:23:53.343245', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg/1200px-Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg', NULL, 'Mercedes-Benz W124 - Wikipedia');
INSERT INTO public.posts VALUES (160, 1, 'https://en.wikipedia.org/wiki/Mercedes-Benz_W124', '#go #teste #sono #noitada', '2023-03-26 00:24:00.463082', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg/1200px-Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg', NULL, 'Mercedes-Benz W124 - Wikipedia');
INSERT INTO public.posts VALUES (161, 1, 'https://en.wikipedia.org/wiki/Mercedes-Benz_W124', ' #go #teste #sono #noitada #novidade', '2023-03-26 00:24:13.79824', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg/1200px-Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg', NULL, 'Mercedes-Benz W124 - Wikipedia');
INSERT INTO public.posts VALUES (162, 1, 'https://en.wikipedia.org/wiki/Mercedes-Benz_W124', ' #go #teste #sono #noitada #novidade', '2023-03-26 00:26:53.709385', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg/1200px-Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg', NULL, 'Mercedes-Benz W124 - Wikipedia');
INSERT INTO public.posts VALUES (163, 1, 'https://en.wikipedia.org/wiki/Mercedes-Benz_W124', ' #go #teste #sono #noitada #novidade', '2023-03-26 00:27:08.223638', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg/1200px-Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg', NULL, 'Mercedes-Benz W124 - Wikipedia');
INSERT INTO public.posts VALUES (164, 1, 'https://en.wikipedia.org/wiki/Mercedes-Benz_W124', ' #go #teste #sono #noitada #novidade', '2023-03-26 00:27:56.249075', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg/1200px-Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg', NULL, 'Mercedes-Benz W124 - Wikipedia');
INSERT INTO public.posts VALUES (165, 1, 'https://en.wikipedia.org/wiki/Mercedes-Benz_W124', ' #go #teste #sono #noitada #novidade', '2023-03-26 00:28:08.055748', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg/1200px-Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg', NULL, 'Mercedes-Benz W124 - Wikipedia');
INSERT INTO public.posts VALUES (166, 1, 'https://en.wikipedia.org/wiki/Mercedes-Benz_W124', ' #go #teste #sono #noitada #novidade', '2023-03-26 00:29:48.735821', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg/1200px-Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg', NULL, 'Mercedes-Benz W124 - Wikipedia');
INSERT INTO public.posts VALUES (167, 1, 'https://en.wikipedia.org/wiki/Mercedes-Benz_W124', ' #go #adamastor adormecer', '2023-03-26 00:30:24.731202', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg/1200px-Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg', NULL, 'Mercedes-Benz W124 - Wikipedia');
INSERT INTO public.posts VALUES (168, 1, 'https://en.wikipedia.org/wiki/Mercedes-Benz_W124', ' #go #adamastor adormecer', '2023-03-26 00:30:53.366466', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg/1200px-Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg', NULL, 'Mercedes-Benz W124 - Wikipedia');
INSERT INTO public.posts VALUES (169, 1, 'https://en.wikipedia.org/wiki/Mercedes-Benz_W124', ' #go #adamastor adormecer', '2023-03-26 00:31:18.719691', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg/1200px-Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg', NULL, 'Mercedes-Benz W124 - Wikipedia');
INSERT INTO public.posts VALUES (170, 1, 'https://en.wikipedia.org/wiki/Mercedes-Benz_W124', ' #go #adamastor adormecer', '2023-03-26 00:32:04.517754', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg/1200px-Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg', NULL, 'Mercedes-Benz W124 - Wikipedia');
INSERT INTO public.posts VALUES (171, 1, 'https://en.wikipedia.org/wiki/Mercedes-Benz_W124', ' #go #adamastor adormecer', '2023-03-26 00:32:18.025199', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg/1200px-Mercedes-Benz_W_124_26.09.20_JM_%282%29.jpg', NULL, 'Mercedes-Benz W124 - Wikipedia');
INSERT INTO public.posts VALUES (172, 1, 'https://www.youtube.com/watch?v=UdAU1BU7LQQ', '#carro #pista #audiR8', '2023-03-26 00:33:48.434217', NULL, 'https://i.ytimg.com/vi/UdAU1BU7LQQ/hqdefault.jpg', 'During the Petrolhead Events Spring Event I have filmed this lovely red Audi R8 V10 Plus with a straight piped exhaust system. You will hear some crazy loud ...', 'Audi R8 V10 Plus w/  Straight Pipes - REVS & LAUNCH CONTROLS! - YouTube');
INSERT INTO public.posts VALUES (173, 1, 'http://localhost:3000/timeline', '#pista', '2023-03-26 17:06:34.193543', NULL, NULL, NULL, NULL);
INSERT INTO public.posts VALUES (174, 1, 'http://localhost:3000/timeline', '#pista', '2023-03-26 17:06:36.373742', NULL, NULL, NULL, NULL);
INSERT INTO public.posts VALUES (175, 1, 'http://localhost:3000/timeline', '#pista', '2023-03-26 17:06:36.8414', NULL, NULL, NULL, NULL);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'jooj@juj.com', 'dolan dark', '$2b$10$juFRPI9/o0OQY7B05/8aVupJuj.lzHtpWw0dw2O8WgLHTwD7uOwwG', 'https://vignette.wikia.nocookie.net/youtube/images/e/ed/DolanDarkest.jpg/revision/latest/scale-to-width-down/350?cb=20180625225520', '2023-03-10 18:11:52.565352');
INSERT INTO public.users VALUES (2, 'jooj@jooj.com', 'jooj@jooj.com', '$2b$10$CA9Z3cHmNelUowpwaPAvg..L2a1Au58krFV2DGO0B/h/2Hgey7H8y', 'https://imgs.search.brave.com/qP9VxXKT6BuYo7j9cG2Ygv0r0on6yY4yrSPEec8Njws/rs:fit:1200:1071:1/g:ce/aHR0cDovLzMuYnAu/YmxvZ3Nwb3QuY29t/Ly0tWEEzaU12YUpM/WS9Ud19HeWtQcy1l/SS9BQUFBQUFBQUVn/VS9FbUZLUzdDejV4/US9zMTYwMC9EdWNr/LTA0LmpwZw', '2023-03-10 19:13:57.095307');
INSERT INTO public.users VALUES (3, 'aaaaaa@aaa.com', 'jojudo', '$2b$10$L5yPReE/jTd7cG6A/nVPceH2Otekk.9iPjmid2fnLjtVWOL/DXkWG', 'https://imgs.search.brave.com/nIzHfM2rtot2Bmstbj6bt03c3of-VAFayQOKWkqmcOQ/rs:fit:1200:1200:1/g:ce/aHR0cDovL2FiY2hv/bWVvcGF0aWEuY29t/L3dwLWNvbnRlbnQv/dXBsb2Fkcy8yMDEz/LzA2L3BhdG8uanBn', '2023-03-10 20:07:56.006333');
INSERT INTO public.users VALUES (4, 'aaaaaa@aaaa.com', 'aaa', '$2b$10$K1P.26GPSfeQhpf5.EiQbenQHXost41jwoqdGyEUKSPe8RfH42c5W', 'https://projeto-linkr.onrender.com', '2023-03-13 18:58:14.254429');
INSERT INTO public.users VALUES (5, 'teupremium@email.com', 'teuprimo', '$2b$10$UdKIzLJ.Ug7j5unf3e6z.O3MvsXqhPVfFQaUQxuhPznGE6uPstdMi', 'https://imgs.search.brave.com/Sj0whEQ_PjS5oNUh1NaSwa3Hui9cD2dUhL7KSfqMyOA/rs:fit:674:674:1/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vNzM2/eC9jNC84MS83Yi9j/NDgxN2IwNjUyNjA3/NjI2Y2IzNDY3YjMw/N2VmNDg5Mi5qcGc', '2023-03-21 16:22:50.178744');
INSERT INTO public.users VALUES (6, 'abc@abc.com', 'abcdario', '$2b$10$S6fdlXrYQpp9Vqu1PQUgwOgIrOVipFlAPTcw2.bbTj9B3Ra0NaJ5K', 'https://imgs.search.brave.com/2b825HlGtYoP_4ajkC04aozg4u-w0SuXkHu1XUeTsnE/rs:fit:1200:1200:1/g:ce/aHR0cHM6Ly93d3cu/aW5mb2VzY29sYS5j/b20vd3AtY29udGVu/dC91cGxvYWRzLzIw/MDgvMDUvY2F2YWxv/LTE0MzUzMTYwOC5q/cGc', '2023-03-21 18:04:31.029711');
INSERT INTO public.users VALUES (7, 'a@nao.com', 'anao', '$2b$10$slimoQR3Ms1l09VwYyTXVeO2YAJ4GxTIdsQUa0L3mL6M26KP7JCg6', 'https://jangada.ag/wp-content/uploads/2017/04/jangada-v2-baby-do-brasil-7-capa-quadrada.jpg', '2023-03-21 18:28:55.569879');


--
-- Name: hashtag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.hashtag_id_seq', 47, true);


--
-- Name: likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.likes_id_seq', 1, false);


--
-- Name: postHashtag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."postHashtag_id_seq"', 10, true);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.posts_id_seq', 175, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 7, true);


--
-- Name: hashtag hashtag_hashtagName_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hashtag
    ADD CONSTRAINT "hashtag_hashtagName_key" UNIQUE ("hashtagName");


--
-- Name: hashtag hashtag_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hashtag
    ADD CONSTRAINT hashtag_pkey PRIMARY KEY (id);


--
-- Name: likes likes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (id);


--
-- Name: postHashtag postHashtag_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."postHashtag"
    ADD CONSTRAINT "postHashtag_pkey" PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: likes likes_postId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT "likes_postId_fkey" FOREIGN KEY ("postId") REFERENCES public.posts(id);


--
-- Name: likes likes_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT "likes_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: posts posts_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT "posts_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

