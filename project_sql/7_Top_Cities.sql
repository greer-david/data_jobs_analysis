/*

Question: What cities post the top-paying data analyst and business analyst jobs?
- Determine the top 10 job locations with the highest average salaries.
- Why? It provides a detailed look at which cities and states in my desired regions
to target for the highest average salaries.

*/

-- Top Cities in based on job count and average salary (Turns out Texas is significantly better than the other states)

SELECT *
FROM(
    SELECT
        COUNT(*) job_count,
        job_location,
        ROUND(AVG(salary_year_avg)) avg_sal
    FROM
        job_postings_fact
    WHERE
        job_title_short IN ('Data Analyst','Business Analyst') AND
        (job_location LIKE '%Mississippi%'
        OR job_location LIKE '%Alabama%'
        OR job_location LIKE '%Texas%'
        OR job_location LIKE '%Tennessee%'
        OR job_location LIKE '%MS%'
        OR job_location LIKE '%AL%'
        OR job_location LIKE '%TN%'
        OR job_location LIKE '%TX%')
        AND salary_year_avg IS NOT NULL
    GROUP BY
        job_location
)
WHERE
    job_count > 9
ORDER BY
    avg_sal DESC
;

/*
Top Cities in based on job count and average salary query INSIGHTS:

High Average Salaries in Texas: Several cities in Texas, including Plano,
Austin, Irving, San Antonio, and Dallas, have some of the highest average
salaries for Data and Business Analyst positions. This suggests that Texas 
offers lucrative opportunities for professionals in this field, with average
salaries ranging from approximately $77,269 to $106,939.

Concentration of Jobs in Texas: The majority of the cities with high average
salaries are located in Texas, indicating a concentration of job opportunities
for Data and Business Analysts in the state. This concentration may be
attributed to factors such as the presence of major industries, technology
hubs, and growing demand for data-driven insights and analysis in various sectors.

Variability in Job Counts: While cities like Austin and Dallas have a high number
of job postings (82 and 95 respectively), others like Plano and Birmingham have
fewer postings (19 and 11 respectively). This variability in job counts suggests
differences in demand for Data and Business Analysts across different cities,
influenced by factors such as local economies, industry presence, and workforce
dynamics.

Top Cities in based on job count and average salary query RESULTS:
[
  {
    "job_count": "19",
    "job_location": "Plano, TX",
    "avg_sal": "106939"
  },
  {
    "job_count": "82",
    "job_location": "Austin, TX",
    "avg_sal": "97717"
  },
  {
    "job_count": "56",
    "job_location": "Irving, TX",
    "avg_sal": "94764"
  },
  {
    "job_count": "49",
    "job_location": "San Antonio, TX",
    "avg_sal": "91540"
  },
  {
    "job_count": "95",
    "job_location": "Dallas, TX",
    "avg_sal": "91448"
  },
  {
    "job_count": "11",
    "job_location": "Birmingham, AL",
    "avg_sal": "87073"
  },
  {
    "job_count": "12",
    "job_location": "Richardson, TX",
    "avg_sal": "86292"
  },
  {
    "job_count": "31",
    "job_location": "Texas",
    "avg_sal": "85436"
  },
  {
    "job_count": "19",
    "job_location": "Fort Worth, TX",
    "avg_sal": "83779"
  },
  {
    "job_count": "13",
    "job_location": "Arlington, TX",
    "avg_sal": "77269"
  }
]
*/
