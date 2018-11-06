drop schema if exists cftest;
create schema cftest;
use cftest;

create table users (
	id integer primary key auto_increment,
    username varchar(50),
    f_name varchar(20),
    s_name varchar(20),
    password_hash varchar(150)
)
engine = InnoDB;

create table states (
	id integer primary key auto_increment,
    state varchar(10)
)
engine = InnoDB;

create table urgencies (
	id integer primary key auto_increment,
    urgency varchar(16)
)
engine = InnoDB;

create table criticalities (
	id integer primary key auto_increment,
    criticality varchar(20)
)
engine = InnoDB;

create table mistakes (
	id integer primary key auto_increment,
    created_at datetime,
    short_desc varchar(100),
    long_desc varchar(500),
    id_user integer,
    id_state integer,
    id_urgency integer,
    id_criticality integer,
    
	foreign key (id_user) references users (id),
    foreign key (id_state) references states (id),
    foreign key (id_urgency) references urgencies (id),
    foreign key (id_criticality) references criticalities (id)
)
engine = InnoDB;

create table acts (
	id integer primary key auto_increment,
    act varchar(10)
)
engine = InnoDB;

create table stories (
	id integer primary key auto_increment,
    updated_at datetime,
    comment varchar(200),
    id_act integer,
    id_user integer,
    
    foreign key (id_act) references acts (id),
    foreign key (id_user) references users (id)
)
engine = InnoDB;

create table mistake_stories (
	id integer primary key auto_increment,
    id_mistake integer,
    id_story integer,
    
    foreign key (id_mistake) references mistakes (id),
    foreign key (id_story) references stories (id)
)
engine = InnoDB;

insert into states (state) values
('New'),
('Opened'),
('Decided'),
('Closed');

insert into urgencies (urgency) values 
('Very urgent'),
('Urgently'),
('Do not rush'),
('Not urgent');

insert into criticalities (criticality) values 
('Emergency'),
('Critical'),
('Not critical'),
('Change request');

insert into acts (act) values
('Input'),
('Opening'),
('Solution'),
('Closure');

insert into users (username, f_name, s_name, password_hash) value
('vovchai', 'Vladimir', 'Ryashentsev', sha('12345'));

insert into mistakes (created_at, short_desc, long_desc, id_user, id_state, id_urgency, id_criticality) values
('2018-10-31 22:54:12', 'Short description', 'Long description', 1, 1, 1, 1),
('2018-10-31 21:00:34', 'Short description v2', 'Long description v2', 1, 2, 3, 4);