/*

Question: What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), 
    offering strategic insights for career development in data analysis

*/

-- Optimal Skills (High Pay & High Demand)

WITH top_sal AS (
SELECT
    skills,
    ROUND(AVG(COALESCE(salary_year_avg, salary_hour_avg * 2080))) avg_salary,
    COUNT(*) job_post_count
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
    ROUND(COALESCE(salary_year_avg, salary_hour_avg * 2080)) IS NOT NULL
    AND job_title_short IN ('Data Analyst', 'Business Analyst')
GROUP BY
    skills
)
SELECT
    *
FROM
    top_sal
WHERE
    avg_salary > 80000
    AND job_post_count > 1500
ORDER BY
    avg_salary DESC
;

/*
Python, Tableau, and SQL stand out as being the most optimal 3 skills to learn
if one wants to focus on skills with the highest demand and the highest salaries.

Results:
[
  {
    "skills": "python",
    "avg_salary": "95709",
    "job_post_count": "2960"
  },
  {
    "skills": "tableau",
    "avg_salary": "93859",
    "job_post_count": "3008"
  },
  {
    "skills": "sql",
    "avg_salary": "93079",
    "job_post_count": "5482"
  },
  {
    "skills": "r",
    "avg_salary": "92982",
    "job_post_count": "1649"
  },
  {
    "skills": "power bi",
    "avg_salary": "88421",
    "job_post_count": "1805"
  },
  {
    "skills": "sas",
    "avg_salary": "87466",
    "job_post_count": "1762"
  },
  {
    "skills": "excel",
    "avg_salary": "81057",
    "job_post_count": "4231"
  }
]
*/