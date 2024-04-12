/*

Question: What cities post the top-paying data analyst and business analyst jobs?
- Determine the top 10 job locations with the highest average salaries.
- Why? It provides a detailed look at which cities and states in my desired regions
to target for the highest average salaries.

*/

-- Top Cities based on job count and average salary

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
        (
        -- Include rows where the job location contains a city name along with the state
        job_location LIKE '%, VA' -- Virginia
        OR job_location LIKE '%, TX' -- Texas
        OR job_location LIKE '%, FL' -- Florida
        OR job_location LIKE '%, NC' -- North Carolina
        OR job_location LIKE '%, SC' -- South Carolina
        OR job_location LIKE '%, KY' -- Kentucky
        OR job_location LIKE '%, AR' -- Arkansas
        -- Capture abbreviations and variations
        OR job_location LIKE '%NC%' -- North Carolina
        OR job_location LIKE '%SC%' -- South Carolina
        OR job_location LIKE '%VA%' -- Virginia
        OR job_location LIKE '%KY%' -- Kentucky
        OR job_location LIKE '%AR%' -- Arkansas
        OR job_location LIKE '%FL%' -- Florida
        -- Other variations
        OR job_location LIKE '% N. Carolina%'
        OR job_location LIKE '% S. Carolina%'
        OR job_location LIKE '% Virginia%'
        OR job_location LIKE '% KY%'
        OR job_location LIKE '% AR%'
        OR job_location LIKE '% Fla%'
        -- Exclude cases with only state value
        AND (
            job_location NOT LIKE '%Virginia%'
            AND job_location NOT LIKE '%Texas%'
            AND job_location NOT LIKE '%Florida%'
            AND job_location NOT LIKE '%North Carolina%'
            AND job_location NOT LIKE '%South Carolina%'
            AND job_location NOT LIKE '%Kentucky%'
            AND job_location NOT LIKE '%Arkansas%'
            )
        )
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

- Virginia's Lucrative Markets: Virginia cities like Vienna, McLean,
and Arlington offer lucrative opportunities for Data and Business Analysts,
with average salaries ranging from approximately $96,035 to $121,438.

- Texas' Competitive Landscape: Texas cities such as Plano, Austin, and
Dallas present competitive job markets for analysts, with average salaries
ranging from approximately $91,448 to $106,939, indicative of strong demand
across industries.

- Florida's Diverse Job Landscape: Florida provides diverse job
opportunities for analysts, with cities like Jacksonville, Tampa, and Miami
showcasing vibrant markets, despite varying average salaries ranging from
approximately $64,148 to $102,542.

Top Cities in based on job count and average salary query RESULTS:
[
  {
    "job_count": "11",
    "job_location": "Vienna, VA",
    "avg_sal": "121438"
  },
  {
    "job_count": "20",
    "job_location": "McLean, VA",
    "avg_sal": "116903"
  },
  {
    "job_count": "20",
    "job_location": "Arlington, VA",
    "avg_sal": "108504"
  },
  {
    "job_count": "19",
    "job_location": "Plano, TX",
    "avg_sal": "106939"
  },
  {
    "job_count": "53",
    "job_location": "Jacksonville, FL",
    "avg_sal": "102542"
  },
  {
    "job_count": "82",
    "job_location": "Austin, TX",
    "avg_sal": "97717"
  },
  {
    "job_count": "106",
    "job_location": "Tampa, FL",
    "avg_sal": "97406"
  },
  {
    "job_count": "69",
    "job_location": "Charlotte, NC",
    "avg_sal": "97090"
  },
  {
    "job_count": "14",
    "job_location": "Reston, VA",
    "avg_sal": "96035"
  },
  {
    "job_count": "56",
    "job_location": "Irving, TX",
    "avg_sal": "94764"
  },
  {
    "job_count": "11",
    "job_location": "Herndon, VA",
    "avg_sal": "92988"
  },
  {
    "job_count": "20",
    "job_location": "Fort Lauderdale, FL",
    "avg_sal": "91618"
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
    "job_count": "21",
    "job_location": "Clearwater, FL",
    "avg_sal": "87130"
  },
  {
    "job_count": "12",
    "job_location": "Richardson, TX",
    "avg_sal": "86292"
  },
  {
    "job_count": "65",
    "job_location": "Miami, FL",
    "avg_sal": "85520"
  },
  {
    "job_count": "19",
    "job_location": "Fort Worth, TX",
    "avg_sal": "83779"
  },
  {
    "job_count": "39",
    "job_location": "Orlando, FL",
    "avg_sal": "82468"
  },
  {
    "job_count": "35",
    "job_location": "Columbia, SC",
    "avg_sal": "78598"
  },
  {
    "job_count": "13",
    "job_location": "Arlington, TX",
    "avg_sal": "77269"
  },
  {
    "job_count": "14",
    "job_location": "Greenville, SC",
    "avg_sal": "75686"
  },
  {
    "job_count": "17",
    "job_location": "Tallahassee, FL",
    "avg_sal": "72871"
  },
  {
    "job_count": "15",
    "job_location": "Boca Raton, FL",
    "avg_sal": "68895"
  },
  {
    "job_count": "27",
    "job_location": "Gainesville, FL",
    "avg_sal": "64148"
  }
]
*/
