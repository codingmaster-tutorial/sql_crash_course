-- Log in to psql:
-- sudo -u postgres psql

-- use "\du" to check current users
-- use "\l" to check current databases

-- create user
CREATE USER codingmaster WITH PASSWORD '12345678';

-- give create database privilege
ALTER USER codingmaster WITH CREATEDB;

-- delete user
DROP USER codingmaster;

-- create user with password and createdb privilege
CREATE USER codingmaster WITH PASSWORD '12345678' CREATEDB;

-- create database
CREATE DATABASE postgres_tutorial;

-- give the owner of the database to codingmaster
ALTER DATABASE postgres_tutorial OWNER TO codingmaster;

-- create table public.teams
CREATE TABLE public.teams
(
    id integer NOT NULL,
    name character varying NOT NULL,
    played integer NOT NULL,
    win integer NOT NULL,
    loss integer NOT NULL,
    draw integer NOT NULL,
    CONSTRAINT teams_pkey PRIMARY KEY (id)
);

-- create table public.players
CREATE TABLE public.players
(
    id integer NOT NULL,
    name character varying NOT NULL,
    team_id integer NOT NULL,
    birthday date NOT NULL,
    nationality character varying NOT NULL,
    "position" character varying NOT NULL,
    minutes_played integer NOT NULL,
    goal_scored integer NOT NULL,
    assists integer NOT NULL,
    CONSTRAINT players_pkey PRIMARY KEY (id),
    CONSTRAINT player_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(id) ON DELETE CASCADE
);