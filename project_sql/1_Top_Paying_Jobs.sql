/*

Question: What are the top-paying data analyst and business analyst jobs?
- Identify the top 15 highest-paying roles that are available in Texas, Mississippi, Tennessee, Alabama, or available remotely.
- Focus on job posting with competitive salaries (also remove nulls).
- Why? Highlight the top-paying opportunities, offering insights into these potential jobs.

*/

-- Determine the relevant columns.

SELECT
    job_id,
    company_id,
    job_title,
    job_location,
    job_schedule_type,
    job_posted_date,
    salary_hour_avg,
    salary_year_avg
FROM
    job_postings_fact
LIMIT 1000
;

-- 10 highest-paid Data and Business Analyst positions based on salary and hourly pay (assuming a 40 hour work week)

SELECT
    job_id,
    company_id,
    job_title,
    job_location,
    job_schedule_type,
    job_posted_date,
    salary_hour_avg,
    salary_year_avg,
    ROUND(COALESCE(salary_year_avg, salary_hour_avg * 2080)) new_salary
FROM
    job_postings_fact
WHERE
    job_title_short IN ('Data Analyst', 'Business Analyst')
    AND ROUND(COALESCE(salary_year_avg, salary_hour_avg * 2080)) IS NOT NULL
ORDER BY
    new_salary DESC
LIMIT 10
;

/*
10 highest-paid Data and Business Analyst positions based on salary and hourly pay (assuming a 40 hour work week) INSIGHTS:

Salary Range: The salaries for these positions range from $375,000 to $813,280 per year. This indicates that these roles are
highly compensated, likely due to the specialized skills, experience, and responsibilities associated with them.

Job Locations: The job locations vary across different cities, including New York, Sunnyvale, Los Angeles, San Mateo,
San Francisco, Bethesda, and Austin. This suggests that high-paying opportunities for Data and Business Analysts are
available in various regions across the United States with most of these regions having a high cost of living.

Industry and Company Diversity: The positions span across different industries and companies, including tech companies,
consulting firms, and healthcare organizations. This diversity reflects the wide range of industries that require skilled
Data and Business Analysts and the opportunities available across various sectors.

10 highest-paid Data and Business Analyst positions based on salary and hourly pay (assuming a 40 hour work week) INSIGHTS:
[
  {
    "job_id": 130031,
    "company_id": 41983,
    "job_title": "Global Budget Data Analyst",
    "job_location": "New York, NY",
    "job_schedule_type": "Contractor",
    "job_posted_date": "2023-04-17 02:59:59",
    "salary_hour_avg": "391.0",
    "salary_year_avg": null,
    "new_salary": "813280"
  },
  {
    "job_id": 226942,
    "company_id": 319998,
    "job_title": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-02-20 15:13:33",
    "salary_hour_avg": null,
    "salary_year_avg": "650000.0",
    "new_salary": "650000"
  },
  {
    "job_id": 155211,
    "company_id": 1364,
    "job_title": "Data Analyst",
    "job_location": "Sunnyvale, CA",
    "job_schedule_type": "Contractor",
    "job_posted_date": "2023-02-06 20:00:59",
    "salary_hour_avg": "242.5",
    "salary_year_avg": null,
    "new_salary": "504400"
  },
  {
    "job_id": 1266769,
    "company_id": 67833,
    "job_title": "Remote Online Data Analyst - English (US)",
    "job_location": "Las Vegas, NV",
    "job_schedule_type": "Part-time",
    "job_posted_date": "2023-03-16 09:01:49",
    "salary_hour_avg": "210.0",
    "salary_year_avg": null,
    "new_salary": "436800"
  },
  {
    "job_id": 568849,
    "company_id": 38585,
    "job_title": "Los Angeles - CA - Data Analyst",
    "job_location": "Los Angeles, CA",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-07-25 20:01:11",
    "salary_hour_avg": "200.0",
    "salary_year_avg": null,
    "new_salary": "416000"
  },
  {
    "job_id": 209315,
    "company_id": 451121,
    "job_title": "Data base administrator",
    "job_location": "Belarus",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-10-03 11:22:20",
    "salary_hour_avg": null,
    "salary_year_avg": "400000.0",
    "new_salary": "400000"
  },
  {
    "job_id": 648429,
    "company_id": 4377,
    "job_title": "Principal Economist / Scientist",
    "job_location": "San Mateo, CA",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-08-23 08:03:55",
    "salary_hour_avg": null,
    "salary_year_avg": "387460.0",
    "new_salary": "387460"
  },
  {
    "job_id": 289362,
    "company_id": 41983,
    "job_title": "Data Analyst",
    "job_location": "San Francisco, CA",
    "job_schedule_type": "Contractor",
    "job_posted_date": "2023-01-15 13:00:42",
    "salary_hour_avg": "185.0",
    "salary_year_avg": null,
    "new_salary": "384800"
  },
  {
    "job_id": 1110602,
    "company_id": 80726,
    "job_title": "HC Data Analyst , Senior",
    "job_location": "Bethesda, MD",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-08-18 07:00:22",
    "salary_hour_avg": null,
    "salary_year_avg": "375000.0",
    "new_salary": "375000"
  },
  {
    "job_id": 229253,
    "company_id": 18439,
    "job_title": "Director of Safety Data Analysis",
    "job_location": "Austin, TX",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-04-21 08:01:55",
    "salary_hour_avg": null,
    "salary_year_avg": "375000.0",
    "new_salary": "375000"
  }
]
*/