create table roles(
role_id SERIAL not null,
name varchar(20) not null,
primary key(role_id)
);
create table Permissions(
Permission_id SERIAL not null,
Permission varchar(20) not null,
primary key(Permission_id)
);
CREATE TABLE rolePermissions (
  rolePermissions_id SERIAL NOT NULL,
  role_id INT,
  permission_id INT,
  FOREIGN KEY (role_id) REFERENCES roles(role_id),
  FOREIGN KEY (permission_id) REFERENCES Permissions(Permission_id),
  PRIMARY KEY (rolePermissions_id)
);
CREATE TABLE users (
user_id SERIAL NOT NULL,
user_name varchar (255),
first_name varchar (255),
last_name varchar(255),
email varchar(255) UNIQUE,
password varchar(255),
country varchar(255),
birth_date date,
profile_image text DEFAULT 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQinMNf_Hjwf-aKigY4eASZhdz3F1WxJBIbuQ&s',
bio varchar(255),
created_at timestamp default now(),
role_id integer,
is_deleted smallint default 0,
type varchar(100) default 'user' ,
foreign KEY(role_id) references roles(role_id),
PRIMARY KEY (user_id)
);
CREATE TABLE courses (
course_id SERIAL NOT NULL,
company varchar (255),
instructors integer ,
price varchar(255),
time date,
rete integer,
language varchar(255),
course_image text,
description varchar(255),
created_at timestamp default now(),
is_deleted smallint default 0,
foreign KEY(instructors) references users(user_id),
PRIMARY KEY (course_id)
);
CREATE TABLE course_content (
course_content_id SERIAL NOT NULL,
course_id integer ,
course_type varchar (255),
instructors integer ,
time date,
rate integer,
course_description varchar(255),
is_deleted smallint default 0,
foreign KEY(course_id) references courses(course_id),
foreign KEY(instructors) references users(user_id),
PRIMARY KEY (course_content_id)
);
CREATE TABLE notifications (
notification_id SERIAL NOT NULL,
user_id integer ,
event varchar(255) ,
time date,
is_deleted smallint default 0,
foreign KEY(user_id) references users(user_id),
PRIMARY KEY (notification_id)
);
CREATE TABLE messages (
message_id SERIAL NOT NULL,
sender integer ,
receiver integer ,
message text ,
time date,
is_deleted smallint default 0,
foreign KEY(sender) references users(user_id),
foreign KEY(receiver) references users(user_id),
PRIMARY KEY (message_id)
);
CREATE TABLE comments (
comment_id SERIAL NOT NULL,
commenter integer ,
course_id integer ,
comment text ,
time date,
is_deleted smallint default 0,
foreign KEY(commenter) references users(user_id),
foreign KEY(course_id) references courses(course_id),
PRIMARY KEY (comment_id)
);
CREATE TABLE rates (
rate_id SERIAL NOT NULL,
user_id integer ,
course_id integer ,
rate integer ,
time date,
is_deleted smallint default 0,
foreign KEY(user_id) references users(user_id),
foreign KEY(course_id) references courses(course_id),
PRIMARY KEY (rate_id)
);
CREATE TABLE instructor_rates (
instructor_rate_id SERIAL NOT NULL,
user_id integer ,
instructor_id integer ,
rate integer ,
time date,
is_deleted smallint default 0,
foreign KEY(user_id) references users(user_id),
foreign KEY(instructor_id) references users(user_id),
PRIMARY KEY (instructor_rate_id)
);
CREATE TABLE saves (
save_id SERIAL NOT NULL,
user_id integer ,
course_id integer ,
time date,
is_deleted smallint default 0,
foreign KEY(user_id) references users(user_id),
foreign KEY(course_id) references courses(course_id),
PRIMARY KEY (save_id)
);
CREATE TABLE images (
image_id SERIAL NOT NULL,
image_text text ,
PRIMARY KEY (image_id)
);