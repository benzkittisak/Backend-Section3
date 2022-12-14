PGDMP     !    6                z            MombieStreetAssign    14.5    14.5 $    $           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            %           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            &           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            '           1262    16394    MombieStreetAssign    DATABASE     _   CREATE DATABASE "MombieStreetAssign" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';
 $   DROP DATABASE "MombieStreetAssign";
                postgres    false                        2615    16448    library    SCHEMA        CREATE SCHEMA library;
    DROP SCHEMA library;
                postgres    false            ?            1259    16450    author    TABLE     ?   CREATE TABLE library.author (
    author_id integer NOT NULL,
    first_name text,
    family_name text,
    date_of_birth date,
    date_of_death date,
    name text,
    lifespan text,
    url text
);
    DROP TABLE library.author;
       library         heap    postgres    false    5            ?            1259    16469    author_author_id_seq    SEQUENCE     ?   ALTER TABLE library.author ALTER COLUMN author_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME library.author_author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            library          postgres    false    215    5            ?            1259    16457    book    TABLE     ?   CREATE TABLE library.book (
    book_id integer NOT NULL,
    title text,
    author_id integer,
    summary text,
    "ISBN" text,
    url text
);
    DROP TABLE library.book;
       library         heap    postgres    false    5            ?            1259    16470    book_book_id_seq    SEQUENCE     ?   ALTER TABLE library.book ALTER COLUMN book_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME library.book_book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            library          postgres    false    216    5            ?            1259    16438    accounts    TABLE     %  CREATE TABLE public.accounts (
    user_id integer NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
    email character varying(255) NOT NULL,
    created_on timestamp without time zone NOT NULL,
    last_login timestamp without time zone
);
    DROP TABLE public.accounts;
       public         heap    postgres    false            ?            1259    16437    accounts_user_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.accounts_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.accounts_user_id_seq;
       public          postgres    false    214            (           0    0    accounts_user_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.accounts_user_id_seq OWNED BY public.accounts.user_id;
          public          postgres    false    213            ?            1259    16427 	   addresses    TABLE     ?   CREATE TABLE public.addresses (
    user_id integer NOT NULL,
    street character varying(30) NOT NULL,
    city character varying(30) NOT NULL,
    state character varying(30) NOT NULL
);
    DROP TABLE public.addresses;
       public         heap    postgres    false            ?            1259    16419    users    TABLE     ?   CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(25) NOT NULL,
    enabled boolean DEFAULT true,
    last_login timestamp without time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            ?            1259    16418    users_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    211            )           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    210            }           2604    16441    accounts user_id    DEFAULT     t   ALTER TABLE ONLY public.accounts ALTER COLUMN user_id SET DEFAULT nextval('public.accounts_user_id_seq'::regclass);
 ?   ALTER TABLE public.accounts ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    214    213    214            z           2604    16422    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    210    211                      0    16450    author 
   TABLE DATA           x   COPY library.author (author_id, first_name, family_name, date_of_birth, date_of_death, name, lifespan, url) FROM stdin;
    library          postgres    false    215   ?'                 0    16457    book 
   TABLE DATA           P   COPY library.book (book_id, title, author_id, summary, "ISBN", url) FROM stdin;
    library          postgres    false    216   (                 0    16438    accounts 
   TABLE DATA           ^   COPY public.accounts (user_id, username, password, email, created_on, last_login) FROM stdin;
    public          postgres    false    214   K(                 0    16427 	   addresses 
   TABLE DATA           A   COPY public.addresses (user_id, street, city, state) FROM stdin;
    public          postgres    false    212   h(                 0    16419    users 
   TABLE DATA           B   COPY public.users (id, username, enabled, last_login) FROM stdin;
    public          postgres    false    211   ?(       *           0    0    author_author_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('library.author_author_id_seq', 2, true);
          library          postgres    false    217            +           0    0    book_book_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('library.book_book_id_seq', 3, true);
          library          postgres    false    218            ,           0    0    accounts_user_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.accounts_user_id_seq', 1, false);
          public          postgres    false    213            -           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 1, false);
          public          postgres    false    210            ?           2606    16456    author author_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY library.author
    ADD CONSTRAINT author_pkey PRIMARY KEY (author_id);
 =   ALTER TABLE ONLY library.author DROP CONSTRAINT author_pkey;
       library            postgres    false    215            ?           2606    16463    book book_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY library.book
    ADD CONSTRAINT book_pkey PRIMARY KEY (book_id);
 9   ALTER TABLE ONLY library.book DROP CONSTRAINT book_pkey;
       library            postgres    false    216            ?           2606    16447    accounts accounts_email_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_email_key UNIQUE (email);
 E   ALTER TABLE ONLY public.accounts DROP CONSTRAINT accounts_email_key;
       public            postgres    false    214            ?           2606    16443    accounts accounts_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (user_id);
 @   ALTER TABLE ONLY public.accounts DROP CONSTRAINT accounts_pkey;
       public            postgres    false    214            ?           2606    16445    accounts accounts_username_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_username_key UNIQUE (username);
 H   ALTER TABLE ONLY public.accounts DROP CONSTRAINT accounts_username_key;
       public            postgres    false    214            ?           2606    16431    addresses addresses_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (user_id);
 B   ALTER TABLE ONLY public.addresses DROP CONSTRAINT addresses_pkey;
       public            postgres    false    212                       2606    16426    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    211            ?           2606    16464    book book_author_fk    FK CONSTRAINT     ~   ALTER TABLE ONLY library.book
    ADD CONSTRAINT book_author_fk FOREIGN KEY (author_id) REFERENCES library.author(author_id);
 >   ALTER TABLE ONLY library.book DROP CONSTRAINT book_author_fk;
       library          postgres    false    215    3465    216            ?           2606    16432    addresses fk_user_id    FK CONSTRAINT     s   ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES public.users(id);
 >   ALTER TABLE ONLY public.addresses DROP CONSTRAINT fk_user_id;
       public          postgres    false    3455    211    212               G   x?3???,)?,N?VH??)MM??,???K?4400?50?54?4A0s???A8??31?S8SRR?b???? jb?         3   x?3???V???????4???/J?UHO,NIL?L??())????????? !H            x?????? ? ?            x?????? ? ?            x?????? ? ?     