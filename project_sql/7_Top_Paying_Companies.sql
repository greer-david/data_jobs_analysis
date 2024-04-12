/*

Question: What companies post the top-paying data analyst and business analyst jobs?
- Use the top 10 highest paying jobs from the first query.
- Determine the top 10 companies with the highest average salaries.
- Why? It provides a detailed look at which high-paying companies and industries
  job-seekers should target.

*/

-- Top 10 companies based on average salary for Data & Business Analysts(Minimum of 15 job postings)

SELECT
    c.name company_name,
    COUNT(*) job_post_cnt,
    ROUND(AVG(COALESCE(salary_year_avg, salary_hour_avg * 2080))) avg_salary
FROM
    company_dim c
JOIN
    job_postings_fact jp
ON
    c.company_id = jp.company_id
WHERE
    COALESCE(salary_year_avg, salary_hour_avg * 2080) IS NOT NULL
    AND job_title_short IN ('Data Analyst', 'Business Analyst')
GROUP BY
    company_name
HAVING
    COUNT(*) >= 15
ORDER BY
    avg_salary DESC
LIMIT 10
;

/*
We see some industry leaders in pay and job postings below:
- Tech/social media industry: TikTok
- Finance/insurance industry: Citigroup/Citi, USAA, and TIAA
- Various recruiting/consulting companies: Net2Source, Motion Recruitment, Harnham, Modis, and Apex Systems

Query Results:
[
  {
    "company_name": "TikTok",
    "job_post_cnt": "48",
    "avg_salary": "155527"
  },
  {
    "company_name": "Citigroup, Inc",
    "job_post_cnt": "15",
    "avg_salary": "144701"
  },
  {
    "company_name": "USAA",
    "job_post_cnt": "20",
    "avg_salary": "131141"
  },
  {
    "company_name": "TIAA",
    "job_post_cnt": "26",
    "avg_salary": "127930"
  },
  {
    "company_name": "Net2Source Inc.",
    "job_post_cnt": "15",
    "avg_salary": "122584"
  },
  {
    "company_name": "Citi",
    "job_post_cnt": "102",
    "avg_salary": "117339"
  },
  {
    "company_name": "Motion Recruitment",
    "job_post_cnt": "47",
    "avg_salary": "117069"
  },
  {
    "company_name": "Harnham",
    "job_post_cnt": "17",
    "avg_salary": "115647"
  },
  {
    "company_name": "Modis",
    "job_post_cnt": "23",
    "avg_salary": "108823"
  },
  {
    "company_name": "Apex Systems",
    "job_post_cnt": "53",
    "avg_salary": "107971"
  }
]
*/