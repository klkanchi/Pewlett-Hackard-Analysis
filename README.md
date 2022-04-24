# Pewlett-Hackard-Analysis

## Overview of the analysis

Bobby's manager wants him to write SQL queries to determine the number of retiring employees per title, and identify employees who are eligible to participate in a mentorship program. Then, he want Bobby to write a report that summarizes the analysis and helps prepare Bobby’s manager for the “silver tsunami” as many current employees reach retirement age.

  With the help of the ERD that was created in the module, create a Retirement Titles table that holds all the titles of current employees who were born between January 1, 1952 and December 31, 1955. Because some employees may have multiple titles in the database—for example, due to promotions we need to use the DISTINCT ON statement to create a table that contains the most recent title of each employee. Then, use the COUNT() function to create a final table that has the number of retirement-age employees by most recent job title.

1. A query is written and executed to create a Retirement Titles table for employees who are born between January 1, 1952 and December 31, 1955
2. The Retirement Titles table is exported as retirement_titles.csv
3. A query is written and executed to create a Unique Titles table that contains the employee number, first and last name, and most recent title.
4. The Unique Titles table is exported as unique_titles.csv
5. A query is written and executed to create a Retiring Titles table that contains the number of titles filled by employees who are retiring.
6. The Retiring Titles table is exported as retiring_titles_count.csv

### Results with detail analysis:
[retirement_titles.csv](https://github.com/klkanchi/Pewlett-Hackard-Analysis/blob/main/Analysis_Projects/Pewlett-Hackard-Analysis/Data/retirement_titles.csv)
[unique_titles.csv](https://github.com/klkanchi/Pewlett-Hackard-Analysis/blob/main/Analysis_Projects/Pewlett-Hackard-Analysis/Data/unique_titles.csv)
[retiring_titles_count.csv](https://github.com/klkanchi/Pewlett-Hackard-Analysis/blob/main/Analysis_Projects/Pewlett-Hackard-Analysis/Data/retiring_titles_count.csv)

**SQL Query**
[Employee_database_challenge.sql](https://github.com/klkanchi/Pewlett-Hackard-Analysis/blob/main/Analysis_Projects/Pewlett-Hackard-Analysis/Queries/Employee_database_challenge.sql)

## Mentorship Eligibility:

Using the ERD as a reference, created a mentorship-eligibility table that holds the current employees who were born between January 1, 1965 and December 31, 1965.

1. A query is written and executed to create a Mentorship Eligibility table for current employees who were born between January 1, 1965 and December 31, 1965.
2. The Mentorship Eligibility table is exported and saved as mentorship_eligibilty.csv

### Results with detail analysis:
A query is written and executed to create a Mentorship Eligibility table for current employees who were born between January 1, 1965 and December 31, 1965.

[Mentorship_eligibility.csv](https://github.com/klkanchi/Pewlett-Hackard-Analysis/blob/main/Analysis_Projects/Pewlett-Hackard-Analysis/Queries/Mentorship_eligibility.csv)

**SQL Query**
[Employee_database_challenge.sql](https://github.com/klkanchi/Pewlett-Hackard-Analysis/blob/main/Analysis_Projects/Pewlett-Hackard-Analysis/Queries/Employee_database_challenge.sql)


## Summary
Provide high-level responses to the following questions, then provide two additional queries or tables that may provide more insight into the upcoming "silver tsunami.":

1) How many roles will need to be filled as the "silver tsunami" begins to make an impact?.

90,398 roles are in urgent need to be filled out as soon as the workforce starts retiring at any given time.

2) Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

No, we have 1,940 employees who are eligible to participate in a mentorship program.
