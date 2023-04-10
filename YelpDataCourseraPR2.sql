Data Scientist Role Play: Profiling and Analyzing the Yelp Dataset Coursera Worksheet

This is a 2-part assignment. In the first part, you are asked a series of questions that will help you profile and understand the data just like a data scientist would. For this first part of the assignment, you will be assessed both on the correctness of your findings, as well as the code you used to arrive at your answer. You will be graded on how easy your code is to read, so remember to use proper formatting and comments where necessary.

In the second part of the assignment, you are asked to come up with your own inferences and analysis of the data for a particular research question you want to answer. You will be required to prepare the dataset for the analysis you choose to do. As with the first part, you will be graded, in part, on how easy your code is to read, so use proper formatting and comments to illustrate and communicate your intent as required.

For both parts of this assignment, use this "worksheet." It provides all the questions you are being asked, and your job will be to transfer your answers and SQL coding where indicated into this worksheet so that your peers can review your work. You should be able to use any Text Editor (Windows Notepad, Apple TextEdit, Notepad ++, Sublime Text, etc.) to copy and paste your answers. If you are going to use Word or some other page layout application, just be careful to make sure your answers and code are lined appropriately.
In this case, you may want to save as a PDF to ensure your formatting remains intact for you reviewer.



Part 1: Yelp Dataset Profiling and Understanding

1. Profile the data by finding the total number of records for each of the tables below:
	
i. Attribute table = 10000
ii. Business table = 10000
iii. Category table = 10000
iv. Checkin table = 10000
v. elite_years table = 10000
vi. friend table = 10000
vii. hours table = 10000
viii. photo table = 10000
ix. review table = 10000
x. tip table = 10000
xi. user table = 10000
	
	SQL code used to arrive at answer:

		1.i.
			SELECT COUNT(*)
			FROM attribute;
		1.ii.
			SELECT COUNT(*)
			FROM business;
		1.iii.
			SELECT COUNT(*)
			FROM category;
		1.iv.
			SELECT COUNT(*)
			FROM checkin;
		1.v.
			SELECT COUNT(*)
			FROM elite_years;
		1.vi.
			SELECT COUNT(*)
			FROM friend;
		1.vii.
			SELECT COUNT(*)
			FROM hours;
		1.viii.
			SELECT COUNT(*)
			FROM photo;
		1.ix.
			SELECT COUNT(*)
			FROM review;
		1.x.
			SELECT COUNT(*)
			FROM tip;
		1.xi.
			SELECT COUNT(*)
			FROM user;



2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.

i. Business = 10000 (Primary Key: id)
ii. Hours =	1562 (Foreign Key: business_id)
iii. Category = 2643 (Foreign Key: business_id)
iv. Attribute = 1115 (Foreign Key: business_id)
v. Review = 10000 (Primary Key: id), 8090 (Foreign Key: business_id), 9581 (Foreign Key: user_id)
vi. Checkin = 493 (Foreign Key: business_id)
vii. Photo = 10000 (Primary Key: id), 6493 (Foreign Key: business_id)
viii. Tip = 537 (Foreign Key: user_id), 3979 (Foreign Key: business_id)
ix. User = 10000 (Primary Key: id)
x. Friend = 11 (Foreign Key: user_id)
xi. Elite_years = 2780 (Foreign Key: user_id)

Note: Primary Keys are denoted in the ER-Diagram with a yellow key icon.	

	SQL code used to arrive at answer:

		2.i.
			SELECT COUNT (DISTINCT id)
			FROM business;
		2.ii.
			SELECT COUNT (DISTINCT business_id)
			FROM hours;
		2.iii.
			SELECT COUNT (DISTINCT business_id)
			FROM category;
		2.iv.
			SELECT COUNT (DISTINCT business_id)
			FROM attribute;
		2.v.
			SELECT COUNT (DISTINCT id),
				   COUNT (DISTINCT business_id),
				   COUNT (DISTINCT user_id)
			FROM review;

		2.vi.
			SELECT COUNT (DISTINCT business_id)
			FROM checkin;
		2.vii.
			SELECT COUNT (DISTINCT id),
				   COUNT (DISTINCT business_id)
			FROM photo;
		2.viii.
			SELECT COUNT (DISTINCT user_id),
				   COUNT (DISTINCT business_id)
			FROM tip;
		2.ix.
			SELECT COUNT (DISTINCT id)
			FROM user;
		2.x.
			SELECT COUNT (DISTINCT user_id)
			FROM friend;
		2.xi.
			SELECT COUNT (DISTINCT user_id)
			FROM ellite_years;



3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

	Answer: No
	
	
	SQL code used to arrive at answer:
		SELECT COUNT(CASE WHEN id IS NULL THEN 1 ELSE NULL END) AS id_null_count,
			   COUNT(CASE WHEN name IS NULL THEN 1 ELSE NULL END) AS name_null_count,
			   COUNT(CASE WHEN review_count IS NULL THEN 1 ELSE NULL END) AS review_null_count,
			   COUNT(CASE WHEN yelping_since IS NULL THEN 1 ELSE NULL END) AS yelping_null_count,
			   COUNT(CASE WHEN useful IS NULL THEN 1 ELSE NULL END) AS useful_null_count,
			   COUNT(CASE WHEN funny IS NULL THEN 1 ELSE NULL END) AS funny_null_count,
			   COUNT(CASE WHEN cool IS NULL THEN 1 ELSE NULL END) AS cool_null_count,
			   COUNT(CASE WHEN fans IS NULL THEN 1 ELSE NULL END) AS fans_null_count,
			   COUNT(CASE WHEN average_stars IS NULL THEN 1 ELSE NULL END) AS avg_stars_null_count,
			   COUNT(CASE WHEN compliment_hot IS NULL THEN 1 ELSE NULL END) AS c_hot_null_count,
			   COUNT(CASE WHEN compliment_more IS NULL THEN 1 ELSE NULL END) AS c_more_null_count,
			   COUNT(CASE WHEN compliment_profile IS NULL THEN 1 ELSE NULL END) AS c_profile_null_count,
			   COUNT(CASE WHEN compliment_cute IS NULL THEN 1 ELSE NULL END) AS c_cute_null_count,
			   COUNT(CASE WHEN compliment_list IS NULL THEN 1 ELSE NULL END) AS c_list_null_count,
			   COUNT(CASE WHEN compliment_note IS NULL THEN 1 ELSE NULL END) AS c_note_null_count,
			   COUNT(CASE WHEN compliment_plain IS NULL THEN 1 ELSE NULL END) AS c_plain_null_count,
			   COUNT(CASE WHEN compliment_cool IS NULL THEN 1 ELSE NULL END) AS c_cool_null_count,
			   COUNT(CASE WHEN compliment_funny IS NULL THEN 1 ELSE NULL END) AS c_funny_null_count,
			   COUNT(CASE WHEN compliment_writer IS NULL THEN 1 ELSE NULL END) AS c_writer_null_count,
			   COUNT(CASE WHEN compliment_photos IS NULL THEN 1 ELSE NULL END) AS c_photos_null_count
		FROM user;

	

4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

	i. Table: Review, Column: Stars
	
		min: 1		max: 5		avg: 3.7082
		
		SQL code used to arrive at answer:
			SELECT MIN(stars) AS min_stars,
				   MAX(stars) AS max_stars,
				   AVG(stars) AS avg_stars
			FROM review;
	
	ii. Table: Business, Column: Stars
	
		min: 1		max: 5		avg: 3.6549
		
		SQL code used to arrive at answer:
			SELECT MIN(stars) AS min_stars,
				   MAX(stars) AS max_stars,
				   AVG(stars) AS avg_stars
			FROM business;
				
	iii. Table: Tip, Column: Likes
	
		min: 0		max: 2		avg: 0.0144
		
		SQL code used to arrive at answer:
			SELECT MIN(likes) AS min_likes,
				   MAX(likes) AS max_likes,
				   AVG(likes) AS avg_likes
			FROM tip;
	
	iv. Table: Checkin, Column: Count
	
		min: 1		max: 53		avg: 1.9414
		
		SQL code used to arrive at answer:
			SELECT MIN(count) AS min_count,
				   MAX(count) AS max_count,
				   AVG(count) AS avg_count
			FROM checkin;

	v. Table: User, Column: Review_count
	
		min: 0		max: 2000		avg: 24.2995
		
		SQL code used to arrive at answer:
			SELECT MIN(review_count) AS min_review_count,
				   MAX(review_count) AS max_review_count,
				   AVG(review_count) AS avg_review_count
			FROM user;



5. List the cities with the most reviews in descending order:

	SQL code used to arrive at answer:
		SELECT city,
			   SUM(review_count) AS total_reviews
		FROM business
		GROUP BY city
		ORDER BY total_reviews DESC;
	
	Copy and Paste the Result Below:
	+-----------------+---------------+
	| city            | total_reviews |
	+-----------------+---------------+
	| Las Vegas       |         82854 |
	| Phoenix         |         34503 |
	| Toronto         |         24113 |
	| Scottsdale      |         20614 |
	| Charlotte       |         12523 |
	| Henderson       |         10871 |
	| Tempe           |         10504 |
	| Pittsburgh      |          9798 |
	| Montréal        |          9448 |
	| Chandler        |          8112 |
	| Mesa            |          6875 |
	| Gilbert         |          6380 |
	| Cleveland       |          5593 |
	| Madison         |          5265 |
	| Glendale        |          4406 |
	| Mississauga     |          3814 |
	| Edinburgh       |          2792 |
	| Peoria          |          2624 |
	| North Las Vegas |          2438 |
	| Markham         |          2352 |
	| Champaign       |          2029 |
	| Stuttgart       |          1849 |
	| Surprise        |          1520 |
	| Lakewood        |          1465 |
	| Goodyear        |          1155 |
	+-----------------+---------------+
	(Output limit exceeded, 25 of 362 total rows shown)


	
6. Find the distribution of star ratings to the business in the following cities:

i. Avon

	SQL code used to arrive at answer:
		SELECT stars AS star_rating,
			   COUNT(*) AS business_count
		FROM business
		WHERE city = 'Avon'
		GROUP BY stars;

	Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):
		+-------------+----------------+
		| star_rating | business_count |
		+-------------+----------------+
		|         1.5 |              1 |
		|         2.5 |              2 |
		|         3.5 |              3 |
		|         4.0 |              2 |
		|         4.5 |              1 |
		|         5.0 |              1 |
		+-------------+----------------+

ii. Beachwood

	SQL code used to arrive at answer:
		SELECT stars AS star_rating,
			   COUNT(*) AS business_count
		FROM business
		WHERE city = 'Beachwood'
		GROUP BY stars;

	Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):
		+-------------+----------------+
		| star_rating | business_count |
		+-------------+----------------+
		|         2.0 |              1 |
		|         2.5 |              1 |
		|         3.0 |              2 |
		|         3.5 |              2 |
		|         4.0 |              1 |
		|         4.5 |              2 |
		|         5.0 |              5 |
		+-------------+----------------+



7. Find the top 3 users based on their total number of reviews:
		
	SQL code used to arrive at answer:
		SELECT name,
			   review_count
		FROM user
		ORDER BY review_count DESC
		LIMIT 3;

	Copy and Paste the Result Below:
		+--------+--------------+
		| name   | review_count |
		+--------+--------------+
		| Gerald |         2000 |
		| Sara   |         1629 |
		| Yuri   |         1339 |
		+--------+--------------+


8. Does posting more reviews correlate with more fans?

	Please explain your findings and interpretation of the results:
	
	Posting more reviews does NOT correlate with more fans. Ordering the users descending by the amount of fans we can see that 
	Amy, the user with more fans (503) has posted 609 reviews. Compared to other users with fewer fans but more reviews posted. For example 
	the user Gerald is the one with more reviews posted (2000), more than triple than Amy did but has half of the fan base (253).
	We can also seee the case of Yuri who posted 1339 reviews and the fan base is of 76. Compared to Nicole that has almost the same 
	fan base (73) but only posted 161 reviews. That is why there is NO correlation between reviews posted and the amount of fans. 

	SQL code used to arrive at answer:
		SELECT name,
			   review_count,
			   fans
		FROM user
		ORDER BY fans DESC;

		+-----------+--------------+------+
		| name      | review_count | fans |
		+-----------+--------------+------+
		| Amy       |          609 |  503 |
		| Mimi      |          968 |  497 |
		| Harald    |         1153 |  311 |
		| Gerald    |         2000 |  253 |
		| Christine |          930 |  173 |
		| Lisa      |          813 |  159 |
		| Cat       |          377 |  133 |
		| William   |         1215 |  126 |
		| Fran      |          862 |  124 |
		| Lissa     |          834 |  120 |
		| Mark      |          861 |  115 |
		| Tiffany   |          408 |  111 |
		| bernice   |          255 |  105 |
		| Roanna    |         1039 |  104 |
		| Angela    |          694 |  101 |
		| .Hon      |         1246 |  101 |
		| Ben       |          307 |   96 |
		| Linda     |          584 |   89 |
		| Christina |          842 |   85 |
		| Jessica   |          220 |   84 |
		| Greg      |          408 |   81 |
		| Nieves    |          178 |   80 |
		| Sui       |          754 |   78 |
		| Yuri      |         1339 |   76 |
		| Nicole    |          161 |   73 |
		+-----------+--------------+------+
		(Output limit exceeded, 25 of 10000 total rows shown)


	
9. Are there more reviews with the word "love" or with the word "hate" in them?

	Answer:

	There are more comments containing the word 'Love'.

	+------------+------------+
	| love_count | hate_count |
	+------------+------------+
	|       1780 |        232 |
	+------------+------------+
	
	SQL code used to arrive at answer:
		SELECT SUM(CASE WHEN text LIKE '%love%' THEN 1 ELSE 0 END) AS love_count,
		       SUM(CASE WHEN text LIKE '%hate%' THEN 1 ELSE 0 END) AS hate_count
		FROM review;


	
10. Find the top 10 users with the most fans:

	SQL code used to arrive at answer:
		SELECT name,
			   fans
		FROM user
		ORDER BY fans DESC
		LIMIT 10;
	
	Copy and Paste the Result Below:
	+-----------+------+
	| name      | fans |
	+-----------+------+
	| Amy       |  503 |
	| Mimi      |  497 |
	| Harald    |  311 |
	| Gerald    |  253 |
	| Christine |  173 |
	| Lisa      |  159 |
	| Cat       |  133 |
	| William   |  126 |
	| Fran      |  124 |
	| Lissa     |  120 |
	+-----------+------+
	
		

Part 2: Inferences and Analysis

1. Pick one city and category of your choice and group the businesses in that city and category by their overall star rating. Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.

	City: Phoenix
	Category: Food

    	+-------+----------------------------------------+---------+----------+
		| stars | name                                   | city    | category |
		+-------+----------------------------------------+---------+----------+
		|   2.5 | Safeway Food & Drug                    | Phoenix | Food     |
		|   3.0 | Starbucks                              | Phoenix | Food     |
		|   4.0 | Bootleggers Modern American Smokehouse | Phoenix | Food     |
		|   5.0 | Water N Ice                            | Phoenix | Food     |
		+-------+----------------------------------------+---------+----------+


i. Do the two groups you chose to analyze have a different distribution of hours?
	
	For 2 of the businesses (one of each group) there is no information about the hours. So we are left with one business in the 2-3 stars group (Starbucks) and one in the 4-5 stars group (Bootleggers Modern American Smokehouse).
	Both open 7 days of the week. Starbucks opens early morning at 5 am closing at 8 pm (15 hours open) whereas Bootleggers Modern American Smokehouse opens close to noon at 11 am and closes at 10 pm (11 hours open).
	Although there is a difference in the distributionof the hours we can''t say there is a correlation between the star rating and the hours distribution for a couple of reasons.
	First of all the sample is too small and there is no information for half of the businesses. And on the other hand Starbucks and Bootleggers Modern American Smokehouse are both in the Food category but they are in different subcategories, Starbucks being a cafe and Bootleggers a steakhouse.
	It is expected for them to open in different hours.

	+--------------+-------+----------------------------------------+-----------------------+------+
	| rating_group | stars | name                                   |                 hours |  DOW |
	+--------------+-------+----------------------------------------+-----------------------+------+
	| 2-3 stars    |   2.5 | Safeway Food & Drug                    |                  None | None |
	| 4-5 stars    |   5.0 | Water N Ice                            |                  None | None |
	| 2-3 stars    |   3.0 | Starbucks                              |     Monday|5:00-20:00 |    1 |
	| 4-5 stars    |   4.0 | Bootleggers Modern American Smokehouse |    Monday|11:00-22:00 |    1 |
	| 2-3 stars    |   3.0 | Starbucks                              |    Tuesday|5:00-20:00 |    2 |
	| 4-5 stars    |   4.0 | Bootleggers Modern American Smokehouse |   Tuesday|11:00-22:00 |    2 |
	| 2-3 stars    |   3.0 | Starbucks                              |  Wednesday|5:00-20:00 |    3 |
	| 4-5 stars    |   4.0 | Bootleggers Modern American Smokehouse | Wednesday|11:00-22:00 |    3 |
	| 2-3 stars    |   3.0 | Starbucks                              |   Thursday|5:00-20:30 |    4 |
	| 4-5 stars    |   4.0 | Bootleggers Modern American Smokehouse |  Thursday|11:00-22:00 |    4 |
	| 2-3 stars    |   3.0 | Starbucks                              |     Friday|5:00-20:00 |    5 |
	| 4-5 stars    |   4.0 | Bootleggers Modern American Smokehouse |    Friday|11:00-22:00 |    5 |
	| 2-3 stars    |   3.0 | Starbucks                              |   Saturday|5:00-20:00 |    6 |
	| 4-5 stars    |   4.0 | Bootleggers Modern American Smokehouse |  Saturday|11:00-22:00 |    6 |
	| 2-3 stars    |   3.0 | Starbucks                              |     Sunday|5:00-20:00 |    7 |
	| 4-5 stars    |   4.0 | Bootleggers Modern American Smokehouse |    Sunday|11:00-22:00 |    7 |
	+--------------+-------+----------------------------------------+-----------------------+------+

ii. Do the two groups you chose to analyze have a different number of reviews?
	
	In the group of 4-5 stars there is the business with the most amount of reviews which is Bootleggers with 431 but at the same time there is Water N Ice with the least amount of reviews which has only 4, and 5 stars.
	I would think that Water N Ice is a newer business compared to the rest.
	For the group of 2-3 stars we have Starbucks with 3 stars and 52 reviews and Safeway Food & Drug with 2.5 stars and 14 reviews.

    +--------------+-------+----------------------------------------+--------------+
	| rating_group | stars | name                                   | review_count |
	+--------------+-------+----------------------------------------+--------------+
	| 4-5 stars    |   4.0 | Bootleggers Modern American Smokehouse |          431 |
	| 2-3 stars    |   3.0 | Starbucks                              |           52 |
	| 2-3 stars    |   2.5 | Safeway Food & Drug                    |           14 |
	| 4-5 stars    |   5.0 | Water N Ice                            |            4 |
	+--------------+-------+----------------------------------------+--------------+

iii. Are you able to infer anything from the location data provided between these two groups? Explain.
	
	There is no information about the neighborhoods but we can check their Postal Code.
	Every business is in a different Postal Code area. I don''t know Phoenix to know what kind of neighborhood they are located in.
	Checking the Zip Codes in Google Maps I could see that Safeway Food & Drug (2.5 stars) and Water N Ice (5 stars) are no to far away from eachother.
	Bootleggers (4 stars) is a bit more far away from the ones I just metioned, and Starbucks (3 stars) is actually far away from all of them.

	+--------------+-------+----------------------------------------+--------------+-------------+
	| rating_group | stars | name                                   | neighborhood | postal_code |
	+--------------+-------+----------------------------------------+--------------+-------------+
	| 2-3 stars    |   2.5 | Safeway Food & Drug                    |              | 85053       |
	| 2-3 stars    |   3.0 | Starbucks                              |              | 85048       |
	| 4-5 stars    |   4.0 | Bootleggers Modern American Smokehouse |              | 85028       |
	| 4-5 stars    |   5.0 | Water N Ice                            |              | 85029       |
	+--------------+-------+----------------------------------------+--------------+-------------+

SQL code used for analysis:
1.
	SELECT stars,
	       name,
	       city,
	       category
	FROM business
	JOIN category ON id = business_id
	WHERE city = 'Phoenix'
	    AND category = 'Food'
	ORDER BY stars;

1.i.
	SELECT CASE
				WHEN B.stars BETWEEN 2 AND 3.5 THEN '2-3 stars'
				WHEN B.stars BETWEEN 4 AND 5 THEN '4-5 stars'
				END AS rating_group,
		   b.stars,
		   b.name,
		   h.hours,
		   CASE
				WHEN hours LIKE "%monday%" THEN 1
				WHEN hours LIKE "%tuesday%" THEN 2
				WHEN hours LIKE "%wednesday%" THEN 3
				WHEN hours LIKE "%thursday%" THEN 4
				WHEN hours LIKE "%friday%" THEN 5
				WHEN hours LIKE "%saturday%" THEN 6
				WHEN hours LIKE "%sunday%" THEN 7
				END AS DOW
	FROM business b
	LEFT JOIN category c ON b.id = c.business_id
	LEFT JOIN hours h ON c.business_id = h.business_id
	WHERE b.city = 'Phoenix'
	    AND c.category = 'Food'
	ORDER BY DOW, rating_group;

1.ii.
	SELECT CASE
				WHEN B.stars BETWEEN 2 AND 3.5 THEN '2-3 stars'
				WHEN B.stars BETWEEN 4 AND 5 THEN '4-5 stars'
				END AS rating_group,
		   b.stars,
		   b.name,
		   b.review_count,
	FROM business b
	LEFT JOIN category c ON b.id = c.business_id
	WHERE b.city = 'Phoenix'
	    AND c.category = 'Food'
	ORDER BY review_count DESC;

1.iii.
	SELECT CASE
				WHEN B.stars BETWEEN 2 AND 3.5 THEN '2-3 stars'
				WHEN B.stars BETWEEN 4 AND 5 THEN '4-5 stars'
				END AS rating_group,
		   b.stars,
		   b.name,
		   b.neighborhood,
		   b.postal_code
	FROM business b
	LEFT JOIN category c ON b.id = c.business_id
	WHERE b.city = 'Phoenix'
		    AND c.category = 'Food'
	ORDER BY rating_group, stars;


		
2. Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? List at least two differences and the SQL code you used to arrive at your answer.
		
		+--------+------------------+---------------+-------------+-----------+
		| status | businesses_count | total_reviews | avg_reviews | avg_stars |
		+--------+------------------+---------------+-------------+-----------+
		| OPEN   |             8480 |        269300 |        31.8 |       3.7 |
		| CLOSED |             1520 |         35261 |        23.2 |       3.5 |
		+--------+------------------+---------------+-------------+-----------+

i. Difference 1:

	The businesses that are still open have more reviews. Open businesses have an average of 31.8 reviews compared to the 23.2 on average for the closes businesses.

ii. Difference 2:
	
	The average rating for open businessesis also higher than the closed ones. 3.7 stars on average for open businesses to 3.5 stars on average for closed businesses.
         
SQL code used for analysis:
	SELECT CASE
		   		WHEN is_open = 1 THEN 'OPEN'
				WHEN is_open = 0 THEN 'CLOSED'
				ELSE NULL
		   END AS status,
		   COUNT(DISTINCT(id)) AS businesses_count,
		   SUM(review_count) AS total_reviews,
		   ROUND(AVG(review_count), 1) AS avg_reviews,
		   ROUND(AVG(stars), 1) AS avg_stars
	FROM business
	GROUP BY is_open, status
	ORDER BY is_open DESC;
	


3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.

Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:
	
i. Indicate the type of analysis you chose to do:
         
	I want to know if there is a category that is reviewed the most and if there is a correlation in the amount of businesses in that category with the amount of reviews and stars.

ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:
                           
	To perform the analysis I need to group the records by category, count how many busines are in that category, add the amount of reviews and calculate de average of reviews and stars per category.

iii. Output of your finished dataset:

	The category 'Restaurants' is by far the most reviewed among the yelpers. And we see as well that there are other categories like 'Food', 'Sandwiches', 'Specialty Food', 'Chinese', etc. that are at the top of re review ranking. There is a clear preference on reviewing categories related with food and eating out.
	We can say there is a correlation between the amount of businesses and the amount of reviews posted. The top 6 categories are the ones the most businesses in that category.
	But in terms of aveverage amount of comments in relation with the amount of businesses we see that categories with few businesses have the biggerst average.
	In relation to the average star rating there is no correlation to be indentified.

	+------------------------+----------------+---------------+-------------+-----------+
	| category               | business_count | total_reviews | avg_reviews | avg_stars |
	+------------------------+----------------+---------------+-------------+-----------+
	| Restaurants            |             71 |          4504 |        63.4 |       3.5 |
	| Food                   |             23 |          1781 |        77.4 |       3.8 |
	| Nightlife              |             20 |          1351 |        67.6 |       3.5 |
	| Bars                   |             17 |          1322 |        77.8 |       3.5 |
	| American (Traditional) |             11 |          1128 |       102.5 |       3.8 |
	| Shopping               |             30 |           977 |        32.6 |       4.0 |
	| Sandwiches             |              8 |           974 |       121.8 |       3.9 |
	| Specialty Food         |              5 |           896 |       179.2 |       4.0 |
	| Chinese                |              4 |           796 |       199.0 |       3.1 |
	| Asian Fusion           |              2 |           793 |       396.5 |       3.5 |
	| Soup                   |              2 |           789 |       394.5 |       3.8 |
	| Noodles                |              2 |           773 |       386.5 |       3.3 |
	| Malaysian              |              1 |           768 |       768.0 |       4.0 |
	| Taiwanese              |              1 |           768 |       768.0 |       4.0 |
	| Ethnic Food            |              2 |           726 |       363.0 |       4.0 |
	| Farmers Market         |              1 |           723 |       723.0 |       4.5 |
	| Fruits & Veggies       |              1 |           723 |       723.0 |       4.5 |
	| Market Stalls          |              1 |           723 |       723.0 |       4.5 |
	| Meat Shops             |              1 |           723 |       723.0 |       4.5 |
	| Public Markets         |              1 |           723 |       723.0 |       4.5 |
	| Seafood Markets        |              1 |           723 |       723.0 |       4.5 |
	| Barbeque               |              2 |           505 |       252.5 |       3.8 |
	| American (New)         |              6 |           481 |        80.2 |       3.3 |
	| Smokehouse             |              1 |           431 |       431.0 |       4.0 |
	| Salad                  |              2 |           396 |       198.0 |       4.5 |
	+------------------------+----------------+---------------+-------------+-----------+
	(Output limit exceeded, 25 of 712 total rows shown)

iv. Provide the SQL code you used to create your final dataset:
	SELECT c.category,
		   COUNT(DISTINCT b.id) AS business_count,
		   SUM(b.review_count) AS total_reviews,
		   ROUND(AVG(b.review_count), 1) AS avg_reviews,
		   ROUND(AVG(b.stars), 1) AS avg_stars
	FROM category c
	LEFT JOIN business b ON c.business_id = b.id
	GROUP BY c.category
	ORDER BY total_reviews DESC;