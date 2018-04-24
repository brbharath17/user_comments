# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Generate Rails 5 / PostgreSQL application with a single page listing comments which can be submitted from the same page. All added comments will be written into database USER_COMMENT table and displayed under added box. Comments can only contain <b> and <i> tags, all other tags must be removed. Comments must be storted by date/time added in descending order. 

 

To make things more interesting, these implementation details must be followed:

 

* No third party gems allowed except bootstrap, jQuery and PG. This also means no external CDN-s

* If IP address is used to post comments more frequently than 5 minutes, only latest comment within this time window will be displayed. 

  Ex. comments are received on the same day (time given in decending order) from the same IP 12:33, 12:32, 12:27, 12:25, 12:21

  only comments at 12:33 12:27 and 12:21 must be displayed. This filtering must be implemented using SQL, not ruby and in-memory nor javascript.

* Bold and italic tags in comment must affect output accordinly, i.e. bold must make text bold and italic italic but only within same comment.

* Form must be submitted via AJAX. CSRF tokens must be checked.

* After form submit entire comments block must be refreshed via AJAX.

 

It is timewise relatively small task (if he knows what he is doing) and at the same time covers full stack from JavaScript/AJAX to database and SQL. Expected time 2Hrs.