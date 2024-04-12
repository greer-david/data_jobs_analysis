/*

Question: What are the most in-demand skills for data analysts and business analysts?
- Join job postings to inner join table similar to query 2
- Identify the top 10 in-demand skills for a data analyst or business analyst.
- Focus on all job postings.
- Why? Retrieves the top 10 skills with the highest demand in the job market, 
    providing insights into the most valuable skills for job seekers.

*/

--Top 10 skills listed for all jobs.

SELECT
    skills,
    COUNT(sj.job_id) skill_cnt
FROM
    job_postings_fact jp
JOIN
    skills_job_dim sj
ON
    jp.job_id = sj.job_id
JOIN
    skills_dim s
ON
    sj.skill_id = s.skill_id
GROUP BY
    skills
ORDER BY
    skill_cnt DESC
LIMIT 10
;

--Top 10 skills listed for Data Analysts and Business Analysts.

SELECT
    skills,
    COUNT(sj.job_id) skill_cnt
FROM
    job_postings_fact jp
JOIN
    skills_job_dim sj
ON
    jp.job_id = sj.job_id
JOIN
    skills_dim s
ON
    sj.skill_id = s.skill_id
WHERE
    job_title_short IN ('Data Analyst','Business Analyst')
GROUP BY
    skills
ORDER BY
    skill_cnt DESC
LIMIT 10
;

/*
Top 10 in demand skills for Data & Business Analysts query INSIGHTS:

- Foundational Skills: SQL, Excel, and Python are the top three in-demand skills,
indicating their importance as foundational skills for data and business analysis
roles. Proficiency in these tools is essential for performing data manipulation,
analysis, and visualization tasks.

- Visualization Tools: Tableau and Power BI rank among the top skills, highlighting
the increasing demand for professionals who can create compelling data visualizations.
This trend reflects the growing importance of data storytelling and visualization in
conveying insights to stakeholders.

- Statistical Analysis: R and SAS, both statistical programming languages, are also
among the top in-demand skills. This suggests that proficiency in statistical analysis
and modeling remains valuable in the field of data and business analysis, particularly
for roles that require advanced analytics capabilities.

Top 10 in demand skills for Data & Business Analysts query RESULTS:
[
  {
    "skills": "sql",
    "skill_cnt": "110000"
  },
  {
    "skills": "excel",
    "skill_cnt": "84165"
  },
  {
    "skills": "python",
    "skill_cnt": "65423"
  },
  {
    "skills": "tableau",
    "skill_cnt": "55878"
  },
  {
    "skills": "power bi",
    "skill_cnt": "48719"
  },
  {
    "skills": "r",
    "skill_cnt": "34110"
  },
  {
    "skills": "sas",
    "skill_cnt": "31672"
  },
  {
    "skills": "powerpoint",
    "skill_cnt": "18439"
  },
  {
    "skills": "word",
    "skill_cnt": "17266"
  },
  {
    "skills": "sap",
    "skill_cnt": "14948"
  }
]
*/