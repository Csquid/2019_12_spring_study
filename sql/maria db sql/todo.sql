create table todo (
    idx int AUTO_INCREMENT,
    PRIMARY KEY(idx)
);

DESC todo;

CREATE TABLE todo_day (
	idx INT AUTO_INCREMENT,
	parent_idx INT,
	FOREIGN KEY(parent_idx) REFERENCES todo(idx),
	PRIMARY KEY(idx)
);

DESC todo_day;

CREATE TABLE parent
(
  id INT NOT NULL,
  PRIMARY KEY(id)
) ENGINE = InnoDB;

CREATE TABLE child
(
  id INT NOT NULL,
  parent_id INT NOT NULL,
  PRIMARY KEY(id),
  INDEX(parent_id),
  FOREIGN KEY(parent_id) REFERENCES parent(id)
) ENGINE = INNODB;