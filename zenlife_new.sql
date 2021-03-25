--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: structaq_answertype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.structaq_answertype (
    id integer NOT NULL,
    short character varying(60) NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.structaq_answertype OWNER TO postgres;

--
-- Name: structaq_answertype_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.structaq_answertype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.structaq_answertype_id_seq OWNER TO postgres;

--
-- Name: structaq_answertype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.structaq_answertype_id_seq OWNED BY public.structaq_answertype.id;


--
-- Name: structaq_challengetype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.structaq_challengetype (
    id integer NOT NULL,
    short character varying(100) NOT NULL,
    name character varying(255) NOT NULL,
    "order" integer NOT NULL
);


ALTER TABLE public.structaq_challengetype OWNER TO postgres;

--
-- Name: structaq_challengetype_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.structaq_challengetype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.structaq_challengetype_id_seq OWNER TO postgres;

--
-- Name: structaq_challengetype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.structaq_challengetype_id_seq OWNED BY public.structaq_challengetype.id;


--
-- Name: structaq_factstudentchallenge; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.structaq_factstudentchallenge (
    id integer NOT NULL,
    startdate timestamp with time zone NOT NULL,
    enddate timestamp with time zone NOT NULL,
    passed boolean,
    active boolean NOT NULL,
    challenge_id integer NOT NULL,
    instructor_id integer NOT NULL,
    student_id integer NOT NULL,
    instructed boolean,
    instructed_date timestamp with time zone,
    pass_date timestamp with time zone
);


ALTER TABLE public.structaq_factstudentchallenge OWNER TO postgres;

--
-- Name: structaq_factstudentchallenge_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.structaq_factstudentchallenge_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.structaq_factstudentchallenge_id_seq OWNER TO postgres;

--
-- Name: structaq_factstudentchallenge_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.structaq_factstudentchallenge_id_seq OWNED BY public.structaq_factstudentchallenge.id;


--
-- Name: structaq_factstudentchallengehistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.structaq_factstudentchallengehistory (
    id integer NOT NULL,
    passed boolean,
    pass_date timestamp with time zone,
    instructed boolean,
    instructed_date timestamp with time zone,
    active boolean NOT NULL,
    challenge_id integer NOT NULL,
    instructor_id integer NOT NULL,
    student_id integer NOT NULL,
    status_flag character varying(11)
);


ALTER TABLE public.structaq_factstudentchallengehistory OWNER TO postgres;

--
-- Name: structaq_factstudentchallengehistory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.structaq_factstudentchallengehistory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.structaq_factstudentchallengehistory_id_seq OWNER TO postgres;

--
-- Name: structaq_factstudentchallengehistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.structaq_factstudentchallengehistory_id_seq OWNED BY public.structaq_factstudentchallengehistory.id;


--
-- Name: structaq_factstudentcurriculum; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.structaq_factstudentcurriculum (
    id integer NOT NULL,
    startdate timestamp with time zone NOT NULL,
    enddate timestamp with time zone NOT NULL,
    active boolean NOT NULL,
    curriculum_id integer NOT NULL,
    progression_id integer NOT NULL,
    student_id integer NOT NULL
);


ALTER TABLE public.structaq_factstudentcurriculum OWNER TO postgres;

--
-- Name: structaq_factstudentcurriculum_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.structaq_factstudentcurriculum_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.structaq_factstudentcurriculum_id_seq OWNER TO postgres;

--
-- Name: structaq_factstudentcurriculum_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.structaq_factstudentcurriculum_id_seq OWNED BY public.structaq_factstudentcurriculum.id;


--
-- Name: structaq_featurechallenge; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.structaq_featurechallenge (
    id integer NOT NULL,
    short character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    "order" integer NOT NULL,
    active boolean NOT NULL,
    answer character varying(400),
    answertype_id integer NOT NULL,
    challengetype_id integer NOT NULL,
    hints text,
    hints_video character varying(255)
);


ALTER TABLE public.structaq_featurechallenge OWNER TO postgres;

--
-- Name: structaq_featurechallenge_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.structaq_featurechallenge_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.structaq_featurechallenge_id_seq OWNER TO postgres;

--
-- Name: structaq_featurechallenge_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.structaq_featurechallenge_id_seq OWNED BY public.structaq_featurechallenge.id;


--
-- Name: structaq_featurechallengecurriculum; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.structaq_featurechallengecurriculum (
    id integer NOT NULL,
    "order" integer NOT NULL,
    challenge_id integer NOT NULL,
    curriculum_id integer NOT NULL,
    progression_id integer NOT NULL
);


ALTER TABLE public.structaq_featurechallengecurriculum OWNER TO postgres;

--
-- Name: structaq_featurechallengecurriculum_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.structaq_featurechallengecurriculum_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.structaq_featurechallengecurriculum_id_seq OWNER TO postgres;

--
-- Name: structaq_featurechallengecurriculum_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.structaq_featurechallengecurriculum_id_seq OWNED BY public.structaq_featurechallengecurriculum.id;


--
-- Name: structaq_featurecurriculum; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.structaq_featurecurriculum (
    id integer NOT NULL,
    short character varying(100) NOT NULL,
    name character varying(255) NOT NULL,
    "order" integer NOT NULL,
    belt character varying(100),
    progression_id integer NOT NULL
);


ALTER TABLE public.structaq_featurecurriculum OWNER TO postgres;

--
-- Name: structaq_featurecurriculum_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.structaq_featurecurriculum_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.structaq_featurecurriculum_id_seq OWNER TO postgres;

--
-- Name: structaq_featurecurriculum_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.structaq_featurecurriculum_id_seq OWNED BY public.structaq_featurecurriculum.id;


--
-- Name: structaq_featureinstructor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.structaq_featureinstructor (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    middle_name character varying(100),
    last_name character varying(100) NOT NULL,
    full_name character varying(255) NOT NULL,
    birthdate date NOT NULL,
    active boolean NOT NULL,
    startdate timestamp with time zone NOT NULL,
    enddate timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    photo character varying(100)
);


ALTER TABLE public.structaq_featureinstructor OWNER TO postgres;

--
-- Name: structaq_featureinstructor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.structaq_featureinstructor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.structaq_featureinstructor_id_seq OWNER TO postgres;

--
-- Name: structaq_featureinstructor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.structaq_featureinstructor_id_seq OWNED BY public.structaq_featureinstructor.id;


--
-- Name: structaq_featureprogression; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.structaq_featureprogression (
    id integer NOT NULL,
    short character varying(60) NOT NULL,
    name character varying(255) NOT NULL,
    "order" integer NOT NULL
);


ALTER TABLE public.structaq_featureprogression OWNER TO postgres;

--
-- Name: structaq_featureprogression_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.structaq_featureprogression_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.structaq_featureprogression_id_seq OWNER TO postgres;

--
-- Name: structaq_featureprogression_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.structaq_featureprogression_id_seq OWNED BY public.structaq_featureprogression.id;


--
-- Name: structaq_featurestudent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.structaq_featurestudent (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    middle_name character varying(100),
    last_name character varying(100) NOT NULL,
    full_name character varying(255) NOT NULL,
    birthdate date NOT NULL,
    active boolean NOT NULL,
    startdate timestamp with time zone NOT NULL,
    enddate timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    photo character varying(100)
);


ALTER TABLE public.structaq_featurestudent OWNER TO postgres;

--
-- Name: structaq_featurestudent_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.structaq_featurestudent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.structaq_featurestudent_id_seq OWNER TO postgres;

--
-- Name: structaq_featurestudent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.structaq_featurestudent_id_seq OWNED BY public.structaq_featurestudent.id;


--
-- Name: structaq_featurestudentprogression; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.structaq_featurestudentprogression (
    id integer NOT NULL,
    startdate date NOT NULL,
    enddate date NOT NULL,
    active boolean NOT NULL,
    progression_id integer NOT NULL,
    student_id integer NOT NULL
);


ALTER TABLE public.structaq_featurestudentprogression OWNER TO postgres;

--
-- Name: structaq_featurestudentprogression_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.structaq_featurestudentprogression_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.structaq_featurestudentprogression_id_seq OWNER TO postgres;

--
-- Name: structaq_featurestudentprogression_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.structaq_featurestudentprogression_id_seq OWNED BY public.structaq_featurestudentprogression.id;


--
-- Name: structaq_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.structaq_user (
    id integer NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first character varying(100),
    middle character varying(100),
    last character varying(100),
    name character varying(255),
    email character varying(50) NOT NULL,
    birthdate date,
    student boolean NOT NULL,
    family boolean NOT NULL,
    instructor boolean NOT NULL,
    management boolean NOT NULL,
    password character varying(255) NOT NULL,
    status boolean NOT NULL,
    startdate timestamp with time zone NOT NULL,
    enddate timestamp with time zone NOT NULL,
    first_name character varying(30),
    last_name character varying(150),
    is_staff boolean,
    is_active boolean,
    date_joined timestamp with time zone
);


ALTER TABLE public.structaq_user OWNER TO postgres;

--
-- Name: structaq_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.structaq_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.structaq_user_groups OWNER TO postgres;

--
-- Name: structaq_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.structaq_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.structaq_user_groups_id_seq OWNER TO postgres;

--
-- Name: structaq_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.structaq_user_groups_id_seq OWNED BY public.structaq_user_groups.id;


--
-- Name: structaq_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.structaq_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.structaq_user_id_seq OWNER TO postgres;

--
-- Name: structaq_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.structaq_user_id_seq OWNED BY public.structaq_user.id;


--
-- Name: structaq_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.structaq_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.structaq_user_user_permissions OWNER TO postgres;

--
-- Name: structaq_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.structaq_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.structaq_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: structaq_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.structaq_user_user_permissions_id_seq OWNED BY public.structaq_user_user_permissions.id;


--
-- Name: thumbnail_kvstore; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.thumbnail_kvstore (
    key character varying(200) NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.thumbnail_kvstore OWNER TO postgres;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: structaq_answertype id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_answertype ALTER COLUMN id SET DEFAULT nextval('public.structaq_answertype_id_seq'::regclass);


--
-- Name: structaq_challengetype id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_challengetype ALTER COLUMN id SET DEFAULT nextval('public.structaq_challengetype_id_seq'::regclass);


--
-- Name: structaq_factstudentchallenge id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_factstudentchallenge ALTER COLUMN id SET DEFAULT nextval('public.structaq_factstudentchallenge_id_seq'::regclass);


--
-- Name: structaq_factstudentchallengehistory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_factstudentchallengehistory ALTER COLUMN id SET DEFAULT nextval('public.structaq_factstudentchallengehistory_id_seq'::regclass);


--
-- Name: structaq_factstudentcurriculum id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_factstudentcurriculum ALTER COLUMN id SET DEFAULT nextval('public.structaq_factstudentcurriculum_id_seq'::regclass);


--
-- Name: structaq_featurechallenge id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_featurechallenge ALTER COLUMN id SET DEFAULT nextval('public.structaq_featurechallenge_id_seq'::regclass);


--
-- Name: structaq_featurechallengecurriculum id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_featurechallengecurriculum ALTER COLUMN id SET DEFAULT nextval('public.structaq_featurechallengecurriculum_id_seq'::regclass);


--
-- Name: structaq_featurecurriculum id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_featurecurriculum ALTER COLUMN id SET DEFAULT nextval('public.structaq_featurecurriculum_id_seq'::regclass);


--
-- Name: structaq_featureinstructor id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_featureinstructor ALTER COLUMN id SET DEFAULT nextval('public.structaq_featureinstructor_id_seq'::regclass);


--
-- Name: structaq_featureprogression id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_featureprogression ALTER COLUMN id SET DEFAULT nextval('public.structaq_featureprogression_id_seq'::regclass);


--
-- Name: structaq_featurestudent id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_featurestudent ALTER COLUMN id SET DEFAULT nextval('public.structaq_featurestudent_id_seq'::regclass);


--
-- Name: structaq_featurestudentprogression id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_featurestudentprogression ALTER COLUMN id SET DEFAULT nextval('public.structaq_featurestudentprogression_id_seq'::regclass);


--
-- Name: structaq_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_user ALTER COLUMN id SET DEFAULT nextval('public.structaq_user_id_seq'::regclass);


--
-- Name: structaq_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_user_groups ALTER COLUMN id SET DEFAULT nextval('public.structaq_user_groups_id_seq'::regclass);


--
-- Name: structaq_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.structaq_user_user_permissions_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add Users	6	add_user
22	Can change Users	6	change_user
23	Can delete Users	6	delete_user
24	Can view Users	6	view_user
25	Can add Answer Type	7	add_answertype
26	Can change Answer Type	7	change_answertype
27	Can delete Answer Type	7	delete_answertype
28	Can view Answer Type	7	view_answertype
29	Can add Challenge Type	8	add_challengetype
30	Can change Challenge Type	8	change_challengetype
31	Can delete Challenge Type	8	delete_challengetype
32	Can view Challenge Type	8	view_challengetype
33	Can add Fact Student Challenge	9	add_factstudentchallenge
34	Can change Fact Student Challenge	9	change_factstudentchallenge
35	Can delete Fact Student Challenge	9	delete_factstudentchallenge
36	Can view Fact Student Challenge	9	view_factstudentchallenge
37	Can add Fact Student Curriculum	10	add_factstudentcurriculum
38	Can change Fact Student Curriculum	10	change_factstudentcurriculum
39	Can delete Fact Student Curriculum	10	delete_factstudentcurriculum
40	Can view Fact Student Curriculum	10	view_factstudentcurriculum
41	Can add Feature Challenge	11	add_featurechallenge
42	Can change Feature Challenge	11	change_featurechallenge
43	Can delete Feature Challenge	11	delete_featurechallenge
44	Can view Feature Challenge	11	view_featurechallenge
45	Can add Feature Challenge Curriculum	12	add_featurechallengecurriculum
46	Can change Feature Challenge Curriculum	12	change_featurechallengecurriculum
47	Can delete Feature Challenge Curriculum	12	delete_featurechallengecurriculum
48	Can view Feature Challenge Curriculum	12	view_featurechallengecurriculum
49	Can add Feature Curriculum	13	add_featurecurriculum
50	Can change Feature Curriculum	13	change_featurecurriculum
51	Can delete Feature Curriculum	13	delete_featurecurriculum
52	Can view Feature Curriculum	13	view_featurecurriculum
53	Can add Feature Instructor	14	add_featureinstructor
54	Can change Feature Instructor	14	change_featureinstructor
55	Can delete Feature Instructor	14	delete_featureinstructor
56	Can view Feature Instructor	14	view_featureinstructor
57	Can add Feature Progression	15	add_featureprogression
58	Can change Feature Progression	15	change_featureprogression
59	Can delete Feature Progression	15	delete_featureprogression
60	Can view Feature Progression	15	view_featureprogression
61	Can add Feature Student	16	add_featurestudent
62	Can change Feature Student	16	change_featurestudent
63	Can delete Feature Student	16	delete_featurestudent
64	Can view Feature Student	16	view_featurestudent
65	Can add Feature Student Progression	17	add_featurestudentprogression
66	Can change Feature Student Progression	17	change_featurestudentprogression
67	Can delete Feature Student Progression	17	delete_featurestudentprogression
68	Can view Feature Student Progression	17	view_featurestudentprogression
69	Can add main table	10	add_maintable
70	Can change main table	10	change_maintable
71	Can delete main table	10	delete_maintable
72	Can view main table	10	view_maintable
73	Can add kv store	19	add_kvstore
74	Can change kv store	19	change_kvstore
75	Can delete kv store	19	delete_kvstore
76	Can view kv store	19	view_kvstore
77	Can add Fact Student Challenge (HISTORY)	20	add_factstudentchallengehistory
78	Can change Fact Student Challenge (HISTORY)	20	change_factstudentchallengehistory
79	Can delete Fact Student Challenge (HISTORY)	20	delete_factstudentchallengehistory
80	Can view Fact Student Challenge (HISTORY)	20	view_factstudentchallengehistory
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2019-02-08 16:00:47.369969+00	1	developer	2	[{"changed": {"fields": ["birthdate", "instructor"]}}]	6	1
2	2019-02-08 16:51:34.044816+00	1	Mike N Nadeau	2	[{"changed": {"fields": ["photo"]}}]	14	1
3	2019-02-08 16:52:00.441617+00	1	Mike N Nadeau	2	[{"changed": {"fields": ["photo"]}}]	14	1
4	2019-02-08 18:03:21.569961+00	12	Attention Stance “Charyut”	3		9	1
5	2019-02-08 18:03:21.572126+00	1	Attention Stance “Charyut”	3		9	1
6	2019-02-12 14:31:42.426461+00	1	ADULT WHITE BELT	2	[{"changed": {"fields": ["belt"]}}]	13	1
7	2019-02-12 14:32:15.890709+00	3	SR WHITE BELT	2	[{"changed": {"fields": ["belt"]}}]	13	1
8	2019-02-12 14:33:38.348973+00	19	BLACK BELT	2	[{"changed": {"fields": ["belt"]}}]	13	1
9	2019-02-12 14:35:09.130129+00	2	ADULT WHITE BELT w YELLOW STRIPE	2	[{"changed": {"fields": ["belt"]}}]	13	1
10	2019-02-12 14:35:22.672771+00	4	SR WHITE BELT w YELLOW STRIPE	2	[{"changed": {"fields": ["belt"]}}]	13	1
11	2019-02-12 14:35:49.875272+00	5	YELLOW BELT	2	[{"changed": {"fields": ["belt"]}}]	13	1
12	2019-02-12 14:44:19.516213+00	6	YELLOW BELT w ORANGE STRIPE	2	[{"changed": {"fields": ["belt"]}}]	13	1
13	2019-02-12 14:44:46.214623+00	7	ORANGE BELT	2	[{"changed": {"fields": ["belt"]}}]	13	1
14	2019-02-12 14:47:51.410948+00	9	GREEN BELT	2	[{"changed": {"fields": ["belt"]}}]	13	1
15	2019-02-12 14:50:05.336785+00	17	SENOR RED BELT	2	[{"changed": {"fields": ["belt"]}}]	13	1
16	2019-02-12 14:51:13.08083+00	15	SENOR BROWN BELT	2	[{"changed": {"fields": ["belt"]}}]	13	1
17	2019-02-12 14:52:18.386268+00	11	SENOR PURPLE BELT	2	[{"changed": {"fields": ["belt"]}}]	13	1
18	2019-02-12 14:52:30.413381+00	13	SENOR BLUE BELT	2	[{"changed": {"fields": ["belt"]}}]	13	1
19	2019-02-12 14:59:22.17987+00	16	SENOR BROWN BELT w RED STRIPE	2	[{"changed": {"fields": ["belt"]}}]	13	1
20	2019-02-12 15:00:52.889511+00	18	RED BELT w BLACK STRIPE	2	[{"changed": {"fields": ["belt"]}}]	13	1
21	2019-02-12 15:12:46.995852+00	10	GREEN BELT w PURPLE STRIPE	2	[{"changed": {"fields": ["belt"]}}]	13	1
22	2019-02-12 15:14:41.57314+00	8	ORANGE BELT w GREEN STRIPE	2	[{"changed": {"fields": ["belt"]}}]	13	1
23	2019-02-12 15:17:26.30585+00	12	PURPLE BELT w BLUE STRIPE	2	[{"changed": {"fields": ["belt"]}}]	13	1
24	2019-02-12 15:20:53.240944+00	14	SENOR BLUE BELT w BROWN STIPE	2	[{"changed": {"fields": ["belt"]}}]	13	1
25	2019-02-12 15:24:26.016105+00	4	developer	2	[{"changed": {"fields": ["photo"]}}]	14	1
26	2019-02-12 16:07:31.286593+00	6	murads321y	2	[{"changed": {"fields": ["photo"]}}]	16	1
27	2019-02-12 16:08:01.024716+00	5	murads321	2	[{"changed": {"fields": ["photo"]}}]	16	1
28	2019-02-12 16:09:14.574545+00	4	test	2	[{"changed": {"fields": ["photo"]}}]	16	1
29	2019-02-12 16:09:30.442464+00	5	murads321	2	[{"changed": {"fields": ["photo"]}}]	16	1
30	2019-02-12 16:09:48.350668+00	3	Sample S Student02	2	[{"changed": {"fields": ["photo"]}}]	16	1
31	2019-02-12 16:10:02.057469+00	2	Test T Student 01	2	[{"changed": {"fields": ["photo"]}}]	16	1
32	2019-02-12 16:11:41.275107+00	4	test	2	[{"changed": {"fields": ["photo"]}}]	16	1
33	2019-02-12 16:13:12.879092+00	1	Mike N Nadeau	2	[{"changed": {"fields": ["photo"]}}]	16	1
34	2019-02-12 16:14:10.645212+00	2	test	2	[{"changed": {"fields": ["photo"]}}]	14	1
35	2019-02-12 16:16:56.367013+00	1	Mike N Nadeau	2	[{"changed": {"fields": ["photo"]}}]	14	1
36	2019-02-12 16:17:20.192067+00	3	murads321	2	[{"changed": {"fields": ["photo"]}}]	14	1
37	2019-02-12 18:36:25.189539+00	4	True	1	[{"added": {}}]	10	1
38	2019-02-12 18:41:42.444265+00	2	True	2	[{"changed": {"fields": ["startdate"]}}]	10	1
39	2019-02-12 18:51:07.342032+00	4	Test T Student 01	1	[{"added": {}}]	17	1
40	2019-02-12 18:51:44.37906+00	5	test	1	[{"added": {}}]	17	1
41	2019-02-12 18:52:50.344282+00	5	True	1	[{"added": {}}]	10	1
42	2019-02-12 18:58:13.534856+00	17	Attention Stance “Charyut”	1	[{"added": {}}]	9	1
43	2019-02-12 18:59:21.983094+00	5	test	2	[{"changed": {"fields": ["startdate"]}}]	17	1
44	2019-02-13 18:53:11.363857+00	19	KEEBON DONJAK IL (Horse Riding Stance w/Basic Hand Techniques)	2	[{"changed": {"fields": ["instructed"]}}]	9	1
45	2019-02-13 18:53:26.361877+00	4	Attention Stance “Charyut”	2	[{"changed": {"fields": ["instructed"]}}]	9	1
46	2019-02-13 18:53:34.158892+00	6	Low Block“Ahray Mahkee”	2	[{"changed": {"fields": ["instructed"]}}]	9	1
47	2019-02-13 18:53:43.601796+00	16	What is our Proof of Learning Curriculum and our Mastery Testing? (Adults and Children 10 years or older)	2	[{"changed": {"fields": ["instructed"]}}]	9	1
48	2019-02-13 18:54:04.947793+00	9	1. Bow when entering & leaving;	2	[{"changed": {"fields": ["instructed"]}}]	9	1
49	2019-02-13 18:54:13.16321+00	13	4. Show respect at all times;	2	[{"changed": {"fields": ["instructed"]}}]	9	1
50	2019-02-13 18:54:20.434733+00	12	5. Do not talk when the instructor is talking;	2	[{"changed": {"fields": ["instructed"]}}]	9	1
51	2019-02-13 18:54:27.601472+00	10	3. Absolutely no bullying;	2	[{"changed": {"fields": ["instructed"]}}]	9	1
52	2019-02-13 18:54:57.158086+00	2	Ready Stance “Choombee”	2	[{"changed": {"fields": ["instructed"]}}]	9	1
53	2019-02-13 18:55:04.564524+00	3	Front Stance“ApGubee sogee”	2	[{"changed": {"fields": ["instructed"]}}]	9	1
54	2019-02-13 18:55:13.042423+00	5	Defensive Fighting Stance	2	[{"changed": {"fields": ["instructed"]}}]	9	1
55	2019-02-13 18:55:21.536082+00	7	Has paid the $15.00 Materials Fee for testing	2	[{"changed": {"fields": ["instructed"]}}]	9	1
56	2019-02-13 18:55:28.211394+00	11	2. No laying on the floor unless asked to-- otherwise it is seen as a sign of disrespect;	2	[{"changed": {"fields": ["instructed"]}}]	9	1
57	2019-02-13 18:55:41.029309+00	14	1. Bow when entering & leaving;	2	[{"changed": {"fields": ["passed"]}}]	9	1
58	2019-02-13 18:55:51.042224+00	15	2. No laying on the floor unless asked to-- otherwise it is seen as a sign of disrespect;	2	[{"changed": {"fields": ["instructed"]}}]	9	1
59	2019-02-13 18:55:56.914298+00	18	6. No food or gum;	2	[{"changed": {"fields": ["instructed"]}}]	9	1
60	2019-02-14 11:35:43.796496+00	21	Has curriculum folder	2	[{"changed": {"fields": ["instructed", "instructed_date"]}}]	9	1
61	2019-02-14 11:37:31.38551+00	18	6. No food or gum;	2	[{"changed": {"fields": ["pass_date", "instructed_date"]}}]	9	1
62	2019-02-14 11:55:33.089068+00	18	6. No food or gum;	2	[]	9	1
63	2019-02-19 12:44:17.218007+00	15	2. No laying on the floor unless asked to-- otherwise it is seen as a sign of disrespect;	2	[{"changed": {"fields": ["instructed_date"]}}]	9	1
64	2019-02-19 12:44:58.208527+00	13	4. Show respect at all times;	2	[{"changed": {"fields": ["pass_date", "instructed_date"]}}]	9	1
65	2019-02-19 12:45:12.643308+00	10	3. Absolutely no bullying;	2	[{"changed": {"fields": ["pass_date", "instructed_date"]}}]	9	1
66	2019-02-19 12:45:32.336664+00	12	5. Do not talk when the instructor is talking;	2	[{"changed": {"fields": ["pass_date", "instructed_date"]}}]	9	1
67	2019-02-19 12:45:46.323671+00	9	1. Bow when entering & leaving;	2	[{"changed": {"fields": ["instructed_date"]}}]	9	1
68	2019-02-19 12:46:16.236674+00	7	Has paid the $15.00 Materials Fee for testing	2	[{"changed": {"fields": ["instructed_date"]}}]	9	1
69	2019-02-19 12:46:46.140286+00	2	Ready Stance “Choombee”	2	[{"changed": {"fields": ["pass_date", "instructed_date"]}}]	9	1
70	2019-02-19 12:46:59.478001+00	3	Front Stance“ApGubee sogee”	2	[{"changed": {"fields": ["pass_date", "instructed_date"]}}]	9	1
71	2019-02-19 12:47:13.829926+00	4	Attention Stance “Charyut”	2	[{"changed": {"fields": ["pass_date", "instructed_date"]}}]	9	1
72	2019-02-19 12:47:28.322288+00	5	Defensive Fighting Stance	2	[{"changed": {"fields": ["pass_date", "instructed_date"]}}]	9	1
73	2019-02-19 12:47:42.088759+00	6	Low Block“Ahray Mahkee”	2	[{"changed": {"fields": ["pass_date", "instructed_date"]}}]	9	1
74	2019-02-19 12:47:55.491769+00	7	Has paid the $15.00 Materials Fee for testing	2	[{"changed": {"fields": ["pass_date"]}}]	9	1
75	2019-02-19 12:48:11.672169+00	15	2. No laying on the floor unless asked to-- otherwise it is seen as a sign of disrespect;	2	[{"changed": {"fields": ["pass_date"]}}]	9	1
76	2019-02-19 12:49:29.768105+00	10	What is our Proof of Learning Curriculum and our Mastery Testing? (Adults and Children 10 years or older)	2	[{"changed": {"fields": ["pass_date"]}}]	20	1
77	2019-02-19 12:49:45.959902+00	2	KEEBON DONJAK IL (Horse Riding Stance w/Basic Hand Techniques)	2	[{"changed": {"fields": ["pass_date"]}}]	20	1
78	2019-02-19 12:50:13.788383+00	1	KEEBON DONJAK IL (Horse Riding Stance w/Basic Hand Techniques)	2	[{"changed": {"fields": ["pass_date"]}}]	20	1
79	2019-02-19 16:04:53.071292+00	8	manager	1	[{"added": {}}]	6	1
80	2019-02-19 16:05:33.885521+00	9	instructor	1	[{"added": {}}]	6	1
81	2019-02-19 16:13:03.965046+00	3	1	1	[{"added": {}}]	7	8
82	2019-02-19 16:13:15.178453+00	3	1	3		7	8
83	2019-02-19 16:15:37.527562+00	27	27	1	[{"added": {}}]	8	8
84	2019-02-19 16:16:03.028024+00	27	DND	2	[{"changed": {"fields": ["short", "name"]}}]	8	8
85	2019-02-19 16:17:09.200792+00	6	True	1	[{"added": {}}]	10	8
86	2019-02-19 16:22:08.792767+00	473	DND	1	[{"added": {}}]	11	8
87	2019-02-19 16:23:32.091362+00	519	ADULT WHITE BELT	1	[{"added": {}}]	12	8
88	2019-02-19 16:31:08.044505+00	20	DND	1	[{"added": {}}]	13	8
89	2019-02-19 16:31:22.178065+00	20	DND	3		13	8
90	2019-03-11 16:54:07.722471+00	10	manager_instructor	1	[{"added": {}}]	6	1
91	2019-03-11 16:54:26.628277+00	5	manager_instructor	1	[{"added": {}}]	14	1
92	2019-03-11 17:01:01.55109+00	11	hz	2	[{"changed": {"fields": ["username", "first", "middle", "last", "email", "birthdate"]}}]	6	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	structaq	user
7	structaq	answertype
8	structaq	challengetype
9	structaq	factstudentchallenge
10	structaq	factstudentcurriculum
11	structaq	featurechallenge
12	structaq	featurechallengecurriculum
13	structaq	featurecurriculum
14	structaq	featureinstructor
15	structaq	featureprogression
16	structaq	featurestudent
17	structaq	featurestudentprogression
18	structaq	maintable
19	thumbnail	kvstore
20	structaq	factstudentchallengehistory
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-02-08 13:36:49.514791+00
2	contenttypes	0002_remove_content_type_name	2019-02-08 13:36:49.52516+00
3	auth	0001_initial	2019-02-08 13:36:49.571347+00
4	auth	0002_alter_permission_name_max_length	2019-02-08 13:36:49.579189+00
5	auth	0003_alter_user_email_max_length	2019-02-08 13:36:49.586008+00
6	auth	0004_alter_user_username_opts	2019-02-08 13:36:49.592999+00
7	auth	0005_alter_user_last_login_null	2019-02-08 13:36:49.599569+00
8	auth	0006_require_contenttypes_0002	2019-02-08 13:36:49.601623+00
9	auth	0007_alter_validators_add_error_messages	2019-02-08 13:36:49.608278+00
10	auth	0008_alter_user_username_max_length	2019-02-08 13:36:49.61519+00
11	auth	0009_alter_user_last_name_max_length	2019-02-08 13:36:49.622448+00
16	sessions	0001_initial	2019-02-08 13:36:50.194717+00
17	structaq	0002_auto_20190208_1645	2019-02-08 16:45:52.410385+00
18	structaq	0003_auto_20190208_2021	2019-02-08 20:21:14.283783+00
19	thumbnail	0001_initial	2019-02-08 20:21:14.299216+00
20	structaq	0004_auto_20190212_1305	2019-02-12 13:05:28.27922+00
21	structaq	0005_auto_20190213_1847	2019-02-13 18:47:46.842606+00
22	structaq	0002_auto_20190218_1901	2019-02-18 19:01:59.083509+00
23	structaq	0003_auto_20190218_1902	2019-02-18 19:02:23.759527+00
24	structaq	0002_auto_20190218_1903	2019-02-18 19:03:41.29746+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
jmbmhtzbk6e7343xe2oigptq16oyj14z	NjJkZjFlMDMwNmM4N2ExMTQxZTlmZTE2YWRkZGFmNzg1OWU1MzU3ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NTdhNDNiMzc1MTViMTRkYzVlOWM4OTA4MTQ5MDliNDliYzk4MTBjIn0=	2019-02-22 13:38:12.756512+00
q0cse2dkj2jlvdpzf7zfqzxw87aqe8ud	NjJkZjFlMDMwNmM4N2ExMTQxZTlmZTE2YWRkZGFmNzg1OWU1MzU3ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NTdhNDNiMzc1MTViMTRkYzVlOWM4OTA4MTQ5MDliNDliYzk4MTBjIn0=	2019-02-22 16:55:16.979738+00
9yi6ta9f5b89tsipdferp28xm1gbznub	NjJkZjFlMDMwNmM4N2ExMTQxZTlmZTE2YWRkZGFmNzg1OWU1MzU3ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NTdhNDNiMzc1MTViMTRkYzVlOWM4OTA4MTQ5MDliNDliYzk4MTBjIn0=	2019-02-27 12:03:34.192544+00
a5lrfcegn80fa8knnxe7f8v8aiypyfni	NjJkZjFlMDMwNmM4N2ExMTQxZTlmZTE2YWRkZGFmNzg1OWU1MzU3ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NTdhNDNiMzc1MTViMTRkYzVlOWM4OTA4MTQ5MDliNDliYzk4MTBjIn0=	2019-03-01 15:46:57.854339+00
fif8jiz4rxm699d0d9zafug8nzzucnt9	NjJkZjFlMDMwNmM4N2ExMTQxZTlmZTE2YWRkZGFmNzg1OWU1MzU3ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NTdhNDNiMzc1MTViMTRkYzVlOWM4OTA4MTQ5MDliNDliYzk4MTBjIn0=	2019-03-04 12:27:43.377818+00
duaeam2ialbs9mdo2e6blzgbmvpv7z3i	NjJkZjFlMDMwNmM4N2ExMTQxZTlmZTE2YWRkZGFmNzg1OWU1MzU3ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NTdhNDNiMzc1MTViMTRkYzVlOWM4OTA4MTQ5MDliNDliYzk4MTBjIn0=	2019-03-04 15:17:05.25192+00
l2xoyw5xztt1yygtjjwdx4yy905z3dbt	NjJkZjFlMDMwNmM4N2ExMTQxZTlmZTE2YWRkZGFmNzg1OWU1MzU3ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NTdhNDNiMzc1MTViMTRkYzVlOWM4OTA4MTQ5MDliNDliYzk4MTBjIn0=	2019-03-04 19:04:50.148416+00
yjlv1m7zjiyhivh08n7qw25c2ay03541	ZGEwYjY2NDVlNjc0Yjk0MGZlOWE3MmQ5ZDQ4MjNiZmNkOGE2MWJiNzp7Il9hdXRoX3VzZXJfaWQiOiI4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkYmZhYWQwZjRmYzIwNzQyODQyZDMyNGUyMTc0YjIzZmRhNjZkOTk1In0=	2019-03-05 16:10:27.182923+00
a0tpny81we842b6zddfxf4lfp6gpbivj	NjJkZjFlMDMwNmM4N2ExMTQxZTlmZTE2YWRkZGFmNzg1OWU1MzU3ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NTdhNDNiMzc1MTViMTRkYzVlOWM4OTA4MTQ5MDliNDliYzk4MTBjIn0=	2019-03-06 10:15:55.925893+00
jkntfkdm426g7ztnxcxwc7mr8mo28mye	NjJkZjFlMDMwNmM4N2ExMTQxZTlmZTE2YWRkZGFmNzg1OWU1MzU3ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NTdhNDNiMzc1MTViMTRkYzVlOWM4OTA4MTQ5MDliNDliYzk4MTBjIn0=	2019-03-06 10:56:12.804133+00
fcb9bjzoemad185zy8er4d1c6z89l36i	ZGEwYjY2NDVlNjc0Yjk0MGZlOWE3MmQ5ZDQ4MjNiZmNkOGE2MWJiNzp7Il9hdXRoX3VzZXJfaWQiOiI4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkYmZhYWQwZjRmYzIwNzQyODQyZDMyNGUyMTc0YjIzZmRhNjZkOTk1In0=	2019-03-06 12:16:35.562042+00
nhx0s3zufetjbshw67hza6c279mfanep	ZGEwYjY2NDVlNjc0Yjk0MGZlOWE3MmQ5ZDQ4MjNiZmNkOGE2MWJiNzp7Il9hdXRoX3VzZXJfaWQiOiI4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkYmZhYWQwZjRmYzIwNzQyODQyZDMyNGUyMTc0YjIzZmRhNjZkOTk1In0=	2019-03-25 14:30:33.321473+00
d3m3mbj89s7cbpoelzr118h4qffyy8kk	NjJkZjFlMDMwNmM4N2ExMTQxZTlmZTE2YWRkZGFmNzg1OWU1MzU3ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NTdhNDNiMzc1MTViMTRkYzVlOWM4OTA4MTQ5MDliNDliYzk4MTBjIn0=	2019-03-25 16:31:34.122694+00
l3e418eaiwjtnyk5ss0w0om7u9q7kqkg	NjJkZjFlMDMwNmM4N2ExMTQxZTlmZTE2YWRkZGFmNzg1OWU1MzU3ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NTdhNDNiMzc1MTViMTRkYzVlOWM4OTA4MTQ5MDliNDliYzk4MTBjIn0=	2019-03-25 16:52:04.872498+00
\.


--
-- Data for Name: structaq_answertype; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.structaq_answertype (id, short, name) FROM stdin;
1	Pass or not	Pass or not
2	Score >= 3	Score >= 3
\.


--
-- Data for Name: structaq_challengetype; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.structaq_challengetype (id, short, name, "order") FROM stdin;
1	Stances	Stances	1
2	Blocks	Blocks	2
3	Hand Strikes	Hand Strikes	3
4	Kicks	Kicks	4
5	Falls/Rolls	Falls/Rolls	5
6	Philosophy	Philosophy	6
7	Rules for the dojang training area	Rules for the dojang training area	7
8	Grappling Techniques	Grappling Techniques	8
9	Forms	Forms	9
10	Self-Defense	Self-Defense	10
11	Sparring Techniques	Sparring Techniques	11
12	Free Sparring	Free Sparring	12
13	Breaking Techniques	Breaking Techniques	13
14	Grappling	Grappling	14
15	Falls/Rolls & Conditioning	Falls/Rolls & Conditioning	15
16	Sparring	Sparring	16
17	Form	Form	17
18	Physical Conditioning	Physical Conditioning	18
19	Physical & Mental Conditioning	Physical & Mental Conditioning	19
20	Terminology	Terminology	20
21	History	History	21
22	Neurobiological, Health & Psychological Benefits of Exercise & Martial Art Training	Neurobiological, Health & Psychological Benefits of Exercise & Martial Art Training	22
23	Leadership, Application & Critical Thinking	Leadership, Application & Critical Thinking	23
24	Philosophy, Accountability & Leadership	Philosophy, Accountability & Leadership	24
25	Discipline, Respect, Responsibility, Leadership, & Character Development	Discipline, Respect, Responsibility, Leadership, & Character Development	25
26	Minimum Mandatory Protective Gear	Minimum Mandatory Protective Gear	26
27	DND	DND	27
\.


--
-- Data for Name: structaq_factstudentchallenge; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.structaq_factstudentchallenge (id, startdate, enddate, passed, active, challenge_id, instructor_id, student_id, instructed, instructed_date, pass_date) FROM stdin;
17	2019-02-12 18:57:41+00	2020-02-12 18:06:15+00	\N	t	1	4	4	\N	\N	\N
8	2019-02-08 18:04:45.975633+00	2020-02-08 18:00:10.253906+00	t	t	96	4	1	t	2019-02-13 18:49:47.366894+00	2019-02-13 18:49:53.776373+00
14	2018-12-29 13:52:38+00	2018-12-29 13:52:38+00	\N	t	26	2	2	\N	\N	\N
20	2019-02-13 18:56:26.854342+00	2020-02-13 18:48:15.50677+00	\N	t	32	4	1	t	2019-02-13 18:56:26.856007+00	\N
11	2019-02-12 16:43:10+00	2020-02-12 13:03:29+00	t	t	27	4	1	t	2019-02-14 11:24:12.136069+00	2019-02-14 11:24:13.254869+00
21	2019-02-14 11:28:01+00	2020-02-13 18:48:15+00	t	t	38	4	1	t	2019-02-05 00:00:00+00	2019-02-14 11:28:01+00
18	2019-02-12 19:32:07+00	2020-02-12 18:06:15+00	f	t	31	4	1	t	2019-02-05 00:00:00+00	2019-02-04 04:00:00+00
19	2019-02-13 01:46:18+00	2020-02-12 18:06:15+00	t	t	52	4	1	t	2019-02-18 20:00:35.906302+00	2019-02-18 20:00:36.53673+00
16	2019-02-05 16:32:31+00	2020-02-05 16:32:16+00	t	t	65	4	3	t	2019-02-19 10:11:20.995179+00	2019-02-19 10:10:53.871969+00
22	2019-02-19 10:11:39.059048+00	2020-02-18 19:03:51.77067+00	t	t	74	4	3	t	2019-02-19 10:11:39.060539+00	2019-02-19 10:11:41.084748+00
23	2019-02-19 10:12:09.078245+00	2020-02-18 19:03:51.77067+00	\N	t	58	4	3	t	2019-02-19 10:12:30.623522+00	\N
24	2019-02-19 10:12:38.571913+00	2020-02-18 19:03:51.77067+00	\N	t	42	4	3	t	2019-02-19 10:12:52.501113+00	\N
25	2019-02-19 12:43:01.602666+00	2020-02-19 12:40:03.620659+00	t	t	50	4	3	t	2019-02-19 12:43:01.604172+00	2019-02-19 12:43:01.604165+00
13	2019-02-12 16:43:52+00	2020-02-12 13:03:29+00	t	t	29	4	1	t	2019-02-12 07:00:00+00	2019-02-12 07:00:00+00
10	2019-02-12 16:42:33+00	2020-02-12 13:03:29+00	t	t	28	4	1	t	2019-02-12 07:00:00+00	2019-02-12 07:00:00+00
12	2019-02-12 16:43:36+00	2020-02-12 13:03:29+00	t	t	30	4	1	t	2019-02-12 07:00:00+00	2019-02-12 07:00:00+00
9	2019-02-12 16:42:20+00	2020-02-12 13:03:29+00	t	t	26	4	1	t	2019-02-12 07:00:00+00	2019-02-14 11:17:54+00
2	2018-12-27 13:50:39+00	2018-12-27 13:50:39+00	f	t	2	1	2	t	2019-02-12 07:00:00+00	2019-02-12 07:00:00+00
3	2018-12-27 13:50:44+00	2018-12-27 13:50:44+00	f	t	4	1	2	t	2019-02-12 07:00:00+00	2019-02-12 07:00:00+00
4	2018-12-27 14:15:10+00	2018-12-27 14:15:10+00	t	t	1	1	2	t	2019-02-12 07:00:00+00	2019-02-12 07:00:00+00
5	2018-12-27 14:15:14+00	2018-12-27 14:15:14+00	f	t	5	1	2	t	2019-02-12 07:00:00+00	2019-02-12 07:00:00+00
6	2018-12-27 14:15:20+00	2018-12-27 14:15:20+00	t	t	6	1	2	t	2019-02-12 07:00:00+00	2019-02-12 07:00:00+00
15	2018-12-29 13:52:41+00	2018-12-29 13:52:41+00	f	t	27	2	2	t	2019-02-12 07:00:00+00	2019-02-12 07:00:00+00
7	2019-02-08 17:56:12+00	2020-02-08 17:32:38+00	t	t	42	4	1	t	2019-02-19 16:43:05.358599+00	2019-02-19 16:43:12.880421+00
26	2019-02-19 19:04:41.369633+00	2020-02-19 16:04:23.291047+00	\N	t	71	4	1	t	2019-02-19 19:04:41.371239+00	\N
27	2019-02-19 19:05:07.203081+00	2020-02-19 16:04:23.291047+00	t	t	72	4	1	t	2019-02-19 19:05:07.204583+00	2019-02-19 19:05:07.204576+00
28	2019-02-19 19:20:44.880793+00	2020-02-19 16:04:23.291047+00	t	t	57	4	1	t	2019-02-19 19:20:44.882385+00	2019-02-19 19:20:44.882378+00
29	2019-02-20 01:20:59.272805+00	2020-02-19 16:04:23.291047+00	t	t	73	4	1	t	2019-02-20 01:20:59.274372+00	2019-02-20 01:20:59.274365+00
31	2019-03-11 19:59:11.257819+00	2020-03-10 15:05:09.426696+00	\N	t	51	4	1	t	2019-03-11 19:59:11.259433+00	\N
32	2019-03-12 11:40:02.63256+00	2020-03-10 15:05:09.426696+00	t	t	79	4	1	t	2019-03-12 11:40:02.634065+00	2019-03-12 11:40:11.639599+00
\.


--
-- Data for Name: structaq_factstudentchallengehistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.structaq_factstudentchallengehistory (id, passed, pass_date, instructed, instructed_date, active, challenge_id, instructor_id, student_id, status_flag) FROM stdin;
3	t	2019-02-18 20:00:33.047164+00	t	2019-02-18 20:00:31.866709+00	t	52	4	1	passed
4	t	2019-02-18 20:00:33.047164+00	t	2019-02-18 20:00:33.937419+00	t	52	4	1	instructed
5	t	2019-02-18 20:00:34.799842+00	t	2019-02-18 20:00:33.937419+00	t	52	4	1	passed
6	t	2019-02-18 20:00:34.799842+00	t	2019-02-18 20:00:35.418321+00	t	52	4	1	instructed
7	t	2019-02-18 20:00:34.799842+00	t	2019-02-18 20:00:35.563238+00	t	52	4	1	instructed
8	t	2019-02-18 20:00:34.799842+00	t	2019-02-18 20:00:35.906302+00	t	52	4	1	instructed
9	t	2019-02-18 20:00:36.53673+00	t	2019-02-18 20:00:35.906302+00	t	52	4	1	passed
11	t	2019-02-19 10:10:53.871969+00	t	2019-02-19 10:10:51.899674+00	t	65	4	3	passed
12	t	2019-02-19 10:10:53.871969+00	t	2019-02-19 10:11:20.995179+00	t	65	4	3	instructed
13	\N	\N	t	2019-02-19 10:11:39.060539+00	t	74	4	3	instructed
14	t	2019-02-19 10:11:41.084748+00	t	2019-02-19 10:11:39.060539+00	t	74	4	3	passed
15	\N	\N	t	2019-02-19 10:12:09.079733+00	t	58	4	3	instructed
16	\N	\N	t	2019-02-19 10:12:30.623522+00	t	58	4	3	instructed
17	\N	\N	t	2019-02-19 10:12:38.573468+00	t	42	4	3	instructed
18	\N	\N	t	2019-02-19 10:12:52.501113+00	t	42	4	3	instructed
19	t	2019-02-19 12:43:01.604165+00	t	2019-02-19 12:43:01.604172+00	t	50	4	3	passed
10	t	2019-02-12 07:00:00+00	t	2019-02-19 10:10:51+00	t	65	4	3	instructed
2	t	2019-02-12 07:00:00+00	t	2019-02-18 20:00:31+00	t	52	4	1	instructed
1	t	2019-02-12 07:00:00+00	t	2019-02-18 20:00:30+00	t	52	4	1	instructed
20	f	2019-02-12 07:00:00+00	t	2019-02-19 16:43:05.358599+00	t	42	4	1	instructed
21	t	2019-02-19 16:43:12.880421+00	t	2019-02-19 16:43:05.358599+00	t	42	4	1	passed
22	\N	\N	t	2019-02-19 19:04:41.371239+00	t	71	4	1	instructed
23	t	2019-02-19 19:05:07.204576+00	t	2019-02-19 19:05:07.204583+00	t	72	4	1	passed
24	t	2019-02-19 19:20:44.882378+00	t	2019-02-19 19:20:44.882385+00	t	57	4	1	passed
25	t	2019-02-20 01:20:59.274365+00	t	2019-02-20 01:20:59.274372+00	t	73	4	1	passed
26	\N	\N	t	2019-03-11 19:59:11.259433+00	t	51	4	1	instructed
27	\N	\N	t	2019-03-12 11:40:02.634065+00	t	79	4	1	instructed
28	t	2019-03-12 11:40:11.639599+00	t	2019-03-12 11:40:02.634065+00	t	79	4	1	passed
\.


--
-- Data for Name: structaq_factstudentcurriculum; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.structaq_factstudentcurriculum (id, startdate, enddate, active, curriculum_id, progression_id, student_id) FROM stdin;
1	2018-07-09 00:00:00+00	2999-12-31 00:00:00+00	t	2	1	1
3	2018-07-09 00:00:00+00	2999-12-31 00:00:00+00	t	3	1	1
4	2019-02-12 18:35:48+00	2020-02-12 18:06:15+00	t	2	2	4
2	2018-07-02 00:00:00+00	2999-12-31 00:00:00+00	t	2	1	3
5	2019-02-04 18:52:27+00	2020-02-12 18:06:15+00	t	3	1	4
6	2019-02-19 16:16:44+00	2020-02-19 16:04:23+00	t	17	2	2
\.


--
-- Data for Name: structaq_featurechallenge; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.structaq_featurechallenge (id, short, name, "order", active, answer, answertype_id, challengetype_id, hints, hints_video) FROM stdin;
75	Inside Palm Block	Inside Palm Block	75	t		1	2	\N	\N
1	Attention Stance “Charyut”	Attention Stance “Charyut”	1	t		1	1	\N	\N
2	Ready Stance “Choombee”	Ready Stance “Choombee”	2	t		1	1	\N	\N
3	Horse Riding Stance“Ju-chume sogee”	Horse Riding Stance“Ju-chume sogee”	3	t		1	1	\N	\N
4	Front Stance“ApGubee sogee”	Front Stance“ApGubee sogee”	4	t		1	1	\N	\N
5	Defensive Fighting Stance	Defensive Fighting Stance	5	t		1	1	\N	\N
6	Low Block“Ahray Mahkee”	Low Block“Ahray Mahkee”	6	t		1	2	\N	\N
7	Inward Block “Ahn Mahkee”	Inward Block “Ahn Mahkee”	7	t		1	2	\N	\N
8	High Block “Ohgul Mahkee”	High Block “Ohgul Mahkee”	8	t		1	2	\N	\N
9	Outside Block “Bahkat Mahkee” (Note: Palm faces toward self)	Outside Block “Bahkat Mahkee” (Note: Palm faces toward self)	9	t		1	2	\N	\N
10	Outer Forearm Block “Bahkat Mahkee” (Note: palm faces toward attacker)	Outer Forearm Block “Bahkat Mahkee” (Note: palm faces toward attacker)	10	t		1	2	\N	\N
11	Straight Punches: Horizontal angle	Straight Punches: Horizontal angle	11	t		1	3	\N	\N
12	Straight Punches: Vertical angle	Straight Punches: Vertical angle	12	t		1	3	\N	\N
13	Palm (Note: must hit with lower palm area)	Palm (Note: must hit with lower palm area)	13	t		1	3	\N	\N
14	Hammer (Note: should be able to hit from any angle)	Hammer (Note: should be able to hit from any angle)	14	t		1	3	\N	\N
15	Spear: Horizontal	Spear: Horizontal	15	t		1	3	\N	\N
16	Spear: Vertical	Spear: Vertical	16	t		1	3	\N	\N
17	Claw: Eyes (adults only)	Claw: Eyes (adults only)	17	t		1	3	\N	\N
18	Claw: Throat (adults only)	Claw: Throat (adults only)	18	t		1	3	\N	\N
19	Front Snap Kick “Ahp Chagee” (Note: bend knee and pull toes back)	Front Snap Kick “Ahp Chagee” (Note: bend knee and pull toes back)	19	t		1	4	\N	\N
76	Boxing Block “Center of Body”	Boxing Block “Center of Body”	76	t		1	2	\N	\N
20	Push Kick “Mila Chagee” (Note: be able to hit with heel also, and three angles)	Push Kick “Mila Chagee” (Note: be able to hit with heel also, and three angles)	20	t		1	4	\N	\N
21	Side Kick “Yup Chagee” (Note: heel must be up)	Side Kick “Yup Chagee” (Note: heel must be up)	21	t		1	4	\N	\N
22	Back Kick “Dee Chagee” (Note: must hit with heel)	Back Kick “Dee Chagee” (Note: must hit with heel)	22	t		1	4	\N	\N
23	Round Kick “Ahp Dolryo Chagee” (Note: must hit with shin, instep, & ball of foot)	Round Kick “Ahp Dolryo Chagee” (Note: must hit with shin, instep, & ball of foot)	23	t		1	4	\N	\N
24	Learn a safe method of landing when pushed or thrown.	Learn a safe method of landing when pushed or thrown.	24	t		1	5	\N	\N
25	Knows that TZLC recycles the boards broken at testings & demos, paper, plastic and batteries. TZLC also offers incentives to its employees to bike, walk, or take public transportation to work.	Knows that TZLC recycles the boards broken at testings & demos, paper, plastic and batteries. TZLC also offers incentives to its employees to bike, walk, or take public transportation to work.	25	t	Answer: Why good environmental stewardship is important and give at least one example of good environmental stewardship.	1	6	\N	\N
26	1. Bow when entering & leaving;	1. Bow when entering & leaving;	26	t		2	7	\N	\N
27	2. No laying on the floor unless asked to-- otherwise it is seen as a sign of disrespect;	2. No laying on the floor unless asked to-- otherwise it is seen as a sign of disrespect;	27	t		2	7	\N	\N
28	3. Absolutely no bullying;	3. Absolutely no bullying;	28	t		2	7	\N	\N
29	4. Show respect at all times;	4. Show respect at all times;	29	t		2	7	\N	\N
30	5. Do not talk when the instructor is talking;	5. Do not talk when the instructor is talking;	30	t		2	7	\N	\N
31	6. No food or gum;	6. No food or gum;	31	t		2	7	\N	\N
32	7. No climbing on the targets;	7. No climbing on the targets;	32	t		2	7	\N	\N
33	8. Answer yes sir or yes mam;	8. Answer yes sir or yes mam;	33	t		2	7	\N	\N
34	9. Come to class with clean fingernails and toenails;	9. Come to class with clean fingernails and toenails;	34	t		2	7	\N	\N
35	10. No wrestling or horseplay;	10. No wrestling or horseplay;	35	t		2	7	\N	\N
36	11. Respect all people;	11. Respect all people;	36	t		2	7	\N	\N
37	12. Respect the training gear, weapons, and targets.	12. Respect the training gear, weapons, and targets.	37	t		2	7	\N	\N
38	Has curriculum folder	Has curriculum folder	38	t		1	25	\N	\N
39	Has attendance card with a picture	Has attendance card with a picture	39	t		1	25	\N	\N
40	Scans in every day that he or she trains.	Scans in every day that he or she trains.	40	t		1	25	\N	\N
41	Has received emails from us.	Has received emails from us.	41	t		1	25	\N	\N
42	Has paid the $15.00 Materials Fee for testing	Has paid the $15.00 Materials Fee for testing	42	t		1	25	\N	\N
43	Head	Head	43	t		1	26	\N	\N
44	Chest	Chest	44	t		1	26	\N	\N
45	Mouth Piece and case	Mouth Piece and case	45	t		1	26	\N	\N
46	Cloth forearm Protector	Cloth forearm Protector	46	t		1	26	\N	\N
47	Cloth shin/instep Protector	Cloth shin/instep Protector	47	t		1	26	\N	\N
48	Punches	Punches	48	t		1	26	\N	\N
49	Groin Protector (boys)	Groin Protector (boys)	49	t		1	26	\N	\N
50	Wrist escape	Wrist escape	50	t		1	8	\N	\N
51	BAL CHAGEE KEEBON DONJAK (Kicking Form)	BAL CHAGEE KEEBON DONJAK (Kicking Form)	51	t		1	9	\N	\N
52	KEEBON DONJAK IL (Horse Riding Stance w/Basic Hand Techniques)	KEEBON DONJAK IL (Horse Riding Stance w/Basic Hand Techniques)	52	t		1	9	\N	\N
53	Against a Punch	Against a Punch	53	t		1	10	\N	\N
54	Against a same-side Wrist Grab	Against a same-side Wrist Grab	54	t		1	10	\N	\N
55	Concept: to learn legal techniques and appropriate strategies for sport sparring.	Concept: to learn legal techniques and appropriate strategies for sport sparring.	55	t		1	11	\N	\N
106	Block & Punch counter	Block & Punch counter	106	t		1	11	\N	\N
56	Concept: a martial sport that improves focus, timing, speed, and confidence.	Concept: a martial sport that improves focus, timing, speed, and confidence.	56	t		1	12	\N	\N
57	Side kick	Side kick	57	t		1	13	\N	\N
58	Define "Tae Kwon Do"	Define "Tae Kwon Do" (Tae)	58	t	Tae = Foot	1	20	\N	\N
59	Define "Tae Kwon Do"	Define "Tae Kwon Do" (Kwon)	59	t	Kwon = Hand	1	20	\N	\N
60	Define "Tae Kwon Do"	Define "Tae Kwon Do" (Do)	60	t	Do = The Way of	1	20	\N	\N
61	Counting 1- 10: “Hana, Dool, Set, Net, Tasut, Yasut, Ilgup Yadul, Ahop, Yul”,	Counting 1- 10: “Hana, Dool, Set, Net, Tasut, Yasut, Ilgup Yadul, Ahop, Yul”,	61	t		1	20	\N	\N
62	Dojang = TKD school	Dojang = TKD school	62	t		1	20	\N	\N
63	Why is TKD considered a martial art?	Why is TKD considered a martial art?	63	t	Because it is something that combines self-defense with exercise and philosophy.	1	6	\N	\N
64	What is the difference between fighting and self-defense?	What is the difference between fighting and self-defense?	64	t	Fighting is the act of hurting another solely for purposes of anger or selfishness, and Self-defense is the act of stopping another from physically harming you.	1	6	\N	\N
65	What is our Proof of Learning Curriculum and our Mastery Testing? (Adults and Children 10 years or older)	What is our Proof of Learning Curriculum and our Mastery Testing? (Adults and Children 10 years or older)	65	t		1	6	\N	\N
66	From which country did TKD originate? 	From which country did TKD originate? 	66	t	Korea	1	21	\N	\N
67	Who is your Sabumnim? 	Who is your Sabumnim? 	67	t	Richard Hoehn	1	21	\N	\N
68	10 push-ups	10 push-ups	68	t		1	18	\N	\N
69	10 sit-ups	10 sit-ups	69	t		1	18	\N	\N
70	Is working on stretching and balance drills	Is working on stretching and balance drills	70	t		1	18	\N	\N
71	Bows upon entering & exiting training area to honor tradition, show respect & put oneself in the right mindset for training	Bows upon entering & exiting training area to honor tradition, show respect & put oneself in the right mindset for training	71	t		1	25	\N	\N
72	Scans in every day	Scans in every day	72	t		1	25	\N	\N
73	Has full uniform & can tie his/her belt	Has full uniform & can tie his/her belt	73	t		1	25	\N	\N
74	Has purchased min mandatory sparring gear	Has purchased min mandatory sparring gear	74	t		1	25	\N	\N
77	Boxing Block “Face”	Boxing Block “Face”	77	t		1	2	\N	\N
78	Boxing Block “Side of Head”	Boxing Block “Side of Head”	78	t		1	2	\N	\N
79	Boxing Block “Side of Body”	Boxing Block “Side of Body”	79	t		1	2	\N	\N
80	Jab-Reverse Punch combo	Jab-Reverse Punch combo	80	t		1	3	\N	\N
81	Knife-hand “downward”	Knife-hand “downward”	81	t		1	3	\N	\N
82	Knife-hand “inward”	Knife-hand “inward”	82	t		1	3	\N	\N
83	Knife-hand “outside”	Knife-hand “outside”	83	t		1	3	\N	\N
84	Elbow “forward”	Elbow “forward”	84	t		1	3	\N	\N
85	Elbow “backward”	Elbow “backward”	85	t		1	3	\N	\N
86	Elbow “up”	Elbow “up”	86	t		1	3	\N	\N
87	Elbow “downward”	Elbow “downward”	87	t		1	3	\N	\N
88	Axe Kick	Axe Kick	88	t		1	4	\N	\N
89	Inside Crescent Kick	Inside Crescent Kick	89	t		1	4	\N	\N
90	Outside Crescent	Outside Crescent	90	t		1	4	\N	\N
91	Stepping Push Kick	Stepping Push Kick	91	t		1	4	\N	\N
92	Stepping Round Kick	Stepping Round Kick	92	t		1	4	\N	\N
93	Stepping Side Kick	Stepping Side Kick	93	t		1	4	\N	\N
94	Two-handed back fall	Two-handed back fall	94	t		1	5	\N	\N
95	Knows we are a B Corp Certified business and what it stands for. Info can be found at: www.thezenlifecenter.com	Knows we are a B Corp Certified business and what it stands for. Info can be found at: www.thezenlifecenter.com	95	t	B Corps are for-profit companies certified by the nonprofit B Lab to meet rigorous and verifiable standards of social and environmental performance, accountability, and transparency. B Corps not only aspire to create and sustain profit and growth but to also create positive social and environmental impact.	1	6	\N	\N
96	Has attendance card with a picture and scans in each class.	Has attendance card with a picture and scans in each class.	96	t		1	25	\N	\N
97	Has looked up our website for more information on B Corps and how it relates to TZLC	Has looked up our website for more information on B Corps and how it relates to TZLC	97	t		1	6	\N	\N
98	Single wrist grab escapes	Single wrist grab escapes	98	t		1	14	\N	\N
99	Two handed wrist grab escapes	Two handed wrist grab escapes	99	t		1	14	\N	\N
100	Wrist lock takedowns	Wrist lock takedowns	100	t		1	14	\N	\N
101	Standing Armbars	Standing Armbars	101	t		1	14	\N	\N
102	Tae Guek IL Jang	Tae Guek IL Jang	102	t		1	9	\N	\N
103	Against a Punch with a step	Against a Punch with a step	103	t		1	10	\N	\N
104	Against any wrist grab	Against any wrist grab	104	t		1	10	\N	\N
137	Skipping side kick	Skipping side kick	137	t		1	4	\N	\N
138	Forward Roll	Forward Roll	138	t		1	15	\N	\N
139	Understands reasons and expectations for health & conditioning training	Understands reasons and expectations for health & conditioning training	139	t		1	15	\N	\N
140	Define Integrity and Honesty. Give examples and explain their importance.	Define Integrity and Honesty. Give examples and explain their importance.	140	t	“Integrity is always doing your best at what you promise even when no one else sees you doing it.”	1	6	\N	\N
141	Why is feedback from your body important? What are some examples of this?	Why is feedback from your body important? What are some examples of this?	141	t		1	6	\N	\N
142	Why is feedback from others important? What is a good way to give feedback & receive it?	Why is feedback from others important? What is a good way to give feedback & receive it?	142	t		1	6	\N	\N
143	Comes to class with proper uniform, belt and gear	Comes to class with proper uniform, belt and gear	143	t		1	25	\N	\N
144	Scans in for every class	Scans in for every class	144	t		1	25	\N	\N
107	Attack with Roundhouse kick	Attack with Roundhouse kick	107	t		1	11	\N	\N
145	Has current phone number and email on file and is receiving emails	Has current phone number and email on file and is receiving emails	145	t		1	25	\N	\N
146	Has listed at least one thing he/she or parent likes, enjoys or appreciates about TZLC, and at least one suggestion for improvement or one thing TZLC can do to add value on the back of this sheet	Has listed at least one thing he/she or parent likes, enjoys or appreciates about TZLC, and at least one suggestion for improvement or one thing TZLC can do to add value on the back of this sheet	146	t		1	25	\N	\N
147	Leg Takedownp	Leg Takedownp	147	t		1	14	\N	\N
148	Leg sweep	Leg sweep	148	t		1	14	\N	\N
149	Hip throw	Hip throw	149	t		1	14	\N	\N
150	Shoulder throw	Shoulder throw	150	t		1	14	\N	\N
151	Tae Guek EE Jang	Tae Guek EE Jang	151	t		1	9	\N	\N
152	Against Reverse punch	Against Reverse punch	152	t		1	10	\N	\N
153	All shirt grab	All shirt grab	153	t		1	10	\N	\N
154	Round kick counter	Round kick counter	154	t		1	11	\N	\N
155	Slide back Round kick counters	Slide back Round kick counters	155	t		1	11	\N	\N
156	Medium contact to body with optional light head contact	Medium contact to body with optional light head contact	156	t		1	12	\N	\N
157	Round kick	Round kick	157	t		1	13	\N	\N
158	Counting 21-30 “SirRun”	Counting 21-30 “SirRun”	158	t		1	20	\N	\N
159	Kamsahamneeda= Thank you	Kamsahamneeda= Thank you	159	t		1	20	\N	\N
160	What happens to your body and mind when you feel stress or anger?	What happens to your body and mind when you feel stress or anger?	160	t		1	6	\N	\N
161	What is meditation and how does it help you?	What is meditation and how does it help you?	161	t		1	6	\N	\N
162	What are some other ways to change your “state” to reduce stress, anxiety, and anger?	What are some other ways to change your “state” to reduce stress, anxiety, and anger?	162	t	In addition to meditating, one can change their physiological state through movement, exercise, doing something unexpected, doing something playful, drinking water, eating healthy, being kind, surrounding self with good support system, getting enough sleep, setting goals with measureable outcomes, etc.	1	6	\N	\N
163	Name some martial artists who had a significant influence in the development of TKD? Example: Jhoon Rhee helped to bring TKD to America.	Name some martial artists who had a significant influence in the development of TKD? Example: Jhoon Rhee helped to bring TKD to America.	163	t		1	21	\N	\N
164	20 Push-ups	20 Push-ups	164	t		1	19	\N	\N
165	20 Sit-ups	20 Sit-ups	165	t		1	19	\N	\N
166	Can sit still with eyes closed and breathe in deeply through nose, hold breath for a count of 3, and then breathe out slowly through the mouth, then repeat two more times.	Can sit still with eyes closed and breathe in deeply through nose, hold breath for a count of 3, and then breathe out slowly through the mouth, then repeat two more times.	166	t		1	19	\N	\N
167	Displays good martial arts behavior. For example: answers “yes, sir” or “yes, ma’am”	Displays good martial arts behavior. For example: answers “yes, sir” or “yes, ma’am”	167	t		1	25	\N	\N
168	Children: good behavior and grades at school and at home.	Children: good behavior and grades at school and at home.	168	t		1	25	\N	\N
169	Children must also know parent’s name, address and telephone number	Children must also know parent’s name, address and telephone number	169	t		1	25	\N	\N
170	Displays Good Environmental Stewardship	Displays Good Environmental Stewardship	170	t		1	25	\N	\N
171	Back Stance	Back Stance	171	t		1	1	\N	\N
172	High Knife-hand Block	High Knife-hand Block	172	t		1	2	\N	\N
173	Low Knife-hand Block	Low Knife-hand Block	173	t		1	2	\N	\N
174	Outside Knife-hand Block	Outside Knife-hand Block	174	t		1	2	\N	\N
175	Inside Knife-hand Block	Inside Knife-hand Block	175	t		1	2	\N	\N
176	Uppercut punch to body	Uppercut punch to body	176	t		1	3	\N	\N
177	Uppercut punch to head	Uppercut punch to head	177	t		1	3	\N	\N
178	Arch Hand	Arch Hand	178	t		1	3	\N	\N
179	Forward Head Strike	Forward Head Strike	179	t		1	3	\N	\N
180	Backward Head Strike	Backward Head Strike	180	t		1	3	\N	\N
181	Sliding Push Kick	Sliding Push Kick	181	t		1	4	\N	\N
182	Sliding Side Kick	Sliding Side Kick	182	t		1	4	\N	\N
183	Sliding Round Kick	Sliding Round Kick	183	t		1	4	\N	\N
184	Jump front Kick with front leg	Jump front Kick with front leg	184	t		1	4	\N	\N
216	Has improved stretching & balancing	Has improved stretching & balancing	216	t		1	18	\N	\N
217	Displays good environmental stewardship	Displays good environmental stewardship	217	t		1	25	\N	\N
218	Augmented/Double Knife-hand Block low	Augmented/Double Knife-hand Block low	218	t		1	2	\N	\N
219	Augmented/Double Knife-hand Block middle	Augmented/Double Knife-hand Block middle	219	t		1	2	\N	\N
220	Pressing Palm Block	Pressing Palm Block	220	t		1	2	\N	\N
221	Ridge-hand Strike horizontal	Ridge-hand Strike horizontal	221	t		1	3	\N	\N
222	Ridge-hand Strike downward	Ridge-hand Strike downward	222	t		1	3	\N	\N
223	Ridge-hand Strike upward	Ridge-hand Strike upward	223	t		1	3	\N	\N
224	Turning Hammer-fist with no step	Turning Hammer-fist with no step	224	t		1	3	\N	\N
225	Turning Hammer-fist with step	Turning Hammer-fist with step	225	t		1	3	\N	\N
226	Step Turning Back Kick	Step Turning Back Kick	226	t		1	4	\N	\N
227	Turning Step Inside Crescent Kick	Turning Step Inside Crescent Kick	227	t		1	4	\N	\N
228	Turning Step Round Kick	Turning Step Round Kick	228	t		1	4	\N	\N
229	Jump Inside Crescent Kick with front leg	Jump Inside Crescent Kick with front leg	229	t		1	4	\N	\N
230	Jump Inside Crescent Kick with back leg	Jump Inside Crescent Kick with back leg	230	t		1	4	\N	\N
231	Jump Round Kick with front leg	Jump Round Kick with front leg	231	t		1	4	\N	\N
105	Can name the different styles of sparring we do at TZLC & why we do them	Can name the different styles of sparring we do at TZLC & why we do them	105	t		1	11	\N	\N
108	Light contact, body only, but must wear all sparring gear.	Light contact, body only, but must wear all sparring gear.	108	t		1	12	\N	\N
109	Front snap Kick	Front snap Kick	109	t		1	13	\N	\N
110	Counting 11-20 “SaMul”	Counting 11-20 “SaMul”	110	t		1	20	\N	\N
111	Dobok =Uniform & Dee =Belt	Dobok =Uniform & Dee =Belt	111	t		1	20	\N	\N
112	Define courtesy and respect. Give examples and explain their importance. “Respect is true care for Yes or no	Define courtesy and respect. Give examples and explain their importance. “Respect is true care for Yes or no	112	t		1	6	\N	\N
232	Jump Round Kick with back leg	Jump Round Kick with back leg	232	t		1	4	\N	\N
284	Has been working on improving stretching and balancing skills	Has been working on improving stretching and balancing skills	284	t		1	15	\N	\N
289	Leg Grab and Sweep	Leg Grab and Sweep	289	t		1	14	\N	\N
113	1. Knows that the month of September is The Zen Life Center’s Appreciation Month where our dojang family is encouraged to show gratitude to each other (Demonstrate gratitude and appreciation to students, parents and staff);	1. Knows that the month of September is The Zen Life Center’s Appreciation Month where our dojang family is encouraged to show gratitude to each other (Demonstrate gratitude and appreciation to students, parents and staff);	113	t		1	6	\N	\N
114	2. Knows why this is important to TZLC;	2. Knows why this is important to TZLC;	114	t		1	6	\N	\N
115	3. Can give examples of simple ways to show gratitude.	3. Can give examples of simple ways to show gratitude.	115	t	Research in psychology has shown that gratitude is strongly and consistently associated with greater happiness. Gratitude helps people feel more positive emotions, relish good experiences, improve their health, recover quicker from setbacks and difficult situations, deal with adversity, and build strong relationships.	1	6	\N	\N
116	Explain the symbolism of the U.S. and Korean Flags.	Explain the symbolism of the U.S. and Korean Flags.	116	t	The center symbol is the TaeGuek which represents the balance of the universe. Three solid bars = Heaven; three broken bars = Earth; three bars with one broken bar = fire; three bars with two broken bars = water.	1	21	\N	\N
117	15 Push-ups	15 Push-ups	117	t		1	18	\N	\N
118	15 Sit-ups	15 Sit-ups	118	t		1	18	\N	\N
119	Is practicing stretching and balancing	Is practicing stretching and balancing	119	t		1	18	\N	\N
120	List three things you are thankful for and how you show gratitude for these things on the back of this sheet.	List three things you are thankful for and how you show gratitude for these things on the back of this sheet.	120	t		1	25	\N	\N
121	Kneeling Stance	Kneeling Stance	121	t		1	1	\N	\N
122	Ground-fighting Stance	Ground-fighting Stance	122	t		1	1	\N	\N
123	Push kick Block	Push kick Block	123	t		1	2	\N	\N
124	Crescent kick Blocks	Crescent kick Blocks	124	t		1	2	\N	\N
125	Shin Block	Shin Block	125	t		1	2	\N	\N
126	Hook Punch	Hook Punch	126	t		1	3	\N	\N
127	Inner Forearm Strike	Inner Forearm Strike	127	t		1	3	\N	\N
128	Outer Forearm Strike	Outer Forearm Strike	128	t		1	3	\N	\N
129	Upward Knee strike	Upward Knee strike	129	t		1	4	\N	\N
130	Roundhouse Knee strike	Roundhouse Knee strike	130	t		1	4	\N	\N
131	Thrusting Knee strike	Thrusting Knee strike	131	t		1	4	\N	\N
132	Ground kicks	Ground kicks	132	t		1	4	\N	\N
133	Kneeling kicks	Kneeling kicks	133	t		1	4	\N	\N
134	Turning back kick	Turning back kick	134	t		1	4	\N	\N
135	Skipping push kick	Skipping push kick	135	t		1	4	\N	\N
136	Skipping round kick	Skipping round kick	136	t		1	4	\N	\N
185	Jump front Kick with back leg	Jump front Kick with back leg	185	t		1	4	\N	\N
186	Single arm side fall	Single arm side fall	186	t		1	15	\N	\N
187	Has curriculum folder and attendance card with a picture.	Has curriculum folder and attendance card with a picture.	187	t		1	15	\N	\N
188	Has full uniform and can tie belt.	Has full uniform and can tie belt.	188	t		1	15	\N	\N
189	Has all sparring gear: mouthpiece, head, face, chest, arms, hands, legs, and cup.	Has all sparring gear: mouthpiece, head, face, chest, arms, hands, legs, and cup.	189	t		1	15	\N	\N
190	Can jog or speed walk ½ a mile	Can jog or speed walk ½ a mile	190	t		1	15	\N	\N
243	Arm leverage on the elbow	Arm leverage on the elbow	243	t		1	14	\N	\N
191	1 of 2 Know: TZLC believes in community involvement and contribution.	1 of 2 Know: TZLC believes in community involvement and contribution.	191	t	TZLC pays its employees to volunteer for nonprofits in our community and welcomes all students to participate with them.	1	6	\N	\N
192	2 of 2 Know: TZLC believes in community involvement and contribution.	2 of 2 Know: TZLC believes in community involvement and contribution.	192	t	(2) TZLC provides 3 full Black Belt Scholarships, along with a uniform and full set of gear, to 3 students per year who have come from impoverished backgrounds or hardship.	1	6	\N	\N
193	Has shown courtesy, concern, modeling or mentorship to a peer or lower belt.	Has shown courtesy, concern, modeling or mentorship to a peer or lower belt.	193	t		1	25	\N	\N
194	Finger Lock	Finger Lock	194	t		1	14	\N	\N
195	Bear Hug Takedown	Bear Hug Takedown	195	t		1	14	\N	\N
196	Knee Bar	Knee Bar	196	t		1	14	\N	\N
197	Tae Guek Sam Jang	Tae Guek Sam Jang	197	t		1	9	\N	\N
198	Against Jab punch	Against Jab punch	198	t		1	10	\N	\N
199	Bear-hug from front under the arms	Bear-hug from front under the arms	199	t		1	10	\N	\N
200	Bear-hug from front over the arms	Bear-hug from front over the arms	200	t		1	10	\N	\N
201	Bear-hug from back under the arms	Bear-hug from back under the arms	201	t		1	10	\N	\N
202	Bear-hug from back over the arms	Bear-hug from back over the arms	202	t		1	10	\N	\N
203	Punch then Round kick counter Free Sparring	Punch then Round kick counter Free Sparring	203	t		1	11	\N	\N
204	Medium to body with optional light head contact	Medium to body with optional light head contact	204	t		1	11	\N	\N
205	Turning Back kick	Turning Back kick	205	t		1	13	\N	\N
206	Counting 31-40 “Mau Un”	Counting 31-40 “Mau Un”	206	t		1	20	\N	\N
207	AnYungHashNeeMeeka = Hello	AnYungHashNeeMeeka = Hello	207	t		1	20	\N	\N
208	Define Self-Control and Self-Discipline. Give examples and explain their importance. 	Define Self-Control and Self-Discipline. Give examples and explain their importance. 	208	t	“Self-Control is being responsible for your actions and it keeps you out of trouble. Self-discipline is doing positive actions on your own, without having to be told every time - it makes you successful.	1	6	\N	\N
209	What is the WTF = World TKD Federation	What is the WTF = World TKD Federation	209	t		1	21	\N	\N
210	ITF = International TKD Federation	ITF = International TKD Federation	210	t		1	21	\N	\N
211	USATKD = United States Tae Kwon Do	USATKD = United States Tae Kwon Do	211	t		1	21	\N	\N
212	Name the first B Corp Certified Martial Art School in the World. Give an example of what we are doing different	Name the first B Corp Certified Martial Art School in the World. Give an example of what we are doing different	212	t		1	21	\N	\N
213	25 Push-ups	25 Push-ups	213	t		1	18	\N	\N
214	25 Sit-ups	25 Sit-ups	214	t		1	18	\N	\N
215	Can jog or speed walk for half a mile	Can jog or speed walk for half a mile	215	t		1	18	\N	\N
233	Define Perseverance and Dedication. Give examples and explain their importance.	Define Perseverance and Dedication. Give examples and explain their importance.	233	t	“Dedication means that you keep doing something or stay with someone/something; Perseverance means that you keep going until you succeed, even though the task is difficult.”	1	6	\N	\N
234	Please Answer: How do you set a goal and achieve it?	Please Answer: How do you set a goal and achieve it?	234	t		1	6	\N	\N
235	Please Answer: Why is the journey to a goal as important as achieving the goal?	Please Answer: Why is the journey to a goal as important as achieving the goal?	235	t		1	6	\N	\N
236	Give a personal example of a goal you have achieved and something you learned or gained as you worked toward your goal.	Give a personal example of a goal you have achieved and something you learned or gained as you worked toward your goal.	236	t		1	6	\N	\N
237	Please Answer: What is mental flexibility and why is it important?	Please Answer: What is mental flexibility and why is it important?	237	t		1	6	\N	\N
238	Forward Roll with slap	Forward Roll with slap	238	t		1	15	\N	\N
239	Can jog or speed walk 1 mile	Can jog or speed walk 1 mile	239	t		1	15	\N	\N
240	Knows why keeping a flexible body is important.	Knows why keeping a flexible body is important.	240	t		1	15	\N	\N
241	Has benchmarked/measured leg flexibility. Has written a description of his or her flexibility level with a realistic goal for next belt testing on the back of this sheet:	Has benchmarked/measured leg flexibility. Has written a description of his or her flexibility level with a realistic goal for next belt testing on the back of this sheet:	241	t		1	15	\N	\N
242	Write one goal associated to TZLC, in addition to your stretching goal, with a plan to achieve it on the back of this sheet.	Write one goal associated to TZLC, in addition to your stretching goal, with a plan to achieve it on the back of this sheet.	242	t		1	25	\N	\N
244	Arm leverage on the shoulder	Arm leverage on the shoulder	244	t		1	14	\N	\N
245	Tae Geuk Sa Jang	Tae Geuk Sa Jang	245	t		1	9	\N	\N
246	Hook punch to the body	Hook punch to the body	246	t		1	10	\N	\N
247	Hook punch to the head while stepping	Hook punch to the head while stepping	247	t		1	10	\N	\N
248	Hook punch to the head with no step	Hook punch to the head with no step	248	t		1	10	\N	\N
249	Side Head Lock	Side Head Lock	249	t		1	10	\N	\N
250	Front kick	Front kick	250	t		1	10	\N	\N
251	Turning Back kick counter	Turning Back kick counter	251	t		1	11	\N	\N
252	3 Basic Fake motions	3 Basic Fake motions	252	t		1	11	\N	\N
253	Medium body with optional light contact to head Breaking Techniques	Medium body with optional light contact to head Breaking Techniques	253	t		1	12	\N	\N
254	Hammer-fist Strike	Hammer-fist Strike	254	t		1	12	\N	\N
255	Jump Front Kick	Jump Front Kick	255	t		1	12	\N	\N
256	Counting 41-50 “She Un” KukiyaeKungyae = Bow to the flags	Counting 41-50 “She Un” KukiyaeKungyae = Bow to the flags	256	t		1	20	\N	\N
257	Define the Golden Rule and give an example on the back of this form.	Define the Golden Rule and give an example on the back of this form.	257	t	The Golden Rule states that we should treat others as we would like others to treat us , and to not treat others in ways that we would not like to be treated ourselves. It also states that what we wish upon others, we wish upon ourselves.	1	6	\N	\N
258	Define the Platinum Rule and give an example on the back of this form.	Define the Platinum Rule and give an example on the back of this form.	258	t	The Platinum Rule states that we should treat people how THEY want to be treated. The Platinum Rule recognizes that we are all human and asks us to not only treat others the way we would like to be treated, but to also go above and beyond this, to recognize and respect that people may think, feel and value things differently than we do.	1	6	\N	\N
259	Why were the martial arts developed and how have they evolved?	Why were the martial arts developed and how have they evolved?	259	t	First, it was used only as a systematic method of effective self protection. Later, techniques were improved & new ones added. It also became a method of exercise, sport, and a means of enlightenment.	1	21	\N	\N
260	30 Push-ups	30 Push-ups	260	t		1	18	\N	\N
261	30 Sit-ups	30 Sit-ups	261	t		1	18	\N	\N
262	Can jog or speed walk at least 1 mile	Can jog or speed walk at least 1 mile	262	t		1	18	\N	\N
263	Has achieved stretching goal stated on the back of their last curriculum.	Has achieved stretching goal stated on the back of their last curriculum.	263	t		1	18	\N	\N
264	Open Stance	Open Stance	264	t		1	1	\N	\N
265	Cross-arm Block (using low block and inside palm block together)	Cross-arm Block (using low block and inside palm block together)	265	t		1	2	\N	\N
266	Cross-arm Block (using low knife-hand block and inside palm block together)	Cross-arm Block (using low knife-hand block and inside palm block together)	266	t		1	2	\N	\N
267	Cross-arm Block (using low palm block and inside palm block together)	Cross-arm Block (using low palm block and inside palm block together)	267	t		1	2	\N	\N
268	Back-fist Strike downward	Back-fist Strike downward	268	t		1	3	\N	\N
269	Back-fist Strike horizontal	Back-fist Strike horizontal	269	t		1	3	\N	\N
270	Turning Back-fist without step	Turning Back-fist without step	270	t		1	3	\N	\N
271	Turning Back-fist with step	Turning Back-fist with step	271	t		1	3	\N	\N
272	Turning Knife-hand Strike without step	Turning Knife-hand Strike without step	272	t		1	3	\N	\N
273	Turning Knife-hand Strike with step	Turning Knife-hand Strike with step	273	t		1	3	\N	\N
274	Hook kick with back leg	Hook kick with back leg	274	t		1	4	\N	\N
275	Hook kick with front leg	Hook kick with front leg	275	t		1	4	\N	\N
276	Stepping Hook Kick	Stepping Hook Kick	276	t		1	4	\N	\N
277	Skipping Hook Kick	Skipping Hook Kick	277	t		1	4	\N	\N
278	Jump Side kicks using front leg	Jump Side kicks using front leg	278	t		1	4	\N	\N
279	Jump Side kick using back leg	Jump Side kick using back leg	279	t		1	4	\N	\N
280	Spinning Outside Crescent	Spinning Outside Crescent	280	t		1	4	\N	\N
281	Has demonstrated White Belt-Orange Belt Forms consecutively	Has demonstrated White Belt-Orange Belt Forms consecutively	281	t		1	9	\N	\N
282	Front falls	Front falls	282	t		1	15	\N	\N
283	Can jog, run or Speed walk (if have a physical limitation) at least 1.5 miles	Can jog, run or Speed walk (if have a physical limitation) at least 1.5 miles	283	t		1	15	\N	\N
288	Neck leverage	Neck leverage	288	t		1	14	\N	\N
285	Can name the five tenants of TaeKwonDo and has written them, with one example for each, on the back of this form.	Can name the five tenants of TaeKwonDo and has written them, with one example for each, on the back of this form.	285	t		1	6	\N	\N
286	Has written at least one thing he/she or parent appreciates about TZLC and at least one suggestion to improve TZLC on the back of this form.	Has written at least one thing he/she or parent appreciates about TZLC and at least one suggestion to improve TZLC on the back of this form.	286	t		1	25	\N	\N
287	Has been receiving our emails.	Has been receiving our emails.	287	t		1	25	\N	\N
290	Front Guillotine Choke	Front Guillotine Choke	290	t		1	14	\N	\N
291	Guard	Guard	291	t		1	14	\N	\N
292	Leg or Ankle Lock	Leg or Ankle Lock	292	t		1	14	\N	\N
293	Tae Geuk Oh Jang	Tae Geuk Oh Jang	293	t		1	9	\N	\N
294	against Round kicks low,	against Round kicks low,	294	t		1	10	\N	\N
295	Round Kick middle,	Round Kick middle,	295	t		1	10	\N	\N
296	Round Kick high	Round Kick high	296	t		1	10	\N	\N
297	Tackle from a distance,	Tackle from a distance,	297	t		1	10	\N	\N
298	Tackle from up close	Tackle from up close	298	t		1	10	\N	\N
299	Leg grab, 	Leg grab, 	299	t		1	10	\N	\N
300	Leg grab with takedown	Leg grab with takedown	300	t		1	10	\N	\N
301	Head Kicks	Head Kicks	301	t		1	11	\N	\N
302	Avoidance of Head Kicks	Avoidance of Head Kicks	302	t		1	11	\N	\N
303	Medium body contact, optional light head contact	Medium body contact, optional light head contact	303	t		1	12	\N	\N
304	Elbow Strike	Elbow Strike	304	t		1	13	\N	\N
305	Jump Round Kick	Jump Round Kick	305	t		1	13	\N	\N
306	Counting 51-60 “Eh Soon	Counting 51-60 “Eh Soon	306	t		1	20	\N	\N
307	SunbaeNim = higher belt,	SunbaeNim = higher belt,	307	t		1	20	\N	\N
308	KyosaNim= Instructor,	KyosaNim= Instructor,	308	t		1	20	\N	\N
309	KyobomNim = Master-Instructor,	KyobomNim = Master-Instructor,	309	t		1	20	\N	\N
310	SabomNim = Master,	SabomNim = Master,	310	t		1	20	\N	\N
311	KwanjangNim = Grandmaster )	KwanjangNim = Grandmaster )	311	t		1	20	\N	\N
312	Please answer: What is bullying? What are some ways to deal with bullying personally or to help someone else who is being bullied? Write your answers on the back of this form	Please answer: What is bullying? What are some ways to deal with bullying personally or to help someone else who is being bullied? Write your answers on the back of this form	312	t		1	6	\N	\N
313	When did sport TKD become an Official Olympic Event?.	When did sport TKD become an Official Olympic Event?.	313	t	The year 2000	1	21	\N	\N
314	Name a U.S. Athlete who has won a gold medal in the Olympics?	Name a U.S. Athlete who has won a gold medal in the Olympics?	314	t	Possible answers: Steven Lopez, Herb Perez, Lynette Love, Arline Limas	1	21	\N	\N
315	Name an Athlete who won gold at US Nationals for Forms, Sparring, Weapons or Breaking?	Name an Athlete who won gold at US Nationals for Forms, Sparring, Weapons or Breaking?	315	t	Possible answers: Richard Hoehn, and any of the above mentioned athletes.	1	21	\N	\N
316	40 Push-ups	40 Push-ups	316	t		1	19	\N	\N
317	40 Sit-ups,	40 Sit-ups,	317	t		1	19	\N	\N
318	Has improved stretching,	Has improved stretching,	318	t		1	19	\N	\N
319	Can hold a 20 second plank	Can hold a 20 second plank	319	t		1	19	\N	\N
320	Can demonstrate 3 cycle breathing meditation.	Can demonstrate 3 cycle breathing meditation.	320	t		1	19	\N	\N
321	Has full gear and wears it when needed	Has full gear and wears it when needed	321	t		1	25	\N	\N
322	Can name and has written at least two upcoming ZLC events on the back of this sheet.	Can name and has written at least two upcoming ZLC events on the back of this sheet.	322	t		1	25	\N	\N
323	X-stance	X-stance	323	t		1	1	\N	\N
324	Twin Low Block	Twin Low Block	324	t		1	2	\N	\N
325	Twin High Block	Twin High Block	325	t		1	2	\N	\N
326	Diamond Block (using outer forearm block and high block together)	Diamond Block (using outer forearm block and high block together)	326	t		1	2	\N	\N
327	Diamond Block (using outside block and high block)	Diamond Block (using outside block and high block)	327	t		1	2	\N	\N
328	One-knuckle Thumb Spike Strike	One-knuckle Thumb Spike Strike	328	t		1	3	\N	\N
329	One-knuckle Strike	One-knuckle Strike	329	t		1	3	\N	\N
330	One-knuckle “Phoenix” Strike	One-knuckle “Phoenix” Strike	330	t		1	3	\N	\N
331	Four-knuckles “Leopard’s or Bear Paw” Strike	Four-knuckles “Leopard’s or Bear Paw” Strike	331	t		1	3	\N	\N
332	Jump Turning Back Kick (Kicks)	Jump Turning Back Kick (Kicks)	332	t		1	4	\N	\N
333	Jump Double Round Kick	Jump Double Round Kick	333	t		1	4	\N	\N
334	Turning Jump Inside Crescent Kick	Turning Jump Inside Crescent Kick	334	t		1	4	\N	\N
335	Spinning Hook Kick	Spinning Hook Kick	335	t		1	4	\N	\N
336	Step Spinning Hook Kick	Step Spinning Hook Kick	336	t		1	4	\N	\N
337	Demonstrate one minute of light sparring in three styles	Demonstrate one minute of light sparring in three styles	337	t		1	16	\N	\N
338	Backwards roll	Backwards roll	338	t		1	15	\N	\N
339	Can jog, run or speed walk (if has physical limitation) at least 2 miles.	Can jog, run or speed walk (if has physical limitation) at least 2 miles.	339	t		1	15	\N	\N
340	Has improved flexibility	Has improved flexibility	340	t		1	15	\N	\N
341	Can do 45 pushups & 45 sit ups, hold a plank for 30 seconds, can balance on each leg while other leg’s knee is raised to the navel area for 15 seconds	Can do 45 pushups & 45 sit ups, hold a plank for 30 seconds, can balance on each leg while other leg’s knee is raised to the navel area for 15 seconds	341	t		1	15	\N	\N
342	Has listed one neurobiological, one health & one psychological benefit of exercise/martial art training on the back of this curriculum	Has listed one neurobiological, one health & one psychological benefit of exercise/martial art training on the back of this curriculum	342	t		1	22	\N	\N
343	Knows TZLC is a B Corp business and knows what that means. Info can be found at: www.thezenlifecenter.com	Knows TZLC is a B Corp business and knows what that means. Info can be found at: www.thezenlifecenter.com	343	t	B Corps are for-profit companies certified by the nonprofit B Lab to meet rigorous and verifiable standards of social and environmental performance, accountability, and transparency. B Corps not only aspire to create and sustain profit and growth but also to create positive social and environmental impact.	1	6	\N	\N
344	Can sit still in meditation for three minutes while controlling breathing.	Can sit still in meditation for three minutes while controlling breathing.	344	t		1	25	\N	\N
345	Has lead warm up exercises	Has lead warm up exercises	345	t		1	25	\N	\N
346	Has mentored or assisted peers or lower belts in classes	Has mentored or assisted peers or lower belts in classes	346	t		1	25	\N	\N
347	Has listed 1 thing he/she/parent really likes about TZLC & 1 suggestion on the back of this sheet	Has listed 1 thing he/she/parent really likes about TZLC & 1 suggestion on the back of this sheet	347	t		1	25	\N	\N
348	Rear Choke (Air)	Rear Choke (Air)	348	t		1	14	\N	\N
349	Rear Choke (Blood)	Rear Choke (Blood)	349	t		1	14	\N	\N
350	Shoulder/arm Lock	Shoulder/arm Lock	350	t		1	14	\N	\N
351	Stomp Takedown	Stomp Takedown	351	t		1	14	\N	\N
352	Tae Geuk Yuk Jang	Tae Geuk Yuk Jang	352	t		1	9	\N	\N
353	Against Side Kick	Against Side Kick	353	t		1	10	\N	\N
354	Arm holds from behind	Arm holds from behind	354	t		1	10	\N	\N
355	Hair grabs from front	Hair grabs from front	355	t		1	10	\N	\N
356	Hair grab from behind	Hair grab from behind	356	t		1	10	\N	\N
357	Double jump round kick	Double jump round kick	357	t		1	11	\N	\N
358	Medium body contact with optional light head contact in full sparring gear.	Medium body contact with optional light head contact in full sparring gear.	358	t		1	12	\N	\N
359	Palm Strike Jump Side Kick	Palm Strike Jump Side Kick	359	t		1	13	\N	\N
360	Counting 61-70 “IL Hun,	Counting 61-70 “IL Hun,	360	t		1	20	\N	\N
361	Poomsae = form/pattern,	Poomsae = form/pattern,	361	t		1	20	\N	\N
362	Kyorugee = Sparring, 	Kyorugee = Sparring, 	362	t		1	20	\N	\N
363	Hoshinsool = Self-defense, Kyukpa = breaking	Hoshinsool = Self-defense, Kyukpa = breaking	363	t		1	20	\N	\N
364	Write one Asian Proverb and explain why you chose it on the back of this paper.	Write one Asian Proverb and explain why you chose it on the back of this paper.	364	t		1	6	\N	\N
365	Name your Sabumnim’s previous Instructor, Master, and current Grand-Master.	Name your Sabumnim’s previous Instructor, Master, and current Grand-Master.	365	t	Possible answers: Richard William Hoehn, Richard Mane, Bill Cipoleta, Jul Yul Oh, Nam Woung Kim, Yong Jun Lee	1	21	\N	\N
366	50 Push-ups	50 Push-ups	366	t		1	18	\N	\N
367	50 Sit-ups	50 Sit-ups	367	t		1	18	\N	\N
368	Can hold a plank for 30 seconds	Can hold a plank for 30 seconds	368	t		1	18	\N	\N
369	Can run, jog or speed walk (if have a physical limitation) 2.5 miles.	Can run, jog or speed walk (if have a physical limitation) 2.5 miles.	369	t		1	18	\N	\N
370	Tiger Stance	Tiger Stance	370	t		1	1	\N	\N
371	Twin Outside Block	Twin Outside Block	371	t		1	2	\N	\N
372	Twin Outer Forearm Block	Twin Outer Forearm Block	372	t		1	2	\N	\N
373	X-Block (with hands closed) low	X-Block (with hands closed) low	373	t		1	2	\N	\N
374	X-block (with hands open) high	X-block (with hands open) high	374	t		1	2	\N	\N
375	Scissor Block	Scissor Block	375	t		1	2	\N	\N
376	Covered Hammer Strike	Covered Hammer Strike	376	t		1	3	\N	\N
377	Twin Uppercut Punch	Twin Uppercut Punch	377	t		1	3	\N	\N
378	Scissor Strike	Scissor Strike	378	t		1	3	\N	\N
379	Spinning Heel Kick (Kicks)	Spinning Heel Kick (Kicks)	379	t		1	4	\N	\N
380	Step Spinning Heel Kick	Step Spinning Heel Kick	380	t		1	4	\N	\N
381	Turning Jump Round	Turning Jump Round	381	t		1	4	\N	\N
382	Step Turning Jump Round	Step Turning Jump Round	382	t		1	4	\N	\N
383	Same leg Double Kick combo with round kicks low & middle	Same leg Double Kick combo with round kicks low & middle	383	t		1	4	\N	\N
384	Same leg Double Kick combo with side and push kicks	Same leg Double Kick combo with side and push kicks	384	t		1	4	\N	\N
385	Same leg Double Kick combo with side and hook kicks	Same leg Double Kick combo with side and hook kicks	385	t		1	4	\N	\N
386	Same leg Double Kick combo with hook, front, or crescent kicks.	Same leg Double Kick combo with hook, front, or crescent kicks.	386	t		1	4	\N	\N
387	Has demonstrated White-Blue Belt Forms consecutively	Has demonstrated White-Blue Belt Forms consecutively	387	t		1	17	\N	\N
388	Dive roll	Dive roll	388	t		1	15	\N	\N
389	Has introduced a new or unique exercise, drill, or way to incorporate a martial art skill into class.	Has introduced a new or unique exercise, drill, or way to incorporate a martial art skill into class.	389	t		1	25	\N	\N
390	Is scanning in every class	Is scanning in every class	390	t		1	25	\N	\N
391	Front Chokes	Front Chokes	391	t		1	14	\N	\N
392	Wrist Break	Wrist Break	392	t		1	14	\N	\N
393	Scissor Leg Takedown	Scissor Leg Takedown	393	t		1	14	\N	\N
394	Against Turning Back kick	Against Turning Back kick	394	t		1	10	\N	\N
395	Full-Nelson Hold	Full-Nelson Hold	395	t		1	10	\N	\N
396	Front chokes	Front chokes	396	t		1	10	\N	\N
397	Jump Turning Back Kick (Sparring Techniques)	Jump Turning Back Kick (Sparring Techniques)	397	t		1	11	\N	\N
398	Medium contact with optional light head contact with full sparring gear on.	Medium contact with optional light head contact with full sparring gear on.	398	t		1	12	\N	\N
399	Knife-hand Strike	Knife-hand Strike	399	t		1	13	\N	\N
400	Jump Turning Back Kick (Breaking Techniques)	Jump Turning Back Kick (Breaking Techniques)	400	t		1	13	\N	\N
401	Tae Guek Chil Jan	Tae Guek Chil Jan	401	t		1	17	\N	\N
402	Counting 71-80 “Ya Dun”,	Counting 71-80 “Ya Dun”,	402	t		1	20	\N	\N
403	Chagee = kick,	Chagee = kick,	403	t		1	20	\N	\N
404	Mahki = block,	Mahki = block,	404	t		1	20	\N	\N
405	Churigee = hand strike/punch,	Churigee = hand strike/punch,	405	t		1	20	\N	\N
406	Gubee/sogee = long/short stance	Gubee/sogee = long/short stance	406	t		1	20	\N	\N
407	How does learning the martial arts reduce the chances of the person getting into a fight?	How does learning the martial arts reduce the chances of the person getting into a fight?	407	t		1	6	\N	\N
408	Name a period of history of ancient Korea and tell how the martial arts were involved.	Name a period of history of ancient Korea and tell how the martial arts were involved.	408	t	Answers: Kingdoms of the Koguryo dynasty{mural painting of the art of Taekyun}, Silla dynasty {Keumkang Warrior carvings and Hwarang martial art knights}, Koryo dynasty {Subak village contests}, and the YI dynasty{the book, Muye Dobo Tongji}.	1	21	\N	\N
409	Name an important time in American history and how it relates to martial arts. )	Name an important time in American history and how it relates to martial arts. )	409	t		1	21	\N	\N
410	60 Push-ups	60 Push-ups	410	t		1	19	\N	\N
411	60 Sit-ups	60 Sit-ups	411	t		1	19	\N	\N
412	Can run, jog, or speed walk 3 miles	Can run, jog, or speed walk 3 miles	412	t		1	19	\N	\N
413	Is stretching and doing balancing drills	Is stretching and doing balancing drills	413	t		1	19	\N	\N
414	List 3 ways you have specifically helped a peer or lower belt at the dojang in the last month on the back of this curriculum.	List 3 ways you have specifically helped a peer or lower belt at the dojang in the last month on the back of this curriculum.	414	t		1	25	\N	\N
415	Has current phone number and email on file.	Has current phone number and email on file.	415	t		1	25	\N	\N
416	Is scanning in every day for class.	Is scanning in every day for class.	416	t		1	25	\N	\N
417	Reverse Front Stance	Reverse Front Stance	417	t		1	1	\N	\N
418	Augmented Forearm Block	Augmented Forearm Block	418	t		1	2	\N	\N
419	Augmented Low Block	Augmented Low Block	419	t		1	2	\N	\N
420	Mountain Block	Mountain Block	420	t		1	2	\N	\N
421	Single Mountain Block	Single Mountain Block	421	t		1	2	\N	\N
422	Wrist Strike	Wrist Strike	422	t		1	3	\N	\N
423	Beak Strike	Beak Strike	423	t		1	3	\N	\N
424	Mountain Strike	Mountain Strike	424	t		1	3	\N	\N
425	Single Mountain strike	Single Mountain strike	425	t		1	3	\N	\N
426	Twist/Reverse Round	Twist/Reverse Round	426	t		1	4	\N	\N
427	Jump Spinning Outside Crescent	Jump Spinning Outside Crescent	427	t		1	4	\N	\N
428	Has demonstrated White Belt through Brown Belt Forms consecutively	Has demonstrated White Belt through Brown Belt Forms consecutively	428	t		1	9	\N	\N
429	Obstacle Dive roll	Obstacle Dive roll	429	t		1	5	\N	\N
430	65 Push-ups	65 Push-ups	430	t		1	19	\N	\N
431	65 Sit-ups	65 Sit-ups	431	t		1	19	\N	\N
432	Can run, jog, or speed walk (if have physical limitations) 3.5 miles	Can run, jog, or speed walk (if have physical limitations) 3.5 miles	432	t		1	19	\N	\N
433	Please write a short description of what you have gained from your training so far and what your specific goals are for achieving black belt on the back of this curriculum.	Please write a short description of what you have gained from your training so far and what your specific goals are for achieving black belt on the back of this curriculum.	433	t		1	6	\N	\N
434	Has provided 1 of 3 signatures from different areas in his/her life attesting to the following: Student has shown respect within the dojang family, to staff members, to family members, and has also demonstrated good environmental stewardship.	Has provided 1 of 3 signatures from different areas in his/her life attesting to the following: Student has shown respect within the dojang family, to staff members, to family members, and has also demonstrated good environmental stewardship.	434	t	1. Name of person attesting to this, Phone #, Brief Description.	1	25	\N	\N
435	Has provided 2 of 3 signatures from different areas in his/her life attesting to the following: Student has shown respect within the dojang family, to staff members, to family members, and has also demonstrated good environmental stewardship.	Has provided 2 of 3 signatures from different areas in his/her life attesting to the following: Student has shown respect within the dojang family, to staff members, to family members, and has also demonstrated good environmental stewardship.	435	t	2. Name of person attesting to this, Phone #, Brief Description.	1	25	\N	\N
436	Has provided 3 of 3 signatures from different areas in his/her life attesting to the following: Student has shown respect within the dojang family, to staff members, to family members, and has also demonstrated good environmental stewardship.	Has provided 3 of 3 signatures from different areas in his/her life attesting to the following: Student has shown respect within the dojang family, to staff members, to family members, and has also demonstrated good environmental stewardship.	436	t	3. Name of person attesting to this, Phone #, Brief Description.	1	25	\N	\N
437	Mount	Mount	437	t		1	14	\N	\N
438	Bridge	Bridge	438	t		1	14	\N	\N
439	Hair Throw	Hair Throw	439	t		1	14	\N	\N
440	Spinning Heel Kick (Self-Defense)	Spinning Heel Kick Self-Defense (Self-Defense)	440	t		1	10	\N	\N
441	Mounted Attack	Mounted Attack	441	t		1	10	\N	\N
442	Rear Choke	Rear Choke	442	t		1	10	\N	\N
443	Spinning Heel Kick Counter	Spinning Heel Kick Counter	443	t		1	11	\N	\N
444	Jump Turning Round Kick	Jump Turning Round Kick	444	t		1	11	\N	\N
445	Medium contact with optional light head contact in 3 styles	Medium contact with optional light head contact in 3 styles	445	t		1	12	\N	\N
446	Punch 	Punch 	446	t		1	13	\N	\N
447	Spinning Heel Kick (Breaking Technique)	Spinning Heel Kick (Breaking Technique)	447	t		1	13	\N	\N
448	Has demonstrated White-Brown Belt Forms consecutively	Has demonstrated White-Brown Belt Forms consecutively	448	t		1	17	\N	\N
449	Tae Guek Pal Jang	Tae Guek Pal Jang	449	t		1	17	\N	\N
450	Counting 81 to 90 “Ah Hun”,	Counting 81 to 90 “Ah Hun”,	450	t		1	20	\N	\N
451	Charyut = attention,	Charyut = attention,	451	t		1	20	\N	\N
452	Kungyae = bow, 	Kungyae = bow, 	452	t		1	20	\N	\N
453	Choombee = ready,	Choombee = ready,	453	t		1	20	\N	\N
454	Barote = return,	Barote = return,	454	t		1	20	\N	\N
455	Sho = relax,	Sho = relax,	455	t		1	20	\N	\N
456	Sheejak = start,	Sheejak = start,	456	t		1	20	\N	\N
457	Kumon = stop	Kumon = stop	457	t		1	20	\N	\N
458	Has stood in front of a class and shared: What the purpose for doing Self-defense?	Has stood in front of a class and shared: What the purpose for doing Self-defense?	458	t	To learn both appropriate and effective techniques & strategies for real life situations.	1	26	\N	\N
459	What the purpose for doing Forms?	What the purpose for doing Forms?	459	t	Solo training to perfect basic fundamentals like stances, strikes, breathing, balance, & focus.	1	26	\N	\N
460	What the purpose for doing Breaking?	What the purpose for doing Breaking?	460	t	A method to test the power and accuracy of a strike, with a potential consequence for improper technique.	1	26	\N	\N
461	What the purpose for doing Sparring?	What the purpose for doing Sparring?	461	t	Partner training to improve timing, reaction, and courage.	1	26	\N	\N
462	What the purpose for doing Meditation?	What the purpose for doing Meditation?	462	t	A method of learning to relax, to visualize, or to contemplate deeply.	1	26	\N	\N
463	What the purpose for doing Philosophy?	What the purpose for doing Philosophy?	463	t	A method to enlightenment, better understanding of the world, and a positive outlook on life.	1	26	\N	\N
464	Why is learning history important?	Why is learning history important?	464	t	It is a way to learn about both past mistakes and triumphs of mankind. This knowledge will allow us to make the future better.	1	21	\N	\N
465	75 Push-ups	75 Push-ups	465	t		1	19	\N	\N
466	75 Sit-ups	75 Sit-ups	466	t		1	19	\N	\N
467	Can run, jog, or speed walk (if have physical limitations) 4 miles	Can run, jog, or speed walk (if have physical limitations) 4 miles	467	t		1	19	\N	\N
468	Can lead 3 cycle breathing meditation to another student & explain to student why we meditate & benefits	Can lead 3 cycle breathing meditation to another student & explain to student why we meditate & benefits	468	t		1	19	\N	\N
469	Has articulated to Master Hoehn, and also written down on the back of this curriculum, his/her target Black Belt Testing Date along with an outline of what student feels needs the most help with in order to achieve his/her goal.	Has articulated to Master Hoehn, and also written down on the back of this curriculum, his/her target Black Belt Testing Date along with an outline of what student feels needs the most help with in order to achieve his/her goal.	469	t		1	25	\N	\N
470	Has volunteered for TZLC for at least 10 hours over the last 4 months. Please list these times and a description of volunteer work done, along with a staff signatures on TZLC Letterhead.	Has volunteered for TZLC for at least 10 hours over the last 4 months. Please list these times and a description of volunteer work done, along with a staff signatures on TZLC Letterhead.	470	t		1	25	\N	\N
471	Has written thank you letters martial arts and has stabled a copy of those letters to this curriculum.o at least 3 people who helped him/her get this far and succeed in the	Has written thank you letters martial arts and has stabled a copy of those letters to this curriculum.o at least 3 people who helped him/her get this far and succeed in the	471	t		1	25	\N	\N
472	Has demonstrated a skill in front of at least one class.	Has demonstrated a skill in front of at least one class.	472	t		1	25	\N	\N
473	DND	DND	473	t	\N	1	3		\N
\.


--
-- Data for Name: structaq_featurechallengecurriculum; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.structaq_featurechallengecurriculum (id, "order", challenge_id, curriculum_id, progression_id) FROM stdin;
1	1	1	1	1
2	2	2	1	1
3	3	3	1	1
4	4	4	1	1
5	5	5	1	1
6	6	6	1	1
7	7	7	1	1
8	8	8	1	1
9	9	9	1	1
10	10	10	1	1
11	11	11	1	1
12	12	12	1	1
13	13	13	1	1
14	14	14	1	1
15	15	15	1	1
16	16	16	1	1
17	17	17	1	1
18	18	18	1	1
19	19	19	1	1
20	20	20	1	1
21	21	21	1	1
22	22	22	1	1
23	23	23	1	1
24	24	24	1	1
25	25	25	1	1
26	26	26	1	1
27	27	27	1	1
28	28	28	1	1
29	29	29	1	1
30	30	30	1	1
31	31	31	1	1
32	32	32	1	1
33	33	33	1	1
34	34	34	1	1
35	35	35	1	1
36	36	36	1	1
37	37	37	1	1
38	38	38	1	1
39	39	39	1	1
40	40	40	1	1
41	41	41	1	1
42	42	42	1	1
43	43	43	1	1
44	44	44	1	1
45	45	45	1	1
46	46	46	1	1
47	47	47	1	1
48	48	48	1	1
49	49	49	1	1
50	50	50	2	1
51	51	51	2	1
52	52	52	2	1
53	53	53	2	1
54	54	54	2	1
55	55	55	2	1
56	56	56	2	1
57	57	57	2	1
58	58	58	2	1
59	59	59	2	1
60	60	60	2	1
61	61	61	2	1
62	62	62	2	1
63	63	63	2	1
64	64	64	2	1
65	65	65	2	1
66	66	66	2	1
67	67	67	2	1
68	68	68	2	1
69	69	69	2	1
70	70	70	2	1
71	71	71	2	1
72	72	72	2	1
73	73	73	2	1
74	74	74	2	1
75	75	42	2	1
76	76	75	3	1
77	77	76	3	1
78	78	77	3	1
79	79	78	3	1
80	80	79	3	1
81	81	80	3	1
82	82	81	3	1
83	83	82	3	1
84	84	83	3	1
85	85	84	3	1
86	86	85	3	1
87	87	86	3	1
88	88	87	3	1
89	89	88	3	1
90	90	89	3	1
91	91	90	3	1
92	92	91	3	1
93	93	92	3	1
94	94	93	3	1
95	95	94	3	1
96	96	95	3	1
97	97	38	3	1
98	98	96	3	1
99	99	26	3	1
100	100	27	3	1
101	101	28	3	1
102	102	29	3	1
103	103	30	3	1
104	104	31	3	1
105	105	32	3	1
106	106	33	3	1
107	107	34	3	1
108	108	35	3	1
109	109	36	3	1
110	110	37	3	1
111	111	97	3	1
112	112	42	3	1
113	113	98	4	1
114	114	99	4	1
115	115	100	4	1
116	116	101	4	1
117	117	102	4	1
118	118	103	4	1
119	119	104	4	1
120	120	105	4	1
121	121	106	4	1
122	122	107	4	1
123	123	108	4	1
124	124	109	4	1
125	125	110	4	1
126	126	111	4	1
127	127	112	4	1
128	128	113	4	1
129	129	114	4	1
130	130	115	4	1
131	131	116	4	1
132	132	117	4	1
133	133	118	4	1
134	134	119	4	1
135	135	120	4	1
136	136	42	4	1
137	137	121	5	1
138	138	122	5	1
139	139	123	5	1
140	140	124	5	1
141	141	125	5	1
142	142	126	5	1
143	143	127	5	1
144	144	128	5	1
145	145	129	5	1
146	146	130	5	1
147	147	131	5	1
148	148	132	5	1
149	149	133	5	1
150	150	134	5	1
151	151	135	5	1
152	152	136	5	1
153	153	137	5	1
154	154	138	5	1
155	155	139	5	1
156	156	140	5	1
157	157	141	5	1
158	158	142	5	1
159	159	143	5	1
160	160	144	5	1
161	161	145	5	1
162	162	146	5	1
163	163	42	5	1
164	164	147	6	1
165	165	148	6	1
166	166	149	6	1
167	167	150	6	1
168	168	151	6	1
169	169	152	6	1
170	170	153	6	1
171	171	154	6	1
172	172	155	6	1
173	173	156	6	1
174	174	157	6	1
175	175	158	6	1
176	176	159	6	1
177	177	160	6	1
178	178	161	6	1
179	179	162	6	1
180	180	163	6	1
181	181	164	6	1
182	182	165	6	1
183	183	166	6	1
184	184	167	6	1
185	185	168	6	1
186	186	169	6	1
187	187	170	6	1
188	188	144	6	1
189	189	143	6	1
190	190	42	6	1
191	191	171	7	1
192	192	172	7	1
193	193	173	7	1
194	194	174	7	1
195	195	175	7	1
196	196	176	7	1
197	197	177	7	1
198	198	178	7	1
199	199	179	7	1
200	200	180	7	1
201	201	181	7	1
202	202	182	7	1
203	203	183	7	1
204	204	184	7	1
205	205	185	7	1
206	206	186	7	1
207	207	187	7	1
208	208	188	7	1
209	209	189	7	1
210	210	190	7	1
211	211	191	7	1
212	212	192	7	1
213	213	167	7	1
214	214	168	7	1
215	215	193	7	1
216	216	146	7	1
217	217	168	7	1
218	218	194	8	1
219	219	195	8	1
220	220	196	8	1
221	221	197	8	1
222	222	198	8	1
223	223	199	8	1
224	224	200	8	1
225	225	201	8	1
226	226	202	8	1
227	227	203	8	1
228	228	204	8	1
229	229	205	8	1
230	230	206	8	1
231	231	207	8	1
232	232	208	8	1
233	233	209	8	1
234	234	210	8	1
235	235	211	8	1
236	236	212	8	1
237	237	213	8	1
238	238	214	8	1
239	239	215	8	1
240	240	216	8	1
241	241	167	8	1
242	242	168	8	1
243	243	144	8	1
244	244	193	8	1
245	245	217	8	1
246	246	42	8	1
247	247	218	9	1
248	248	219	9	1
249	249	220	9	1
250	250	221	9	1
251	251	222	9	1
252	252	223	9	1
253	253	224	9	1
254	254	225	9	1
255	255	226	9	1
256	256	227	9	1
257	257	228	9	1
258	258	229	9	1
259	259	230	9	1
260	260	231	9	1
261	261	232	9	1
262	262	233	9	1
263	263	234	9	1
264	264	235	9	1
265	265	236	9	1
266	266	237	9	1
267	267	238	9	1
268	268	239	9	1
269	269	240	9	1
270	270	241	9	1
271	271	193	9	1
272	272	242	9	1
273	273	42	9	1
274	274	243	10	1
275	275	244	10	1
276	276	245	10	1
277	277	246	10	1
278	278	247	10	1
279	279	248	10	1
280	280	249	10	1
281	281	250	10	1
282	282	251	10	1
283	283	252	10	1
284	284	253	10	1
285	285	254	10	1
286	286	255	10	1
287	287	256	10	1
288	288	257	10	1
289	289	258	10	1
290	290	259	10	1
291	291	260	10	1
292	292	261	10	1
293	293	262	10	1
294	294	263	10	1
295	295	42	10	1
296	296	264	11	1
297	297	265	11	1
298	298	266	11	1
299	299	267	11	1
300	300	268	11	1
301	301	269	11	1
302	302	270	11	1
303	303	271	11	1
304	304	272	11	1
305	305	273	11	1
306	306	274	11	1
307	307	275	11	1
308	308	276	11	1
309	309	277	11	1
310	310	278	11	1
311	311	279	11	1
312	312	280	11	1
313	313	281	11	1
314	314	282	11	1
315	315	283	11	1
316	316	284	11	1
317	317	285	11	1
318	318	286	11	1
319	319	144	11	1
320	320	287	11	1
321	321	42	11	1
322	322	288	12	1
323	323	289	12	1
324	324	290	12	1
325	325	291	12	1
326	326	292	12	1
327	327	293	12	1
328	328	294	12	1
329	329	295	12	1
330	330	296	12	1
331	331	297	12	1
332	332	298	12	1
333	333	299	12	1
334	334	300	12	1
335	335	301	12	1
336	336	302	12	1
337	337	303	12	1
338	338	304	12	1
339	339	305	12	1
340	340	306	12	1
341	341	307	12	1
342	342	308	12	1
343	343	309	12	1
344	344	310	12	1
345	345	311	12	1
346	346	312	12	1
347	347	313	12	1
348	348	314	12	1
349	349	315	12	1
350	350	316	12	1
351	351	317	12	1
352	352	318	12	1
353	353	319	12	1
354	354	283	12	1
355	355	320	12	1
356	356	193	12	1
357	357	321	12	1
358	358	144	12	1
359	359	322	12	1
360	360	42	12	1
361	361	323	13	1
362	362	324	13	1
363	363	325	13	1
364	364	326	13	1
365	365	327	13	1
366	366	328	13	1
367	367	329	13	1
368	368	330	13	1
369	369	331	13	1
370	370	332	13	1
371	371	333	13	1
372	372	334	13	1
373	373	335	13	1
374	374	336	13	1
375	375	337	13	1
376	376	338	13	1
377	377	339	13	1
378	378	340	13	1
379	379	341	13	1
380	380	342	13	1
381	381	343	13	1
382	382	344	13	1
383	383	345	13	1
384	384	346	13	1
385	385	347	13	1
386	386	42	13	1
387	387	348	14	1
388	388	349	14	1
389	389	350	14	1
390	390	351	14	1
391	391	352	14	1
392	392	353	14	1
393	393	354	14	1
394	394	355	14	1
395	395	356	14	1
396	396	357	14	1
397	397	358	14	1
398	398	359	14	1
399	399	360	14	1
400	400	361	14	1
401	401	362	14	1
402	402	363	14	1
403	403	364	14	1
404	404	365	14	1
405	405	366	14	1
406	406	367	14	1
407	407	368	14	1
408	408	369	14	1
409	409	168	14	1
410	410	42	14	1
411	411	370	15	1
412	412	371	15	1
413	413	372	15	1
414	414	373	15	1
415	415	374	15	1
416	416	375	15	1
417	417	376	15	1
418	418	377	15	1
419	419	378	15	1
420	420	379	15	1
421	421	380	15	1
422	422	381	15	1
423	423	382	15	1
424	424	383	15	1
425	425	384	15	1
426	426	385	15	1
427	427	386	15	1
428	428	387	15	1
429	429	388	15	1
430	430	389	15	1
431	431	390	15	1
432	432	42	15	1
433	433	391	16	1
434	434	392	16	1
435	435	393	16	1
436	436	394	16	1
437	437	395	16	1
438	438	396	16	1
439	439	397	16	1
440	440	398	16	1
441	441	399	16	1
442	442	400	16	1
443	443	401	16	1
444	444	402	16	1
445	445	403	16	1
446	446	404	16	1
447	447	405	16	1
448	448	406	16	1
449	449	407	16	1
450	450	408	16	1
451	451	409	16	1
452	452	410	16	1
453	453	411	16	1
454	454	412	16	1
455	455	413	16	1
456	456	414	16	1
457	457	415	16	1
458	458	416	16	1
459	459	42	16	1
460	460	417	17	1
461	461	418	17	1
462	462	419	17	1
463	463	420	17	1
464	464	421	17	1
465	465	422	17	1
466	466	423	17	1
467	467	424	17	1
468	468	425	17	1
469	469	426	17	1
470	470	427	17	1
471	471	428	17	1
472	472	429	17	1
473	473	430	17	1
474	474	431	17	1
475	475	432	17	1
476	476	413	17	1
477	477	433	17	1
478	478	472	17	1
479	479	434	17	1
480	480	435	17	1
481	481	436	17	1
482	482	42	17	1
483	483	437	18	1
484	484	438	18	1
485	485	439	18	1
486	486	440	18	1
487	487	441	18	1
488	488	442	18	1
489	489	443	18	1
490	490	444	18	1
491	491	445	18	1
492	492	446	18	1
493	493	447	18	1
494	494	448	18	1
495	495	449	18	1
496	496	450	18	1
497	497	451	18	1
498	498	452	18	1
499	499	453	18	1
500	500	454	18	1
501	501	455	18	1
502	502	456	18	1
503	503	457	18	1
504	504	458	18	1
505	505	459	18	1
506	506	460	18	1
507	507	461	18	1
508	508	462	18	1
509	509	463	18	1
510	510	464	18	1
511	511	465	18	1
512	512	466	18	1
513	513	467	18	1
514	514	468	18	1
515	515	469	18	1
516	516	470	18	1
517	517	471	18	1
518	518	42	18	1
519	519	4	1	2
\.


--
-- Data for Name: structaq_featurecurriculum; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.structaq_featurecurriculum (id, short, name, "order", belt, progression_id) FROM stdin;
1	ADULT WHITE BELT	ADULT WHITE BELT	1	belts/clipart3242069.png	1
3	SR WHITE BELT	SR WHITE BELT	3	belts/clipart3242069_TbzE7mH.png	1
19	BLACK BELT	BLACK BELT	19	belts/black.png	1
2	ADULT WHITE BELT w YELLOW STRIPE	ADULT WHITE BELT w YELLOW STRIPE	2	belts/WhiteYellowBelt.png	1
4	SR WHITE BELT w YELLOW STRIPE	SR WHITE BELT w YELLOW STRIPE	4	belts/WhiteYellowBelt_1aV1DYX.png	1
5	YELLOW BELT	YELLOW BELT	5	belts/YellowBelt.png	1
6	YELLOW BELT w ORANGE STRIPE	YELLOW BELT w ORANGE STRIPE	6	belts/y_w_o.png	1
7	ORANGE BELT	ORANGE BELT	7	belts/OrangeBelt.png	1
9	GREEN BELT	GREEN BELT	9	belts/GreenBelt.png	1
17	SR RED BELT	SENOR RED BELT	17	belts/red-belt.png	1
15	SR BROWN BELT	SENOR BROWN BELT	15	belts/brown-belt.png	1
11	SR PURPLE BELT	SENOR PURPLE BELT	11	belts/purple-belt.png	1
13	SR BLUE BELT	SENOR BLUE BELT	13	belts/blue-belt.png	1
16	SR BROWN BELT w RED STRIPE	SENOR BROWN BELT w RED STRIPE	16	belts/brown_w_red.png	1
18	RED BELT w BLACK STRIPE	RED BELT w BLACK STRIPE	18	belts/r_w_b.png	1
10	GREEN BELT w PURPLE STRIPE	GREEN BELT w PURPLE STRIPE	10	belts/g_w_p.png	1
8	ORANGE BELT w GREEN STRIPE	ORANGE BELT w GREEN STRIPE	8	belts/o_w_g.png	1
12	PURPLE BELT w BLUE STRIPE	PURPLE BELT w BLUE STRIPE	12	belts/p_w_b.png	1
14	SR BLUE BELT w BROWN STIPE	SENOR BLUE BELT w BROWN STIPE	14	belts/b_w_b.png	1
\.


--
-- Data for Name: structaq_featureinstructor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.structaq_featureinstructor (id, first_name, middle_name, last_name, full_name, birthdate, active, startdate, enddate, user_id, photo) FROM stdin;
4	developer	\N	developer	developer	2001-01-01	t	2018-12-27 17:21:39+00	2999-12-31 07:00:00+00	1	instructor_photo/instr1.jpeg
2	test	t	test	test	1980-01-01	t	2018-12-27 16:16:28+00	2999-12-31 07:00:00+00	5	instructor_photo/goku-monkey-d-luffy-vegeta-super-saiya-dragon-ball-goku-thumb.jpg
1	Mike	N	Nadeau	Mike N Nadeau	1970-12-31	t	2018-12-27 13:42:58+00	2999-12-31 07:00:00+00	2	instructor_photo/street-fighter-iv-street-fighter-ii-the-world-warrior-ken-masters-ryu-s_V88f7aR.jpg
3	Murad	\N	Khan	murads321	2011-11-11	t	2018-12-27 17:21:39+00	2999-12-31 07:00:00+00	6	instructor_photo/street-fighter-iii-3rd-strike-street-fighter-iv-street-fighter-alpha-3-_AlS7AEL.jpg
5	manager_instructor	manager_instructor	manager_instructor	manager_instructor	1977-02-05	t	2019-03-11 16:54:26.457197+00	2020-03-10 15:05:09.423281+00	11	instructor_photo/goku-monkey-d-luffy-vegeta-dragon-ball-super-saiyan-goku-thumb.jpg
\.


--
-- Data for Name: structaq_featureprogression; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.structaq_featureprogression (id, short, name, "order") FROM stdin;
1	Tae Kwon Do	Tae Kwon Do !!!	1
2	Self-Defense	Self-Defense !!!!!	2
3	Life Coaching	Life Coaching !!!!!	3
\.


--
-- Data for Name: structaq_featurestudent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.structaq_featurestudent (id, first_name, middle_name, last_name, full_name, birthdate, active, startdate, enddate, user_id, photo) FROM stdin;
6	Murad	\N	Khan	murads321y	2011-11-11	t	2018-12-27 17:25:07+00	2999-12-31 07:00:00+00	7	student_photo/goku-krillin-dragon-ball-z-ultimate-tenkaichi-master-roshi-dragon-ball-ori_dxhHfW6.jpg
5	Murad	\N	Khan	murads321	2011-11-11	t	2018-12-27 17:21:39+00	2999-12-31 07:00:00+00	6	student_photo/1fd84f1a5c5a145142fb387447998d83.png
3	Sample	S	Student02	Sample S Student02	1985-12-31	t	2018-12-27 13:45:01+00	2999-12-31 07:00:00+00	4	student_photo/kisspng-ken-masters-super-street-fighter-iv-ryu-guile-5af1becf0c0368.53336_z7siNbL.jpg
2	Test	T	Student 01	Test T Student 01	1990-12-31	t	2018-12-27 13:43:54+00	2999-12-31 07:00:00+00	3	student_photo/kisspng-goku-gohan-frieza-master-roshi-vegeta-goku-5abe3aac75a6b7.02260044_TmITwIz.jpg
4	test	t	test	test	1980-01-01	t	2018-12-27 16:16:28+00	2999-12-31 07:00:00+00	5	student_photo/krillin-vegeta-frieza-master-roshi-goku-goku-thumb.jpg
1	Mike	N	Nadeau	Mike N Nadeau	1970-12-31	t	2018-12-27 13:42:58+00	2999-12-31 07:00:00+00	2	student_photo/street-fighter-iv-street-fighter-ii-the-world-warrior-ken-masters-ryu-stre_DbupKoI.jpg
\.


--
-- Data for Name: structaq_featurestudentprogression; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.structaq_featurestudentprogression (id, startdate, enddate, active, progression_id, student_id) FROM stdin;
2	2018-06-14	2999-12-31	t	2	1
3	2018-06-14	2999-12-31	t	3	1
1	2018-06-14	2999-12-31	t	1	3
4	2019-02-12	2020-02-12	t	1	2
5	2019-02-04	2020-02-12	t	1	4
\.


--
-- Data for Name: structaq_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.structaq_user (id, last_login, is_superuser, username, first, middle, last, name, email, birthdate, student, family, instructor, management, password, status, startdate, enddate, first_name, last_name, is_staff, is_active, date_joined) FROM stdin;
2	\N	f	Mike N Nadeau	Mike	N	Nadeau	\N	miken_mnn@yahoo.com	1970-12-31	t	t	t	t	$2y$10$09PnrDpLr3gYHHzX/9qieuIfpjlEIfhYO4eAFz6CB6iPe0QvY4t22	t	2018-12-27 13:42:58.521248+00	2999-12-31 07:00:00+00	\N	\N	\N	\N	\N
3	\N	f	Test T Student 01	Test	T	Student 01	\N	test.student01@gmail.com	1990-12-31	t	t	f	f	$2y$10$orlqHGYdcvZUDV78/lma6./f9V/qV4gBDt6CpLj5uio/RLtAD1Z82	t	2018-12-27 13:43:54.780326+00	2999-12-31 07:00:00+00	\N	\N	\N	\N	\N
4	\N	f	Sample S Student02	Sample	S	Student02	\N	sample.student02@gmail.com	1985-12-31	t	t	f	f	$2y$10$D6FeLYjOvSqUOHrXEKXt2OnAg8gK5T2Ol/nmuvSFp2tEKPb7TgNaO	t	2018-12-27 13:45:01.20988+00	2999-12-31 07:00:00+00	\N	\N	\N	\N	\N
5	\N	f	test	test	t	test	\N	test2323@mailinator.com	1980-01-01	t	t	t	t	$2y$10$fIKzVJxOj.OgLLJDC903O..Cjtj8TkTLo4MaA5RQlFyyFxu97bifC	t	2018-12-27 16:16:28.292319+00	2999-12-31 07:00:00+00	\N	\N	\N	\N	\N
6	\N	f	murads321	Murad		Khan	\N	murads321@gmail.com	2011-11-11	t	t	t	t	$2y$10$Ruz/qxtXnbgWy1noPmPW5.r/A60CtsD3NY7t4J1FJswSrCScd5nvu	t	2018-12-27 17:21:39.148065+00	2999-12-31 07:00:00+00	\N	\N	\N	\N	\N
7	\N	f	murads321y	Murad		Khan	\N	murads321@yahoo.com	2011-11-11	t	f	f	f	$2y$10$kmS/UEWIR21ssu43vS6v9OSjNGeZNveZFhF/Nhlto/g08HTLPqgPi	t	2018-12-27 17:25:07.915552+00	2999-12-31 07:00:00+00	\N	\N	\N	\N	\N
9	\N	f	instructor	\N	\N	\N	\N		1999-02-05	f	f	t	f	pbkdf2_sha256$120000$M0kTaZPWRvtW$Bw+ry0vd4X/NTUEzv3MhuQNgkttFufkqCJN6yyU5+Ks=	t	2019-02-19 16:05:15+00	2020-02-19 16:04:23+00	\N	\N	f	t	2019-02-19 16:05:15+00
10	\N	f	manager_instructor	manager_instructor	manager_instructor	manager_instructor	\N	manager_instructor@mi.co	1977-02-05	f	f	t	t	pbkdf2_sha256$120000$6KOBPnGLsd0t$rPLA32ZMnD6nB/fjqVO3g6dYZ9qsLsa/yBOo4yXaNpg=	t	2019-03-11 16:53:23+00	2020-03-10 15:05:09+00	\N	\N	t	t	2019-03-11 16:53:23+00
11	\N	f	hz	hz	hz	hz	\N	hz	1977-02-05	f	f	t	f	pbkdf2_sha256$120000$kTYLL5jsirXN$11kayRjx2fFomy2FMSp6ZfTnyObNBBFnUcQp5I0x1mU=	t	2019-03-11 16:54:26+00	2020-03-10 15:05:09+00	\N	\N	f	t	2019-03-11 16:54:26+00
1	2019-03-12 01:25:10.184518+00	t	developer	\N	\N	\N	\N		1977-02-05	f	f	t	f	pbkdf2_sha256$120000$etg3myxZgiOB$/HMRnhGKx8WXo4hCc+RFb1onWzRHuNHUF8dEGWTPIXo=	t	2019-02-08 13:38:02+00	2020-02-08 13:37:33+00	\N	\N	t	t	2019-02-08 13:38:02+00
8	2019-03-12 01:30:11.579724+00	f	manager	\N	\N	\N	\N		1999-02-05	f	f	f	t	pbkdf2_sha256$120000$BsGdFWuwxqMx$6FHuIJaPpXtY9URJecmbRmS0vX3ts0hHOGnt7NOGFAQ=	t	2019-02-19 15:57:53+00	2020-02-19 15:56:55+00	\N	\N	t	t	2019-02-19 15:57:53+00
\.


--
-- Data for Name: structaq_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.structaq_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: structaq_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.structaq_user_user_permissions (id, user_id, permission_id) FROM stdin;
1	8	25
2	8	26
3	8	27
4	8	28
5	8	29
6	8	30
7	8	31
8	8	32
9	8	33
10	8	34
11	8	35
12	8	36
13	8	77
14	8	78
15	8	79
16	8	80
17	8	37
18	8	69
19	8	38
20	8	70
21	8	39
22	8	71
23	8	40
24	8	72
25	8	41
26	8	42
27	8	43
28	8	44
29	8	45
30	8	46
31	8	47
32	8	48
33	8	49
34	8	50
35	8	51
36	8	52
37	8	53
38	8	54
39	8	55
40	8	56
41	8	57
42	8	58
43	8	59
44	8	60
45	8	61
46	8	62
47	8	63
48	8	64
49	8	65
50	8	66
51	8	67
52	8	68
53	8	73
54	8	74
55	8	75
56	8	76
57	10	25
58	10	26
59	10	27
60	10	28
61	10	29
62	10	30
63	10	31
64	10	32
65	10	33
66	10	34
67	10	35
68	10	36
69	10	77
70	10	78
71	10	79
72	10	80
73	10	37
74	10	69
75	10	38
76	10	70
77	10	39
78	10	71
79	10	40
80	10	72
81	10	41
82	10	42
83	10	43
84	10	44
85	10	45
86	10	46
87	10	47
88	10	48
89	10	49
90	10	50
91	10	51
92	10	52
93	10	53
94	10	54
95	10	55
96	10	56
97	10	57
98	10	58
99	10	59
100	10	60
101	10	61
102	10	62
103	10	63
104	10	64
105	10	65
106	10	66
107	10	67
108	10	68
109	10	73
110	10	74
111	10	75
112	10	76
\.


--
-- Data for Name: thumbnail_kvstore; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.thumbnail_kvstore (key, value) FROM stdin;
sorl-thumbnail||image||1b60123b08f1a5c328ca51b3c27c9969	{"name": "avatar.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [720, 720]}
sorl-thumbnail||image||4e9cda3a49a56cc85b01dbe06d899263	{"name": "cache/a2/27/a227ba754474f754a777628c37f5b4c0.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [80, 80]}
sorl-thumbnail||image||07f8169b3eb1123052803566928812a2	{"name": "cache/35/88/35886ac384d91d8e4a60aa81ff4ed946.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [60, 80]}
sorl-thumbnail||thumbnails||2e069f70031ebafd051047141b011d7e	["07f8169b3eb1123052803566928812a2"]
sorl-thumbnail||image||4d9313d7f7cae7a9b08e1e17f8927916	{"name": "no-belt.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [100, 100]}
sorl-thumbnail||image||9843811a68920f3ac38a4ad9b34ec98b	{"name": "cache/ca/79/ca799a02554a871a4cc970e3861c2aad.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [69, 80]}
sorl-thumbnail||thumbnails||0ec1ce16d775a2d7a4001c6bdd60fdf7	["9843811a68920f3ac38a4ad9b34ec98b"]
sorl-thumbnail||image||75f9087169f9c2cf48c96f2563c6efce	{"name": "cache/b6/25/b625ef6b663c6b93d01f7522c03ddc59.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [70, 80]}
sorl-thumbnail||image||bd8673ad60f59e322e5c13ece97dca9c	{"name": "belts/clipart3242069.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [573, 219]}
sorl-thumbnail||thumbnails||4569388161c869ff050ee19bc6195c18	["75f9087169f9c2cf48c96f2563c6efce"]
sorl-thumbnail||image||4bdbb44a7e84e4268886064bab7c3b2d	{"name": "belts/clipart3242069_TbzE7mH.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [573, 219]}
sorl-thumbnail||image||bfcc7ca5921b7e5857622cdf146c4de7	{"name": "cache/1c/a6/1ca63f342320c0135d40c96447849f8a.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [120, 120]}
sorl-thumbnail||image||b68802570fc355df4bca66dad6cbdc25	{"name": "belts/black.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [522, 305]}
sorl-thumbnail||thumbnails||e57b33d4620cbea8f0fbab8454d1ed95	["bfcc7ca5921b7e5857622cdf146c4de7"]
sorl-thumbnail||image||8dd753dfa660b56bddfbc8d62de0dc34	{"name": "belts/WhiteYellowBelt.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [479, 185]}
sorl-thumbnail||image||dc81ed6374450808fbd41683c27a748b	{"name": "cache/30/69/306959abe536574371656ff843b7448a.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [95, 120]}
sorl-thumbnail||image||6671b94280a0dd963aa28b7bd0c33ef7	{"name": "belts/WhiteYellowBelt_1aV1DYX.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [479, 185]}
sorl-thumbnail||thumbnails||4649ada47f62f80673c9cd10665c38fe	["dc81ed6374450808fbd41683c27a748b"]
sorl-thumbnail||image||c34c3a245a70ddae5b81e675aeedd6e8	{"name": "belts/YellowBelt.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [479, 185]}
sorl-thumbnail||image||831fb9d5a54a650ebd556bfc9531e9db	{"name": "cache/ef/3a/ef3a6a1565103d3267a118446db557e2.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [68, 120]}
sorl-thumbnail||thumbnails||66dc87928b5309b9fcc2388a6e11125c	["831fb9d5a54a650ebd556bfc9531e9db"]
sorl-thumbnail||image||55c1050fc4cfb578093c4487e0aaaa9b	{"name": "belts/y_w_o.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [648, 252]}
sorl-thumbnail||image||97014aada91411298ad397d040f3c790	{"name": "belts/OrangeBelt.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [479, 185]}
sorl-thumbnail||image||7559cac9e13183813c72f0257a38bb7b	{"name": "belts/GreenBelt.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [479, 185]}
sorl-thumbnail||image||f0450a325e8a1b8ca86a4843286297a2	{"name": "belts/red-belt.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 400]}
sorl-thumbnail||image||e1a588bc732f330ccc4fae7d7f67abff	{"name": "belts/brown-belt.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 400]}
sorl-thumbnail||image||5e52987320b5633baaadca0561661879	{"name": "cache/5c/66/5c667d6c910078dc254fd954c5b60454.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [120, 46]}
sorl-thumbnail||image||cb47b9026912b132f9413423a61d339f	{"name": "belts/purple-belt.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 400]}
sorl-thumbnail||thumbnails||bd8673ad60f59e322e5c13ece97dca9c	["5e52987320b5633baaadca0561661879"]
sorl-thumbnail||image||dea875c9a24a8301ca807826b9219c5e	{"name": "belts/blue-belt.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 400]}
sorl-thumbnail||image||d8e81561bbda2151f56f402bd42d8d6f	{"name": "cache/41/e9/41e9dc5c87f2c20a9d0fb565ff327e2d.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [120, 46]}
sorl-thumbnail||image||0e9740a4ddbc24f03e99722cb2326914	{"name": "belts/brown_w_red.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [198, 119]}
sorl-thumbnail||image||c6e12677f603b29885dc770bdd007899	{"name": "cache/54/36/5436519ad50297e93e24ee2f052a278e.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [120, 46]}
sorl-thumbnail||image||5ec2f7c3c581c37ab7a177a3fe719d38	{"name": "belts/r_w_b.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [198, 119]}
sorl-thumbnail||image||27595fde746b5efd6a50298565142f01	{"name": "cache/ea/bd/eabd1ec7a4440f4fb3f0ee2111998173.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [120, 46]}
sorl-thumbnail||image||49ba8655b27269edb3bfae1b33e80d91	{"name": "belts/g_w_p.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [699, 267]}
sorl-thumbnail||thumbnails||6671b94280a0dd963aa28b7bd0c33ef7	["27595fde746b5efd6a50298565142f01"]
sorl-thumbnail||image||7b9e5d94783940b10219cd62e04f4507	{"name": "belts/o_w_g.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [698, 276]}
sorl-thumbnail||image||3b5aa6da09de31d0d632df4436b67b70	{"name": "cache/f5/ec/f5ecf128d94502eea114fc22c876912b.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [120, 46]}
sorl-thumbnail||image||61b020a119ded634ae772112782eabdc	{"name": "belts/p_w_b.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [698, 277]}
sorl-thumbnail||thumbnails||c34c3a245a70ddae5b81e675aeedd6e8	["3b5aa6da09de31d0d632df4436b67b70"]
sorl-thumbnail||image||a5f72f4d2cf5f7ab6772ba507d15a400	{"name": "belts/b_w_b.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [698, 277]}
sorl-thumbnail||image||fa8e6e7ac56c994f3d2f52a4e9786541	{"name": "cache/52/79/527990bc77ae6ba7032d0170fe95f0f9.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [120, 47]}
sorl-thumbnail||thumbnails||55c1050fc4cfb578093c4487e0aaaa9b	["fa8e6e7ac56c994f3d2f52a4e9786541"]
sorl-thumbnail||image||0279663d672754e1f4e612da238433c0	{"name": "instructor_photo/instr1.jpeg", "storage": "django.core.files.storage.FileSystemStorage", "size": [224, 224]}
sorl-thumbnail||image||be635d9bcc345717f2f9c5de48db1d43	{"name": "cache/e5/95/e5951b6729e59b148bafc25b75bce102.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [120, 46]}
sorl-thumbnail||thumbnails||97014aada91411298ad397d040f3c790	["be635d9bcc345717f2f9c5de48db1d43"]
sorl-thumbnail||image||9e4c48b265f9dea2a49025cfb408f21d	{"name": "cache/41/9e/419effcf73dfb678d29300c15ea55732.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [120, 47]}
sorl-thumbnail||image||e57b33d4620cbea8f0fbab8454d1ed95	{"name": "student_photo/goku-krillin-dragon-ball-z-ultimate-tenkaichi-master-roshi-dragon-ball-ori_dxhHfW6.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [310, 310]}
sorl-thumbnail||thumbnails||7b9e5d94783940b10219cd62e04f4507	["9e4c48b265f9dea2a49025cfb408f21d"]
sorl-thumbnail||image||d4ad694c7be863dc2ffc48b4c09c5fcb	{"name": "student_photo/tailung_ht94nrwv.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [360, 640]}
sorl-thumbnail||image||c11994fb9dac1de4f728f9cea07547d0	{"name": "cache/05/bf/05bf55033dca0080c09e187ecb910e8f.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [120, 46]}
sorl-thumbnail||image||995a3e37c60bcf07dc1ac63617b43f0a	{"name": "student_photo/kisspng-goku-gohan-frieza-master-roshi-vegeta-goku-5abe3aac75a6b7.02260044_PbxT9yu.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [260, 460]}
sorl-thumbnail||thumbnails||7559cac9e13183813c72f0257a38bb7b	["c11994fb9dac1de4f728f9cea07547d0"]
sorl-thumbnail||image||7c6311fc2ecaa567e5fcbe63e49474e4	{"name": "cache/71/24/712408918dc380fcd39956750b324340.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [120, 46]}
sorl-thumbnail||thumbnails||49ba8655b27269edb3bfae1b33e80d91	["7c6311fc2ecaa567e5fcbe63e49474e4"]
sorl-thumbnail||image||c7c7d0d9959cd2aa85ed49b9db035893	{"name": "cache/2d/e5/2de5a23d2ba39a87553b6a7e8bb0f8e2.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [120, 120]}
sorl-thumbnail||thumbnails||cb47b9026912b132f9413423a61d339f	["c7c7d0d9959cd2aa85ed49b9db035893"]
sorl-thumbnail||image||10c3a21b8f988858957c84da98378c55	{"name": "cache/ae/46/ae46f7efd3c7c175f1a2c88e86d6ce4a.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [120, 48]}
sorl-thumbnail||thumbnails||61b020a119ded634ae772112782eabdc	["10c3a21b8f988858957c84da98378c55"]
sorl-thumbnail||image||a3baca0a5868e7549caa714a27fc54ad	{"name": "cache/0f/d8/0fd8336153fd11ce24bb0fff6b37ef55.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [120, 120]}
sorl-thumbnail||thumbnails||dea875c9a24a8301ca807826b9219c5e	["a3baca0a5868e7549caa714a27fc54ad"]
sorl-thumbnail||image||23b3d4dfdbade8717b3a46146f47efb8	{"name": "cache/17/4c/174c1fc86bcbedf0cfd32bc5150753ae.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [120, 48]}
sorl-thumbnail||thumbnails||a5f72f4d2cf5f7ab6772ba507d15a400	["23b3d4dfdbade8717b3a46146f47efb8"]
sorl-thumbnail||image||4649ada47f62f80673c9cd10665c38fe	{"name": "student_photo/1fd84f1a5c5a145142fb387447998d83.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [807, 1024]}
sorl-thumbnail||image||572200f4e027ac30aad6e3efbacf068c	{"name": "cache/ea/38/ea38a2da9fe29d80081f91209e3fde20.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [120, 120]}
sorl-thumbnail||thumbnails||e1a588bc732f330ccc4fae7d7f67abff	["572200f4e027ac30aad6e3efbacf068c"]
sorl-thumbnail||image||d2beda55045e1e177a4b902cc1215143	{"name": "cache/85/fe/85fe07bf5af9866a64d44912a3abf67c.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [120, 72]}
sorl-thumbnail||thumbnails||0e9740a4ddbc24f03e99722cb2326914	["d2beda55045e1e177a4b902cc1215143"]
sorl-thumbnail||image||2ef05b1f8a90bf9b731ecdce025ad795	{"name": "student_photo/kisspng-ken-masters-super-street-fighter-iv-ryu-guile-5af1becf0c0368.53336_z7siNbL.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [900, 920]}
sorl-thumbnail||image||23e5931438063d7a13056ab35f3c9174	{"name": "cache/22/48/2248ae1fcf03573d254e6346c1794101.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [120, 120]}
sorl-thumbnail||image||66dc87928b5309b9fcc2388a6e11125c	{"name": "student_photo/kisspng-goku-gohan-frieza-master-roshi-vegeta-goku-5abe3aac75a6b7.02260044_TmITwIz.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [260, 460]}
sorl-thumbnail||thumbnails||f0450a325e8a1b8ca86a4843286297a2	["23e5931438063d7a13056ab35f3c9174"]
sorl-thumbnail||image||aa6f6e5d76125ac850a61100e2c6e5ba	{"name": "student_photo/krillin-vegeta-frieza-master-roshi-goku-goku-thumb.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [310, 751]}
sorl-thumbnail||image||4c3e3a4f06f5d63141284cc40b58a379	{"name": "cache/90/2b/902b0eb00aac59c7de85224168cf3c26.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [120, 72]}
sorl-thumbnail||image||531306f2f9acf4ce852f8526f1e2e7bc	{"name": "student_photo/street-fighter-iv-street-fighter-ii-the-world-warrior-ken-masters-ryu-stre_DbupKoI.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [310, 352]}
sorl-thumbnail||thumbnails||5ec2f7c3c581c37ab7a177a3fe719d38	["4c3e3a4f06f5d63141284cc40b58a379"]
sorl-thumbnail||image||0ec1ce16d775a2d7a4001c6bdd60fdf7	{"name": "instructor_photo/goku-monkey-d-luffy-vegeta-super-saiya-dragon-ball-goku-thumb.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [310, 357]}
sorl-thumbnail||image||7c6b518f741049d8e51c3950bc7fac9f	{"name": "cache/16/8d/168dc101df0bbe11dce496829affa422.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [120, 70]}
sorl-thumbnail||image||4569388161c869ff050ee19bc6195c18	{"name": "instructor_photo/street-fighter-iv-street-fighter-ii-the-world-warrior-ken-masters-ryu-s_V88f7aR.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [310, 352]}
sorl-thumbnail||thumbnails||b68802570fc355df4bca66dad6cbdc25	["7c6b518f741049d8e51c3950bc7fac9f"]
sorl-thumbnail||image||2e069f70031ebafd051047141b011d7e	{"name": "instructor_photo/street-fighter-iii-3rd-strike-street-fighter-iv-street-fighter-alpha-3-_AlS7AEL.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [310, 414]}
sorl-thumbnail||image||750c5c6f616554555201fc1fe34a35fa	{"name": "instructor_photo/goku-monkey-d-luffy-vegeta-dragon-ball-super-saiyan-goku-thumb.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [310, 434]}
sorl-thumbnail||image||dee5a6c950f89b7d4748aff68e1ee4da	{"name": "cache/0a/a9/0aa92214b7615e1967cf15d9afcf2a00.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [57, 80]}
sorl-thumbnail||thumbnails||750c5c6f616554555201fc1fe34a35fa	["dee5a6c950f89b7d4748aff68e1ee4da"]
sorl-thumbnail||thumbnails||0279663d672754e1f4e612da238433c0	["95f63859ac00549535699e6cfd13441c", "4e9cda3a49a56cc85b01dbe06d899263"]
sorl-thumbnail||thumbnails||8dd753dfa660b56bddfbc8d62de0dc34	["94c8127cfae429a11632892911283556", "d8e81561bbda2151f56f402bd42d8d6f"]
sorl-thumbnail||thumbnails||4bdbb44a7e84e4268886064bab7c3b2d	["8e1fd48574b74fccd26d6a958d21697a", "c6e12677f603b29885dc770bdd007899"]
sorl-thumbnail||image||4ce162b9df7fdec771a7dece8351b91c	{"name": "cache/5a/6f/5a6f8d04c49eca748401675bdd913adc.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [120, 120]}
sorl-thumbnail||thumbnails||4d9313d7f7cae7a9b08e1e17f8927916	["4ce162b9df7fdec771a7dece8351b91c"]
sorl-thumbnail||image||95f63859ac00549535699e6cfd13441c	{"name": "cache/e8/c9/e8c9b33fde32f3aa58aa4ead3b7bf78d.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [40, 40]}
sorl-thumbnail||image||f1045074c1dee64f93ed50daba9b55c6	{"name": "cache/b1/b3/b1b3ebee6feecd51492574d2bef9c7e8.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [106, 120]}
sorl-thumbnail||thumbnails||531306f2f9acf4ce852f8526f1e2e7bc	["f1045074c1dee64f93ed50daba9b55c6"]
sorl-thumbnail||image||8e1fd48574b74fccd26d6a958d21697a	{"name": "cache/3d/f8/3df86e34080b86cfa12fe7ad83618cc5.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [120, 46]}
sorl-thumbnail||image||6347e1f51507d38a2d96241ce1d342ea	{"name": "cache/45/da/45da3b4068e3c2a0717cb5aefb58bfb9.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [50, 120]}
sorl-thumbnail||thumbnails||aa6f6e5d76125ac850a61100e2c6e5ba	["6347e1f51507d38a2d96241ce1d342ea"]
sorl-thumbnail||image||94c8127cfae429a11632892911283556	{"name": "cache/e1/6e/e16e39d042e3ca356cae66a8d3514ced.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [120, 46]}
sorl-thumbnail||image||81bf996de0e43067b28c3d4f7d4573b3	{"name": "cache/fd/a3/fda34b4ad1beba8ce10af16a53aa0c35.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [117, 120]}
sorl-thumbnail||thumbnails||2ef05b1f8a90bf9b731ecdce025ad795	["81bf996de0e43067b28c3d4f7d4573b3"]
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 80, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 92, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 20, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 25, true);


--
-- Name: structaq_answertype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.structaq_answertype_id_seq', 3, true);


--
-- Name: structaq_challengetype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.structaq_challengetype_id_seq', 27, true);


--
-- Name: structaq_factstudentchallenge_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.structaq_factstudentchallenge_id_seq', 32, true);


--
-- Name: structaq_factstudentchallengehistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.structaq_factstudentchallengehistory_id_seq', 28, true);


--
-- Name: structaq_factstudentcurriculum_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.structaq_factstudentcurriculum_id_seq', 6, true);


--
-- Name: structaq_featurechallenge_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.structaq_featurechallenge_id_seq', 473, true);


--
-- Name: structaq_featurechallengecurriculum_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.structaq_featurechallengecurriculum_id_seq', 519, true);


--
-- Name: structaq_featurecurriculum_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.structaq_featurecurriculum_id_seq', 20, true);


--
-- Name: structaq_featureinstructor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.structaq_featureinstructor_id_seq', 5, true);


--
-- Name: structaq_featureprogression_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.structaq_featureprogression_id_seq', 4, false);


--
-- Name: structaq_featurestudent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.structaq_featurestudent_id_seq', 7, false);


--
-- Name: structaq_featurestudentprogression_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.structaq_featurestudentprogression_id_seq', 6, false);


--
-- Name: structaq_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.structaq_user_groups_id_seq', 1, false);


--
-- Name: structaq_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.structaq_user_id_seq', 11, true);


--
-- Name: structaq_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.structaq_user_user_permissions_id_seq', 112, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: structaq_answertype structaq_answertype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_answertype
    ADD CONSTRAINT structaq_answertype_pkey PRIMARY KEY (id);


--
-- Name: structaq_challengetype structaq_challengetype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_challengetype
    ADD CONSTRAINT structaq_challengetype_pkey PRIMARY KEY (id);


--
-- Name: structaq_factstudentchallenge structaq_factstudentchallenge_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_factstudentchallenge
    ADD CONSTRAINT structaq_factstudentchallenge_pkey PRIMARY KEY (id);


--
-- Name: structaq_factstudentchallengehistory structaq_factstudentchallengehistory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_factstudentchallengehistory
    ADD CONSTRAINT structaq_factstudentchallengehistory_pkey PRIMARY KEY (id);


--
-- Name: structaq_factstudentcurriculum structaq_factstudentcurriculum_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_factstudentcurriculum
    ADD CONSTRAINT structaq_factstudentcurriculum_pkey PRIMARY KEY (id);


--
-- Name: structaq_featurechallenge structaq_featurechallenge_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_featurechallenge
    ADD CONSTRAINT structaq_featurechallenge_pkey PRIMARY KEY (id);


--
-- Name: structaq_featurechallengecurriculum structaq_featurechallengecurriculum_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_featurechallengecurriculum
    ADD CONSTRAINT structaq_featurechallengecurriculum_pkey PRIMARY KEY (id);


--
-- Name: structaq_featurecurriculum structaq_featurecurriculum_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_featurecurriculum
    ADD CONSTRAINT structaq_featurecurriculum_pkey PRIMARY KEY (id);


--
-- Name: structaq_featureinstructor structaq_featureinstructor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_featureinstructor
    ADD CONSTRAINT structaq_featureinstructor_pkey PRIMARY KEY (id);


--
-- Name: structaq_featureprogression structaq_featureprogression_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_featureprogression
    ADD CONSTRAINT structaq_featureprogression_pkey PRIMARY KEY (id);


--
-- Name: structaq_featurestudent structaq_featurestudent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_featurestudent
    ADD CONSTRAINT structaq_featurestudent_pkey PRIMARY KEY (id);


--
-- Name: structaq_featurestudentprogression structaq_featurestudentprogression_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_featurestudentprogression
    ADD CONSTRAINT structaq_featurestudentprogression_pkey PRIMARY KEY (id);


--
-- Name: structaq_user_groups structaq_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_user_groups
    ADD CONSTRAINT structaq_user_groups_pkey PRIMARY KEY (id);


--
-- Name: structaq_user_groups structaq_user_groups_user_id_group_id_40da40e2_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_user_groups
    ADD CONSTRAINT structaq_user_groups_user_id_group_id_40da40e2_uniq UNIQUE (user_id, group_id);


--
-- Name: structaq_user structaq_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_user
    ADD CONSTRAINT structaq_user_pkey PRIMARY KEY (id);


--
-- Name: structaq_user_user_permissions structaq_user_user_permi_user_id_permission_id_c338c3dc_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_user_user_permissions
    ADD CONSTRAINT structaq_user_user_permi_user_id_permission_id_c338c3dc_uniq UNIQUE (user_id, permission_id);


--
-- Name: structaq_user_user_permissions structaq_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_user_user_permissions
    ADD CONSTRAINT structaq_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: structaq_user structaq_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_user
    ADD CONSTRAINT structaq_user_username_key UNIQUE (username);


--
-- Name: thumbnail_kvstore thumbnail_kvstore_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thumbnail_kvstore
    ADD CONSTRAINT thumbnail_kvstore_pkey PRIMARY KEY (key);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: structaq_answertype_name_8be02acc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_answertype_name_8be02acc ON public.structaq_answertype USING btree (name);


--
-- Name: structaq_answertype_name_8be02acc_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_answertype_name_8be02acc_like ON public.structaq_answertype USING btree (name varchar_pattern_ops);


--
-- Name: structaq_answertype_short_34df7fce; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_answertype_short_34df7fce ON public.structaq_answertype USING btree (short);


--
-- Name: structaq_answertype_short_34df7fce_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_answertype_short_34df7fce_like ON public.structaq_answertype USING btree (short varchar_pattern_ops);


--
-- Name: structaq_challengetype_name_a0b4af0f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_challengetype_name_a0b4af0f ON public.structaq_challengetype USING btree (name);


--
-- Name: structaq_challengetype_name_a0b4af0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_challengetype_name_a0b4af0f_like ON public.structaq_challengetype USING btree (name varchar_pattern_ops);


--
-- Name: structaq_challengetype_short_51ed50d1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_challengetype_short_51ed50d1 ON public.structaq_challengetype USING btree (short);


--
-- Name: structaq_challengetype_short_51ed50d1_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_challengetype_short_51ed50d1_like ON public.structaq_challengetype USING btree (short varchar_pattern_ops);


--
-- Name: structaq_factstudentchallenge_challenge_id_1556fea4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_factstudentchallenge_challenge_id_1556fea4 ON public.structaq_factstudentchallenge USING btree (challenge_id);


--
-- Name: structaq_factstudentchallenge_enddate_2a3b0946; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_factstudentchallenge_enddate_2a3b0946 ON public.structaq_factstudentchallenge USING btree (enddate);


--
-- Name: structaq_factstudentchallenge_instructed_date_4668153a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_factstudentchallenge_instructed_date_4668153a ON public.structaq_factstudentchallenge USING btree (instructed_date);


--
-- Name: structaq_factstudentchallenge_instructor_id_819add27; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_factstudentchallenge_instructor_id_819add27 ON public.structaq_factstudentchallenge USING btree (instructor_id);


--
-- Name: structaq_factstudentchallenge_pass_date_2ef06546; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_factstudentchallenge_pass_date_2ef06546 ON public.structaq_factstudentchallenge USING btree (pass_date);


--
-- Name: structaq_factstudentchallenge_startdate_c657413d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_factstudentchallenge_startdate_c657413d ON public.structaq_factstudentchallenge USING btree (startdate);


--
-- Name: structaq_factstudentchallenge_student_id_1454dd73; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_factstudentchallenge_student_id_1454dd73 ON public.structaq_factstudentchallenge USING btree (student_id);


--
-- Name: structaq_factstudentchallengehistory_challenge_id_326b5b1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_factstudentchallengehistory_challenge_id_326b5b1b ON public.structaq_factstudentchallengehistory USING btree (challenge_id);


--
-- Name: structaq_factstudentchallengehistory_instructed_date_c95055b2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_factstudentchallengehistory_instructed_date_c95055b2 ON public.structaq_factstudentchallengehistory USING btree (instructed_date);


--
-- Name: structaq_factstudentchallengehistory_instructor_id_9f033e72; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_factstudentchallengehistory_instructor_id_9f033e72 ON public.structaq_factstudentchallengehistory USING btree (instructor_id);


--
-- Name: structaq_factstudentchallengehistory_pass_date_4070d9ec; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_factstudentchallengehistory_pass_date_4070d9ec ON public.structaq_factstudentchallengehistory USING btree (pass_date);


--
-- Name: structaq_factstudentchallengehistory_student_id_1492a280; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_factstudentchallengehistory_student_id_1492a280 ON public.structaq_factstudentchallengehistory USING btree (student_id);


--
-- Name: structaq_factstudentcurriculum_curriculum_id_8880566f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_factstudentcurriculum_curriculum_id_8880566f ON public.structaq_factstudentcurriculum USING btree (curriculum_id);


--
-- Name: structaq_factstudentcurriculum_enddate_36646e82; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_factstudentcurriculum_enddate_36646e82 ON public.structaq_factstudentcurriculum USING btree (enddate);


--
-- Name: structaq_factstudentcurriculum_progression_id_63af450c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_factstudentcurriculum_progression_id_63af450c ON public.structaq_factstudentcurriculum USING btree (progression_id);


--
-- Name: structaq_factstudentcurriculum_startdate_17b0219b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_factstudentcurriculum_startdate_17b0219b ON public.structaq_factstudentcurriculum USING btree (startdate);


--
-- Name: structaq_factstudentcurriculum_student_id_d0896276; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_factstudentcurriculum_student_id_d0896276 ON public.structaq_factstudentcurriculum USING btree (student_id);


--
-- Name: structaq_featurechallenge_answer_df8cb54d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_featurechallenge_answer_df8cb54d ON public.structaq_featurechallenge USING btree (answer);


--
-- Name: structaq_featurechallenge_answer_df8cb54d_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_featurechallenge_answer_df8cb54d_like ON public.structaq_featurechallenge USING btree (answer varchar_pattern_ops);


--
-- Name: structaq_featurechallenge_answertype_id_4143668b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_featurechallenge_answertype_id_4143668b ON public.structaq_featurechallenge USING btree (answertype_id);


--
-- Name: structaq_featurechallenge_challengetype_id_a705d854; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_featurechallenge_challengetype_id_a705d854 ON public.structaq_featurechallenge USING btree (challengetype_id);


--
-- Name: structaq_featurechallenge_name_c9905aa9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_featurechallenge_name_c9905aa9 ON public.structaq_featurechallenge USING btree (name);


--
-- Name: structaq_featurechallenge_name_c9905aa9_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_featurechallenge_name_c9905aa9_like ON public.structaq_featurechallenge USING btree (name varchar_pattern_ops);


--
-- Name: structaq_featurechallenge_short_4d25bb63; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_featurechallenge_short_4d25bb63 ON public.structaq_featurechallenge USING btree (short);


--
-- Name: structaq_featurechallenge_short_4d25bb63_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_featurechallenge_short_4d25bb63_like ON public.structaq_featurechallenge USING btree (short varchar_pattern_ops);


--
-- Name: structaq_featurechallengecurriculum_challenge_id_43bd70ed; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_featurechallengecurriculum_challenge_id_43bd70ed ON public.structaq_featurechallengecurriculum USING btree (challenge_id);


--
-- Name: structaq_featurechallengecurriculum_curriculum_id_b8b8aa67; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_featurechallengecurriculum_curriculum_id_b8b8aa67 ON public.structaq_featurechallengecurriculum USING btree (curriculum_id);


--
-- Name: structaq_featurechallengecurriculum_progression_id_0487dab6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_featurechallengecurriculum_progression_id_0487dab6 ON public.structaq_featurechallengecurriculum USING btree (progression_id);


--
-- Name: structaq_featurecurriculum_name_2e51d0b7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_featurecurriculum_name_2e51d0b7 ON public.structaq_featurecurriculum USING btree (name);


--
-- Name: structaq_featurecurriculum_name_2e51d0b7_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_featurecurriculum_name_2e51d0b7_like ON public.structaq_featurecurriculum USING btree (name varchar_pattern_ops);


--
-- Name: structaq_featurecurriculum_progression_id_844c6537; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_featurecurriculum_progression_id_844c6537 ON public.structaq_featurecurriculum USING btree (progression_id);


--
-- Name: structaq_featurecurriculum_short_6fba3ff8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_featurecurriculum_short_6fba3ff8 ON public.structaq_featurecurriculum USING btree (short);


--
-- Name: structaq_featurecurriculum_short_6fba3ff8_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_featurecurriculum_short_6fba3ff8_like ON public.structaq_featurecurriculum USING btree (short varchar_pattern_ops);


--
-- Name: structaq_featureinstructor_birthdate_7a1e669a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_featureinstructor_birthdate_7a1e669a ON public.structaq_featureinstructor USING btree (birthdate);


--
-- Name: structaq_featureinstructor_enddate_30caaeb9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_featureinstructor_enddate_30caaeb9 ON public.structaq_featureinstructor USING btree (enddate);


--
-- Name: structaq_featureinstructor_first_a1862cc6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_featureinstructor_first_a1862cc6 ON public.structaq_featureinstructor USING btree (first_name);


--
-- Name: structaq_featureinstructor_first_a1862cc6_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_featureinstructor_first_a1862cc6_like ON public.structaq_featureinstructor USING btree (first_name varchar_pattern_ops);


--
-- Name: structaq_featureinstructor_full_70975f77; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_featureinstructor_full_70975f77 ON public.structaq_featureinstructor USING btree (full_name);


--
-- Name: structaq_featureinstructor_full_70975f77_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_featureinstructor_full_70975f77_like ON public.structaq_featureinstructor USING btree (full_name varchar_pattern_ops);


--
-- Name: structaq_featureinstructor_last_a4f8710d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_featureinstructor_last_a4f8710d ON public.structaq_featureinstructor USING btree (last_name);


--
-- Name: structaq_featureinstructor_last_a4f8710d_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_featureinstructor_last_a4f8710d_like ON public.structaq_featureinstructor USING btree (last_name varchar_pattern_ops);


--
-- Name: structaq_featureinstructor_middle_8b8bbe33; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_featureinstructor_middle_8b8bbe33 ON public.structaq_featureinstructor USING btree (middle_name);


--
-- Name: structaq_featureinstructor_middle_8b8bbe33_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_featureinstructor_middle_8b8bbe33_like ON public.structaq_featureinstructor USING btree (middle_name varchar_pattern_ops);


--
-- Name: structaq_featureinstructor_startdate_22e9e492; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_featureinstructor_startdate_22e9e492 ON public.structaq_featureinstructor USING btree (startdate);


--
-- Name: structaq_featureinstructor_user_id_5e9798a5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_featureinstructor_user_id_5e9798a5 ON public.structaq_featureinstructor USING btree (user_id);


--
-- Name: structaq_featureprogression_name_f46fb51a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_featureprogression_name_f46fb51a ON public.structaq_featureprogression USING btree (name);


--
-- Name: structaq_featureprogression_name_f46fb51a_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_featureprogression_name_f46fb51a_like ON public.structaq_featureprogression USING btree (name varchar_pattern_ops);


--
-- Name: structaq_featureprogression_short_d0d5bdf6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_featureprogression_short_d0d5bdf6 ON public.structaq_featureprogression USING btree (short);


--
-- Name: structaq_featureprogression_short_d0d5bdf6_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_featureprogression_short_d0d5bdf6_like ON public.structaq_featureprogression USING btree (short varchar_pattern_ops);


--
-- Name: structaq_featurestudent_birthdate_88bf29d9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_featurestudent_birthdate_88bf29d9 ON public.structaq_featurestudent USING btree (birthdate);


--
-- Name: structaq_featurestudent_enddate_32fc17e5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_featurestudent_enddate_32fc17e5 ON public.structaq_featurestudent USING btree (enddate);


--
-- Name: structaq_featurestudent_first_c00cbd9b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_featurestudent_first_c00cbd9b ON public.structaq_featurestudent USING btree (first_name);


--
-- Name: structaq_featurestudent_first_c00cbd9b_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_featurestudent_first_c00cbd9b_like ON public.structaq_featurestudent USING btree (first_name varchar_pattern_ops);


--
-- Name: structaq_featurestudent_full_94345c58; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_featurestudent_full_94345c58 ON public.structaq_featurestudent USING btree (full_name);


--
-- Name: structaq_featurestudent_full_94345c58_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_featurestudent_full_94345c58_like ON public.structaq_featurestudent USING btree (full_name varchar_pattern_ops);


--
-- Name: structaq_featurestudent_last_3e89f1f7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_featurestudent_last_3e89f1f7 ON public.structaq_featurestudent USING btree (last_name);


--
-- Name: structaq_featurestudent_last_3e89f1f7_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_featurestudent_last_3e89f1f7_like ON public.structaq_featurestudent USING btree (last_name varchar_pattern_ops);


--
-- Name: structaq_featurestudent_middle_060723e5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_featurestudent_middle_060723e5 ON public.structaq_featurestudent USING btree (middle_name);


--
-- Name: structaq_featurestudent_middle_060723e5_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_featurestudent_middle_060723e5_like ON public.structaq_featurestudent USING btree (middle_name varchar_pattern_ops);


--
-- Name: structaq_featurestudent_startdate_6cb6eb9c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_featurestudent_startdate_6cb6eb9c ON public.structaq_featurestudent USING btree (startdate);


--
-- Name: structaq_featurestudent_user_id_49d2fb02; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_featurestudent_user_id_49d2fb02 ON public.structaq_featurestudent USING btree (user_id);


--
-- Name: structaq_featurestudentprogression_enddate_285d5302; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_featurestudentprogression_enddate_285d5302 ON public.structaq_featurestudentprogression USING btree (enddate);


--
-- Name: structaq_featurestudentprogression_progression_id_ecfa503d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_featurestudentprogression_progression_id_ecfa503d ON public.structaq_featurestudentprogression USING btree (progression_id);


--
-- Name: structaq_featurestudentprogression_startdate_356195f7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_featurestudentprogression_startdate_356195f7 ON public.structaq_featurestudentprogression USING btree (startdate);


--
-- Name: structaq_featurestudentprogression_student_id_6d8ff2b2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_featurestudentprogression_student_id_6d8ff2b2 ON public.structaq_featurestudentprogression USING btree (student_id);


--
-- Name: structaq_user_birthdate_4744b10c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_user_birthdate_4744b10c ON public.structaq_user USING btree (birthdate);


--
-- Name: structaq_user_enddate_e35b966a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_user_enddate_e35b966a ON public.structaq_user USING btree (enddate);


--
-- Name: structaq_user_groups_group_id_5b416a67; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_user_groups_group_id_5b416a67 ON public.structaq_user_groups USING btree (group_id);


--
-- Name: structaq_user_groups_user_id_c5fd7d7a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_user_groups_user_id_c5fd7d7a ON public.structaq_user_groups USING btree (user_id);


--
-- Name: structaq_user_password_3356a611; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_user_password_3356a611 ON public.structaq_user USING btree (password);


--
-- Name: structaq_user_password_3356a611_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_user_password_3356a611_like ON public.structaq_user USING btree (password varchar_pattern_ops);


--
-- Name: structaq_user_startdate_05014a8e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_user_startdate_05014a8e ON public.structaq_user USING btree (startdate);


--
-- Name: structaq_user_user_permissions_permission_id_59450c43; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_user_user_permissions_permission_id_59450c43 ON public.structaq_user_user_permissions USING btree (permission_id);


--
-- Name: structaq_user_user_permissions_user_id_8bb542ad; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_user_user_permissions_user_id_8bb542ad ON public.structaq_user_user_permissions USING btree (user_id);


--
-- Name: structaq_user_username_8afd26e3_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX structaq_user_username_8afd26e3_like ON public.structaq_user USING btree (username varchar_pattern_ops);


--
-- Name: thumbnail_kvstore_key_3f850178_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX thumbnail_kvstore_key_3f850178_like ON public.thumbnail_kvstore USING btree (key varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_structaq_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_structaq_user_id FOREIGN KEY (user_id) REFERENCES public.structaq_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: structaq_factstudentchallenge structaq_factstudent_challenge_id_1556fea4_fk_structaq_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_factstudentchallenge
    ADD CONSTRAINT structaq_factstudent_challenge_id_1556fea4_fk_structaq_ FOREIGN KEY (challenge_id) REFERENCES public.structaq_featurechallenge(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: structaq_factstudentchallengehistory structaq_factstudent_challenge_id_326b5b1b_fk_structaq_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_factstudentchallengehistory
    ADD CONSTRAINT structaq_factstudent_challenge_id_326b5b1b_fk_structaq_ FOREIGN KEY (challenge_id) REFERENCES public.structaq_featurechallenge(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: structaq_factstudentcurriculum structaq_factstudent_curriculum_id_8880566f_fk_structaq_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_factstudentcurriculum
    ADD CONSTRAINT structaq_factstudent_curriculum_id_8880566f_fk_structaq_ FOREIGN KEY (curriculum_id) REFERENCES public.structaq_featurecurriculum(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: structaq_factstudentchallenge structaq_factstudent_instructor_id_819add27_fk_structaq_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_factstudentchallenge
    ADD CONSTRAINT structaq_factstudent_instructor_id_819add27_fk_structaq_ FOREIGN KEY (instructor_id) REFERENCES public.structaq_featureinstructor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: structaq_factstudentchallengehistory structaq_factstudent_instructor_id_9f033e72_fk_structaq_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_factstudentchallengehistory
    ADD CONSTRAINT structaq_factstudent_instructor_id_9f033e72_fk_structaq_ FOREIGN KEY (instructor_id) REFERENCES public.structaq_featureinstructor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: structaq_factstudentcurriculum structaq_factstudent_progression_id_63af450c_fk_structaq_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_factstudentcurriculum
    ADD CONSTRAINT structaq_factstudent_progression_id_63af450c_fk_structaq_ FOREIGN KEY (progression_id) REFERENCES public.structaq_featureprogression(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: structaq_factstudentchallenge structaq_factstudent_student_id_1454dd73_fk_structaq_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_factstudentchallenge
    ADD CONSTRAINT structaq_factstudent_student_id_1454dd73_fk_structaq_ FOREIGN KEY (student_id) REFERENCES public.structaq_featurestudent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: structaq_factstudentchallengehistory structaq_factstudent_student_id_1492a280_fk_structaq_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_factstudentchallengehistory
    ADD CONSTRAINT structaq_factstudent_student_id_1492a280_fk_structaq_ FOREIGN KEY (student_id) REFERENCES public.structaq_featurestudent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: structaq_factstudentcurriculum structaq_factstudent_student_id_d0896276_fk_structaq_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_factstudentcurriculum
    ADD CONSTRAINT structaq_factstudent_student_id_d0896276_fk_structaq_ FOREIGN KEY (student_id) REFERENCES public.structaq_featurestudent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: structaq_featurechallenge structaq_featurechal_answertype_id_4143668b_fk_structaq_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_featurechallenge
    ADD CONSTRAINT structaq_featurechal_answertype_id_4143668b_fk_structaq_ FOREIGN KEY (answertype_id) REFERENCES public.structaq_answertype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: structaq_featurechallengecurriculum structaq_featurechal_challenge_id_43bd70ed_fk_structaq_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_featurechallengecurriculum
    ADD CONSTRAINT structaq_featurechal_challenge_id_43bd70ed_fk_structaq_ FOREIGN KEY (challenge_id) REFERENCES public.structaq_featurechallenge(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: structaq_featurechallenge structaq_featurechal_challengetype_id_a705d854_fk_structaq_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_featurechallenge
    ADD CONSTRAINT structaq_featurechal_challengetype_id_a705d854_fk_structaq_ FOREIGN KEY (challengetype_id) REFERENCES public.structaq_challengetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: structaq_featurechallengecurriculum structaq_featurechal_curriculum_id_b8b8aa67_fk_structaq_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_featurechallengecurriculum
    ADD CONSTRAINT structaq_featurechal_curriculum_id_b8b8aa67_fk_structaq_ FOREIGN KEY (curriculum_id) REFERENCES public.structaq_featurecurriculum(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: structaq_featurechallengecurriculum structaq_featurechal_progression_id_0487dab6_fk_structaq_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_featurechallengecurriculum
    ADD CONSTRAINT structaq_featurechal_progression_id_0487dab6_fk_structaq_ FOREIGN KEY (progression_id) REFERENCES public.structaq_featureprogression(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: structaq_featurecurriculum structaq_featurecurr_progression_id_844c6537_fk_structaq_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_featurecurriculum
    ADD CONSTRAINT structaq_featurecurr_progression_id_844c6537_fk_structaq_ FOREIGN KEY (progression_id) REFERENCES public.structaq_featureprogression(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: structaq_featureinstructor structaq_featureinstructor_user_id_5e9798a5_fk_structaq_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_featureinstructor
    ADD CONSTRAINT structaq_featureinstructor_user_id_5e9798a5_fk_structaq_user_id FOREIGN KEY (user_id) REFERENCES public.structaq_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: structaq_featurestudentprogression structaq_featurestud_progression_id_ecfa503d_fk_structaq_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_featurestudentprogression
    ADD CONSTRAINT structaq_featurestud_progression_id_ecfa503d_fk_structaq_ FOREIGN KEY (progression_id) REFERENCES public.structaq_featureprogression(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: structaq_featurestudentprogression structaq_featurestud_student_id_6d8ff2b2_fk_structaq_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_featurestudentprogression
    ADD CONSTRAINT structaq_featurestud_student_id_6d8ff2b2_fk_structaq_ FOREIGN KEY (student_id) REFERENCES public.structaq_featurestudent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: structaq_featurestudent structaq_featurestudent_user_id_49d2fb02_fk_structaq_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_featurestudent
    ADD CONSTRAINT structaq_featurestudent_user_id_49d2fb02_fk_structaq_user_id FOREIGN KEY (user_id) REFERENCES public.structaq_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: structaq_user_groups structaq_user_groups_group_id_5b416a67_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_user_groups
    ADD CONSTRAINT structaq_user_groups_group_id_5b416a67_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: structaq_user_groups structaq_user_groups_user_id_c5fd7d7a_fk_structaq_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_user_groups
    ADD CONSTRAINT structaq_user_groups_user_id_c5fd7d7a_fk_structaq_user_id FOREIGN KEY (user_id) REFERENCES public.structaq_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: structaq_user_user_permissions structaq_user_user_p_permission_id_59450c43_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_user_user_permissions
    ADD CONSTRAINT structaq_user_user_p_permission_id_59450c43_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: structaq_user_user_permissions structaq_user_user_p_user_id_8bb542ad_fk_structaq_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structaq_user_user_permissions
    ADD CONSTRAINT structaq_user_user_p_user_id_8bb542ad_fk_structaq_ FOREIGN KEY (user_id) REFERENCES public.structaq_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--
