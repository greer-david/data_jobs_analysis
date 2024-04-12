/*

Question: What skills are required for the top-paying data analyst and business analyst jobs?
- Use the top 10 highest paying jobs from the first query.
- Add the specific skills required for these roles.
- Why? It provides a detailed look at which high-paying jobs demand certain skills,
    helping job seekers understand which skills to develop that align with top salaries.

*/

WITH top_paying_jobs AS(
    SELECT
        job_id,
        company_id,
        job_title,
        ROUND(COALESCE(salary_year_avg, salary_hour_avg * 2080)) new_salary
    FROM
        job_postings_fact
    WHERE
        job_title_short IN ('Data Analyst', 'Business Analyst')
        AND ROUND(COALESCE(salary_year_avg, salary_hour_avg * 2080)) IS NOT NULL
    ORDER BY
        new_salary DESC
    LIMIT 10
)
SELECT
    tp.job_id,
    c.name company_name,
    job_title,
    new_salary,
    skills,
    type
FROM
    top_paying_jobs tp
JOIN
    skills_job_dim sj
ON
    tp.job_id = sj.job_id
JOIN
    skills_dim s
ON
    sj.skill_id = s.skill_id
JOIN
    company_dim c
ON
    tp.company_id = c.company_id
;

/*
Skills found in the top 10 highest-paid positions query INSIGHTS:

- Programming Languages: SQL, Python, R, and VBA are among the top skills
demanded in these high-paying positions. Proficiency in programming languages
is crucial for performing data analysis, developing analytical solutions,
and automating processes.

- Data Analysis Tools: Tableau, Looker, and Power BI are also prominent skills.
These tools are essential for creating data visualizations and dashboards,
enabling stakeholders to gain insights from data effectively.

- Cloud Technologies: Skills like Databricks, BigQuery, and Snowflake indicate
a growing demand for expertise in cloud-based data platforms. Companies are
increasingly leveraging cloud technologies for data storage, processing,
and analytics.

- Libraries and Frameworks: Libraries such as Spark, Airflow, and Hadoop are
also in demand, reflecting the need for skills in data processing, workflow
management, and distributed computing.

Skills found in the top 10 highest-paid positions query RESULTS:
[
  {
    "job_id": 130031,
    "company_name": "Michael Page International Inc",
    "job_title": "Global Budget Data Analyst",
    "new_salary": "813280",
    "skills": "tableau",
    "type": "analyst_tools"
  },
  {
    "job_id": 130031,
    "company_name": "Michael Page International Inc",
    "job_title": "Global Budget Data Analyst",
    "new_salary": "813280",
    "skills": "looker",
    "type": "analyst_tools"
  },
  {
    "job_id": 155211,
    "company_name": "Apex Systems",
    "job_title": "Data Analyst",
    "new_salary": "504400",
    "skills": "sql",
    "type": "programming"
  },
  {
    "job_id": 155211,
    "company_name": "Apex Systems",
    "job_title": "Data Analyst",
    "new_salary": "504400",
    "skills": "excel",
    "type": "analyst_tools"
  },
  {
    "job_id": 1266769,
    "company_name": "Telus International",
    "job_title": "Remote Online Data Analyst - English (US)",
    "new_salary": "436800",
    "skills": "go",
    "type": "programming"
  },
  {
    "job_id": 209315,
    "company_name": "ЛАНИТ",
    "job_title": "Data base administrator",
    "new_salary": "400000",
    "skills": "oracle",
    "type": "cloud"
  },
  {
    "job_id": 209315,
    "company_name": "ЛАНИТ",
    "job_title": "Data base administrator",
    "new_salary": "400000",
    "skills": "kafka",
    "type": "libraries"
  },
  {
    "job_id": 209315,
    "company_name": "ЛАНИТ",
    "job_title": "Data base administrator",
    "new_salary": "400000",
    "skills": "linux",
    "type": "os"
  },
  {
    "job_id": 209315,
    "company_name": "ЛАНИТ",
    "job_title": "Data base administrator",
    "new_salary": "400000",
    "skills": "git",
    "type": "other"
  },
  {
    "job_id": 209315,
    "company_name": "ЛАНИТ",
    "job_title": "Data base administrator",
    "new_salary": "400000",
    "skills": "svn",
    "type": "other"
  },
  {
    "job_id": 648429,
    "company_name": "Roblox",
    "job_title": "Principal Economist / Scientist",
    "new_salary": "387460",
    "skills": "sql",
    "type": "programming"
  },
  {
    "job_id": 648429,
    "company_name": "Roblox",
    "job_title": "Principal Economist / Scientist",
    "new_salary": "387460",
    "skills": "python",
    "type": "programming"
  },
  {
    "job_id": 648429,
    "company_name": "Roblox",
    "job_title": "Principal Economist / Scientist",
    "new_salary": "387460",
    "skills": "r",
    "type": "programming"
  },
  {
    "job_id": 648429,
    "company_name": "Roblox",
    "job_title": "Principal Economist / Scientist",
    "new_salary": "387460",
    "skills": "go",
    "type": "programming"
  },
  {
    "job_id": 648429,
    "company_name": "Roblox",
    "job_title": "Principal Economist / Scientist",
    "new_salary": "387460",
    "skills": "spark",
    "type": "libraries"
  },
  {
    "job_id": 648429,
    "company_name": "Roblox",
    "job_title": "Principal Economist / Scientist",
    "new_salary": "387460",
    "skills": "airflow",
    "type": "libraries"
  },
  {
    "job_id": 648429,
    "company_name": "Roblox",
    "job_title": "Principal Economist / Scientist",
    "new_salary": "387460",
    "skills": "hadoop",
    "type": "libraries"
  },
  {
    "job_id": 289362,
    "company_name": "Michael Page International Inc",
    "job_title": "Data Analyst",
    "new_salary": "384800",
    "skills": "sql",
    "type": "programming"
  },
  {
    "job_id": 289362,
    "company_name": "Michael Page International Inc",
    "job_title": "Data Analyst",
    "new_salary": "384800",
    "skills": "mysql",
    "type": "databases"
  },
  {
    "job_id": 289362,
    "company_name": "Michael Page International Inc",
    "job_title": "Data Analyst",
    "new_salary": "384800",
    "skills": "databricks",
    "type": "cloud"
  },
  {
    "job_id": 289362,
    "company_name": "Michael Page International Inc",
    "job_title": "Data Analyst",
    "new_salary": "384800",
    "skills": "bigquery",
    "type": "cloud"
  },
  {
    "job_id": 289362,
    "company_name": "Michael Page International Inc",
    "job_title": "Data Analyst",
    "new_salary": "384800",
    "skills": "snowflake",
    "type": "cloud"
  },
  {
    "job_id": 289362,
    "company_name": "Michael Page International Inc",
    "job_title": "Data Analyst",
    "new_salary": "384800",
    "skills": "tableau",
    "type": "analyst_tools"
  },
  {
    "job_id": 289362,
    "company_name": "Michael Page International Inc",
    "job_title": "Data Analyst",
    "new_salary": "384800",
    "skills": "power bi",
    "type": "analyst_tools"
  },
  {
    "job_id": 289362,
    "company_name": "Michael Page International Inc",
    "job_title": "Data Analyst",
    "new_salary": "384800",
    "skills": "looker",
    "type": "analyst_tools"
  },
  {
    "job_id": 1110602,
    "company_name": "Illuminate Mission Solutions",
    "job_title": "HC Data Analyst , Senior",
    "new_salary": "375000",
    "skills": "python",
    "type": "programming"
  },
  {
    "job_id": 1110602,
    "company_name": "Illuminate Mission Solutions",
    "job_title": "HC Data Analyst , Senior",
    "new_salary": "375000",
    "skills": "r",
    "type": "programming"
  },
  {
    "job_id": 1110602,
    "company_name": "Illuminate Mission Solutions",
    "job_title": "HC Data Analyst , Senior",
    "new_salary": "375000",
    "skills": "vba",
    "type": "programming"
  },
  {
    "job_id": 1110602,
    "company_name": "Illuminate Mission Solutions",
    "job_title": "HC Data Analyst , Senior",
    "new_salary": "375000",
    "skills": "excel",
    "type": "analyst_tools"
  },
  {
    "job_id": 1110602,
    "company_name": "Illuminate Mission Solutions",
    "job_title": "HC Data Analyst , Senior",
    "new_salary": "375000",
    "skills": "tableau",
    "type": "analyst_tools"
  }
]
*/