drop table bookmarks;
create table bookmarks (
  id serial8 primary key,
  name varchar(255) not null,
  URL text,
  genre VARCHAR(255) not null,
);


insert into bookmarks (name) values ('NAME');
  insert into bookmarks (url) values ('URL');
insert into bookmarks (genre) values ('GENRE');

insert into bookmarks (name, URL, description) values ('The Guardian', 'www.theguardian.com' 'News website');
  insert into bookmarks (name, URL, description) values ('BBC', 'www.bbc.co.uk/news' 'Also a news website');
