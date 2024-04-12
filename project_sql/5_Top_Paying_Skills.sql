/*

Question: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and 
    helps identify the most financially rewarding skills to acquire or improve

*/

-- Top 10 paying skills for all job postings

SELECT
    skills,
    ROUND(AVG(COALESCE(salary_year_avg, salary_hour_avg * 2080))) avg_salary
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
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 10
;

-- Top 10 paying skills for Data & Business Analysts

SELECT
    skills,
    ROUND(AVG(COALESCE(salary_year_avg, salary_hour_avg * 2080))) avg_salary
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
ORDER BY
    avg_salary DESC
LIMIT 10
;

/*
Top 10 paying skills for Data & Business Analysts query INSIGHTS:

- Emerging Technologies: The prevalence of skills related to emerging technologies like blockchain (Solidity)
and cloud computing (DigitalOcean) indicates a growing demand for expertise in cutting-edge tools and platforms.

- Specialized Tools: Skills in specialized tools such as automated machine learning (DataRobot) and version
control (SVN) highlight the importance of proficiency in niche areas, suggesting a willingness among companies to
pay a premium for specialized skills.

- Salary Range: The average salaries for these top paying skills range from approximately $136,000 to $246,586.
This indicates a significant potential for high earning within the data and business analysis field, especially
for those with expertise in niche or in-demand areas.

Top 10 paying skills for Data & Business Analysts query RESULTS:
[
  {
    "skills": "svn",
    "avg_salary": "246586"
  },
  {
    "skills": "solidity",
    "avg_salary": "179000"
  },
  {
    "skills": "couchbase",
    "avg_salary": "160515"
  },
  {
    "skills": "datarobot",
    "avg_salary": "155486"
  },
  {
    "skills": "golang",
    "avg_salary": "155000"
  },
  {
    "skills": "digitalocean",
    "avg_salary": "147680"
  },
  {
    "skills": "dplyr",
    "avg_salary": "147633"
  },
  {
    "skills": "clojure",
    "avg_salary": "140400"
  },
  {
    "skills": "twilio",
    "avg_salary": "138500"
  },
  {
    "skills": "mxnet",
    "avg_salary": "136000"
  }
]
*/